//
//  MasterViewController.m
//  iOsProject
//
//  Created by G.6 on 3/20/13.
//  Copyright (c) 2013 G.6. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "Movies.h"

#import "SBJson.h"






@class MovieDetailController;

@implementation MasterViewController

//  When called, retrieves the movie info from the JSON provider and creates an array of movie objects with this info, assings it to the
//  screen and updates the data so it can be shown 
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.masterMovieList = [[NSMutableArray alloc] init];
    
    NSError *error = nil;
    NSString *movieUrl = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=f3nf55g8ezu9d8tvwrth9256";
    NSString *output = [NSString stringWithContentsOfURL:[NSURL URLWithString:movieUrl] encoding:NSASCIIStringEncoding error:&error];
    NSArray *moviesJSON = [[output JSONValue] objectForKey:@"movies"];
    
    for (int i = 0; i < [moviesJSON count]; i++) {
        dispatch_queue_t progressQueue = dispatch_queue_create("EasyBlocks.progress", NULL);
        
        dispatch_async(progressQueue, ^{
            NSDictionary *movie = [moviesJSON objectAtIndex:i];
            Movies *newMovie = [self retrieveMovie:i movieDictionary:movie];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.masterMovieList addObject:newMovie];
                //Reload tableView data so it displays the new buildings
                self.tableView.reloadData;
            });
        });
    }
}
// Internal function that returns a movie object with the JSON dictionary passed as parameters after retrieving the desired info
- (Movies *)retrieveMovie:(NSUInteger)theIndex movieDictionary:(NSDictionary*)movie {
    
    NSString *title = [movie objectForKey:@"title"];
    NSString *synopsis = [movie objectForKey:@"synopsis"];
    
    NSDictionary *releaseDates = [movie objectForKey:@"release_dates"];
    NSString *releaseDate = @"In Theaters: ";
    releaseDate = [releaseDate stringByAppendingString:[releaseDates objectForKey:@"theater"]];
    
    NSDictionary *ratings = [movie objectForKey:@"ratings"];
    NSString *rating = @"Rating: ";
    rating = [rating stringByAppendingString:[[ratings objectForKey:@"audience_score"] stringValue]];
    
    NSDictionary *posters = [movie objectForKey:@"posters"];
    NSString *poster = [posters objectForKey:@"detailed"];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:poster]];
    UIImage *image = [UIImage imageWithData:imageData];
    
    Movies *movieObject = [[Movies alloc] initWithName:title rating:rating synopsis:synopsis image:image releaseDate:releaseDate];

    return movieObject;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self countOfList];
}

//Creates a cell with the movie information (title and release date) for the table view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView];
    static NSString *CellIdentifier = @"MovieCell";
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    Movies *movieAtIndex = [self objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:movieAtIndex.title];
    [[cell detailTextLabel] setText:movieAtIndex.releaseDate];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

//When calling the other view (detailView) pass the movie object
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"MovieDetails"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.movie = [self objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

//Set the information of the field masterMovieList
- (void)setMasterMovieList:(NSMutableArray *)newList {
    if (_masterMovieList != newList) {
        _masterMovieList = [newList mutableCopy];
    }
}


- (NSUInteger)countOfList {
    return [self.masterMovieList count];
}

- (Movies *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterMovieList objectAtIndex:theIndex];
}


- (void)addMovieWithSighting:(Movies *)movie {
    [self.masterMovieList addObject:movie];
}

@end
