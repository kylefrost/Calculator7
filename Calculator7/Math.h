//
//  Math.h
//  Calculator7
//
//  Created by Kyle Frost on 5/7/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Math : NSObject

+(float)add:(float)current to:(float)original;

+(float)multiply:(float)current to:(float)original;

+(float)divide:(float)current from:(float)original;

+(float)subtract:(float)current from:(float)original;

+(float)changeSymbol:(float)input;

+(float)makePercentange:(float)input;

@end
