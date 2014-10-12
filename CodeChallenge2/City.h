//
//  City.h
//  CodeChallenge2
//
//  Created by Adam Cooper on 10/10/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CityDelegate

-(void)passURLString:(NSString *)urlString;

@end


@interface City : NSObject

@property NSString *cityName;
@property NSString *stateName;
@property NSString *website;
@property UIImage *cityImage;
@property id<CityDelegate> delegate;

-(void)createString;


@end
