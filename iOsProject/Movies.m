//
//  AppDelegate.h
//  iOsProject
//
//  Created by G.6 on 3/20/13.
//  Copyright (c) 2013 G.6. All rights reserved.
//

#import "Movies.h"

@implementation Movies

//Initialize with given parameters
-(id) initWithName:(NSString *)title rating:(NSString *)rating synopsis:(NSString *)synopsis image:(UIImage *)image releaseDate:(NSString *)releaseDate {
    self = [super init];
    if (self) {
        _title = title;
        _rating = rating;
        _synopsis = synopsis;
        _image = image;
        _releaseDate = releaseDate;
        return self;
    }
    return nil;
}

@end
