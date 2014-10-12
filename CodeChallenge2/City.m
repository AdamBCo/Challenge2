//
//  City.m
//  CodeChallenge2
//
//  Created by Adam Cooper on 10/10/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "City.h"

@implementation City

-(void)createString{
    NSString *city = self.cityName;
    NSString *url = @"http://en.wikipedia.org/wiki/";
    NSString *cityURL = [city stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString *urlString = [url stringByAppendingString:cityURL];
    [self.delegate passURLString:urlString];
}



@end
