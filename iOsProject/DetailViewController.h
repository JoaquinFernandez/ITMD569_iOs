//
//  DetailViewController.h
//  iOsProject
//
//  Created by G.6 on 3/20/13.
//  Copyright (c) 2013 G.6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) Movies *movie;

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieRatingLabel;
@property (weak, nonatomic) IBOutlet UITextView *movieSynopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;

- (void)configureView;

@end
