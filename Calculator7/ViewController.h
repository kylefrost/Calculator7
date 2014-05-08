//
//  ViewController.h
//  Calculator7
//
//  Created by Kyle Frost on 5/7/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController {
    
    IBOutlet NSTextField *calculatorScreen;
    float result;
    float originalNumber;
    float currentNumber;
    NSInteger currentOperation;
    
}

-(IBAction)pressOperation:(id)sender;
-(IBAction)pressEqual:(id)sender;

-(IBAction)pressNumber:(id)sender;

-(IBAction)pressClear:(id)sender;
-(IBAction)pressNegative:(id)sender;
-(IBAction)pressPercent:(id)sender;

-(IBAction)pressDecimal:(id)sender;

-(IBAction)clickCloseButton:(id)sender;
-(IBAction)clickMinimizeButton:(id)sender;

@end
