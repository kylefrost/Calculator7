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
    
    if (currentOperation == 1) {           // Addition
        [self plusSmall];
        [self minusBig];
        [self multBig];
        [self divBig];
    }
    else if (currentOperation == 2) {      // Subtraction
        [self minusSmall];
        [self plusBig];
        [self multBig];
        [self divBig];
    }
    else if (currentOperation == 3) {      // Multiplication
        [self multSmall];
        [self plusBig];
        [self minusBig];
        [self divBig];
    }
    else if (currentOperation == 4) {      // Division
        [self divSmall];
        [self plusBig];
        [self minusBig];
        [self multBig];
    }
    
    isNewNumber = 0;
}

-(IBAction)pressEqual:(id)sender {
    
    if (currentOperation == 1) {           // Addition
        result = [Math add:currentNumber to:originalNumber];
        [self plusBig];
        NSLog(@"Add");
    }
    else if (currentOperation == 2) {      // Subtraction
        result = [Math subtract:currentNumber from:originalNumber];
        [self minusBig];
        NSLog(@"Subtract");
    }
    else if (currentOperation == 3) {      // Multiplication
        result = [Math multiply:currentNumber to:originalNumber];
        [self multBig];
        NSLog(@"Multiply");
    }
    else if (currentOperation == 4) {      // Division
        result = [Math divide:currentNumber from:originalNumber];
        [self divBig];
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
    [self plusBig];
    [self minusBig];
    [self multBig];
    [self divBig];
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

-(IBAction)clickHelp:(id)sender {
    
    NSAlert *myAlert = [[NSAlert alloc] init];
    [myAlert setInformativeText:@"You really need help for a calculator?"];
    [myAlert setMessageText:@"So..."];
    [myAlert addButtonWithTitle:@"Uh..."];
    [myAlert runModal];
    
}

/**** Button Sizes ****/

-(void)plusSmall {
    NSRect newRect = [self.plusButton frame];
    
    newRect.size.height = 67;
    newRect.size.width = 67;
    newRect.origin.x = 245;
    newRect.origin.y = 87;
    
    self.plusButton.frame = newRect;

}
-(void)plusBig {
    NSRect newRect = [self.plusButton frame];
    
    newRect.size.height = 80;
    newRect.size.width = 80;
    newRect.origin.x = 238;
    newRect.origin.y = 80;
    
    self.plusButton.frame = newRect;
}

-(void)minusSmall {
    NSRect newRect = [self.minusButton frame];
    
    newRect.size.height = 67;
    newRect.size.width = 67;
    newRect.origin.x = 245;
    newRect.origin.y = 166;
    
    self.minusButton.frame = newRect;
}
-(void)minusBig {
    NSRect newRect = [self.minusButton frame];
    
    newRect.size.height = 80;
    newRect.size.width = 80;
    newRect.origin.x = 238;
    newRect.origin.y = 159;
    
    self.minusButton.frame = newRect;
}

-(void)multSmall {
    NSRect newRect = [self.multButton frame];
    
    newRect.size.height = 67;
    newRect.size.width = 67;
    newRect.origin.x = 245;
    newRect.origin.y = 245;
    
    self.multButton.frame = newRect;
}
-(void)multBig {
    NSRect newRect = [self.multButton frame];
    
    newRect.size.height = 80;
    newRect.size.width = 80;
    newRect.origin.x = 238;
    newRect.origin.y = 238;
    
    self.multButton.frame = newRect;
}

-(void)divSmall {
    NSRect newRect = [self.divButton frame];
    
    newRect.size.height = 67;
    newRect.size.width = 67;
    newRect.origin.x = 245;
    newRect.origin.y = 324;
    
    self.divButton.frame = newRect;
}
-(void)divBig {
    NSRect newRect = [self.divButton frame];
    
    newRect.size.height = 80;
    newRect.size.width = 80;
    newRect.origin.x = 238;
    newRect.origin.y = 317;
    
    self.divButton.frame = newRect;
}

@end
