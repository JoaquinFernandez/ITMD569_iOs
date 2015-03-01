//
//  AppDelegate.h
//  iOsProject
//
//  Created by G.6 on 3/20/13.
//  Copyright (c) 2013 G.6. All rights reserved.
//  This is a movie object that holds the information about each movie 

#import <Foundation/Foundation.h>

@interface Movies : NSObject


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *synopsis;
@property (nonatomic, copy) UIImage *image;
@property (nonatomic, copy) NSString *releaseDate;


-(id) initWithName:(NSString *)title rating:(NSString *)rating synopsis:(NSString *)synopsis image:(UIImage *)image releaseDate:(NSString *)releaseDate;


@end
