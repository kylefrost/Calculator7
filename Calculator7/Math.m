//
//  Math.m
//  Calculator7
//
//  Created by Kyle Frost on 5/7/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

#import "Math.h"

@implementation Math

+(float)add:(float)current to:(float)original {
    
    NSInteger result;
    
    result = current + original;
    
    return result;
}

+(float)multiply:(float)current to:(float)original {
    
    NSInteger result;
    
    result = current * original;
    
    return result;
}

+(float)divide:(float)current from:(float)original {
    
    NSInteger result;
    
    result = original / current;
    
    return result;
}

+(float)subtract:(float)current from:(float)original {
    
    NSInteger result;
    
    result = original - current;
    
    return result;
}

+(float)changeSymbol:(float)input {
    
    NSInteger output;
    
    if (input > 0) {
        output = input * -1;
    }
    
    else if (input == 0) {
        output = 0;
    }
    
    else if (input < 0) {
        output = input * -1;
    }
    
    return output;
}

+(float)makePercentange:(float)input {
    
    float output;
    
    output = input / 100;
    
    return output;
}

@end
