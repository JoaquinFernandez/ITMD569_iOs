//
//  JSONHelper.m
//  BuildingDetails
//
//  Created by G.6 on 3/20/13.
//  Copyright (c) 2013 G.6. All rights reserved.
//

#import "JSONHelper.h"

@implementation JSONHelper



//returns a dictionar from a get request
+ (NSDictionary *)JSONget:(NSString *)query
{
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] : nil;
    if (error) NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
    return results;
}

//returns JSON string from get request
+(NSString *)JSONgetString:(NSString *)query{
    
	NSString* searchURL = [NSString stringWithFormat:query];
	
	NSError* error = nil;               //error for NSUSRLConnection
	NSURLResponse* response = nil;
	NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
	
	NSURL* URL = [NSURL URLWithString:searchURL];
	[request setURL:URL];
	[request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
	[request setTimeoutInterval:30];
	
	NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
	if (error)
	{
		NSLog(@"Error performing request %@", searchURL);
		return 0;
	}
    
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"jsonString:%@", jsonString);
    return jsonString;
}

+(NSString *)JSONpostString:(NSString *)query{
	NSString* searchURL = [NSString stringWithFormat:query];
	
	NSError* error = nil;
	NSURLResponse* response = nil;
	NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
	
	NSURL* URL = [NSURL URLWithString:searchURL];
    [request addValue: @"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
	[request setURL:URL];
	[request setTimeoutInterval:30];
	
	NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
	if (error)
	{
		NSLog(@"Error performing request %@", searchURL);
		return 0;
	}
    
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"jsonString:%@", jsonString);
    return jsonString;
}

+(NSString *)JSONpostString:(NSString *)query
                   withData:(NSString *)jsonData
{
	NSString* searchURL = [NSString stringWithFormat:query];
	
	NSError* error = nil;
	NSURLResponse* response = nil;
	NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
	
	NSURL* URL = [NSURL URLWithString:searchURL];
    [request addValue: @"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPMethod:@"POST"];
	[request setURL:URL];
	
	[request setTimeoutInterval:30];
    NSData* requestData = [jsonData dataUsingEncoding:NSUTF8StringEncoding];
    [request addValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:requestData];
	
	NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
	if (error)
	{
		NSLog(@"Error performing request %@", searchURL);
		return 0;
	}
    
	NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"jsonString:%@", jsonString);
    return jsonString;
}






@end
