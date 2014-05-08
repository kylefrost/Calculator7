//
//  ViewController.m
//  Calculator7
//
//  Created by Kyle Frost on 5/7/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

#import "ViewController.h"
#import "Math.h"

@interface ViewController () {
    
    NSInteger isNewNumber;
    
}

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.window.backgroundColor = [NSColor whiteColor];
        isNewNumber = 0;
    }
    return self;
}

-(IBAction)pressNumber:(id)sender {
    
    if (isNewNumber != 0) {
        currentNumber = currentNumber*10 + (float)[sender tag];
        [calculatorScreen setStringValue:[NSString stringWithFormat:@"%g", currentNumber]];
    }
    else {
        currentNumber = 0;
        currentNumber = currentNumber*10 + [sender tag];
        [calculatorScreen setStringValue:[NSString stringWithFormat:@"%g", currentNumber]];
        isNewNumber = 1;
    }
}

-(IBAction)pressOperation:(id)sender {
    
    currentOperation = [sender tag];
    
    originalNumber = currentNumber;
    
    isNewNumber = 0;
}

-(IBAction)pressEqual:(id)sender {
    
    if (currentOperation == 1) {           // Addition
        result = [Math add:currentNumber to:originalNumber];
        NSLog(@"Add");
    }
    else if (currentOperation == 2) {      // Subtraction
        result = [Math subtract:currentNumber from:originalNumber];
        NSLog(@"Subtract");
    }
    else if (currentOperation == 3) {      // Multiplication
        result = [Math multiply:currentNumber to:originalNumber];
        NSLog(@"Multiply");
    }
    else if (currentOperation == 4) {      // Division
        result = [Math divide:currentNumber from:originalNumber];
        NSLog(@"Divide");
    }
    
    [calculatorScreen setStringValue:[NSString stringWithFormat:@"%g", result]];
    
    currentOperation = 0;
    isNewNumber = 0;
    
    NSLog(@"\n\ncurrentNumber: %g\nresult: %g\ncurrentOperation: %ld\noriginalNumber: %g\n\n", currentNumber, result, (long)currentOperation, originalNumber);
}

-(IBAction)pressClear:(id)sender {
    [calculatorScreen setStringValue:@"0"];
    currentNumber = 0;
    currentOperation = 0;
    originalNumber = 0;
    result = 0;
}

-(IBAction)pressNegative:(id)sender {
    float currentFloat = [calculatorScreen floatValue];
    
    if (originalNumber == 0) {
        originalNumber = [Math changeSymbol:currentFloat];
        [calculatorScreen setStringValue:[NSString stringWithFormat:@"%g", originalNumber]];
    }
    else {
        currentNumber = [Math changeSymbol:currentFloat];
        [calculatorScreen setStringValue:[NSString stringWithFormat:@"%g", currentNumber]];
    }
}

-(IBAction)pressPercent:(id)sender {
    
    float currentInteger = [calculatorScreen floatValue];
    
    float newFloat = [Math makePercentange:currentInteger];
    
    currentNumber = newFloat;
    
    [calculatorScreen setStringValue:[NSString stringWithFormat:@"%g", newFloat]];
    
    isNewNumber = 0;
}

-(IBAction)pressDecimal:(id)sender {
    
    
}


-(IBAction)clickCloseButton:(id)sender {
    
    [self.view.window close];
    [NSApp terminate:self];
    
}

-(IBAction)clickMinimizeButton:(id)sender {
    
    [self.view.window miniaturize:sender];
    
}

@end
