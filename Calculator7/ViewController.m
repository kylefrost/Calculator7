//
//  ViewController.m
//  Calculator7
//
//  Created by Kyle Frost on 5/7/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.window.backgroundColor = [NSColor whiteColor];
    }
    return self;
}

-(IBAction)clickCloseButton:(id)sender {
    
    [self.view.window close];
    
}

-(IBAction)clickMinimizeButton:(id)sender {
    
    [self.view.window miniaturize:sender];
    
}

@end
