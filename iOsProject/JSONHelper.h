//
//  JSONHelper.h
//  BuildingDetails
//
//  Created by G.6 on 3/20/13.
//  Copyright (c) 2013 G.6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONHelper : NSObject


+ (NSDictionary *)JSONget:(NSString *)query;
+ (NSString *)JSONgetString:(NSString *)query;
+ (NSString *)JSONpostString:(NSString *)query;
+(NSString *)JSONpostString:(NSString *)query
                   withData:(NSString *)jsonData;

@end
