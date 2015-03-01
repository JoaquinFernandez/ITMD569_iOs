//
//  DetailViewController.m
//  iOsProject
//
//  Created by G.6 on 3/20/13.
//  Copyright (c) 2013 G.6. All rights reserved.
//

#import "DetailViewController.h"

#import "Movies.h"

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setSighting:(Movies *)newMovie {
    if (_movie != newMovie) {
        _movie = newMovie;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    
    Movies *theMovie = self.movie;
    
    if (theMovie) {
        
        self.movieTitleLabel.text = theMovie.title;
        self.movieRatingLabel.text = theMovie.rating;
        self.movieSynopsisLabel.text = theMovie.synopsis;
        self.movieImageView.image = theMovie.image;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
