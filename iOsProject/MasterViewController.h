//
//  MasterViewController.h
//  iOsProject
//
//  Created by G.6 on 3/20/13.
//  Copyright (c) 2013 G.6. All rights reserved.
//
//  This controller manages the main screen where the titles of the movie and the realease date in theaters
//  and its interaction with the detail view controller

#import <UIKit/UIKit.h>
#import "Movies.h"

@class MovieDetailController;

@interface MasterViewController : UITableViewController

@property (nonatomic, copy) NSMutableArray *masterMovieList;

- (NSUInteger)countOfList;
- (Movies *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addMovie:(Movies *)movie;


@end
