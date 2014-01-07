//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Priyanka Bhalerao on 1/6/14.
//  Copyright (c) 2014 iOSClass. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize tipVals =  _tipVals;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Load our NSArray object
    
    _tipVals = [[NSArray alloc] initWithObjects:@"10",@"15",@"20", nil];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"tip_val"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerView methods 
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _tipVals.count;
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_tipVals objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //This will be called when user selects from the Picker View
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    switch (row) {
        case 0:
            [defaults setInteger:0 forKey:@"tip_val"];
            [defaults synchronize];
            break;
        case 1:
            [defaults setInteger:1 forKey:@"tip_val"];
            [defaults synchronize];
            break;
        case 2:
            [defaults setInteger:2 forKey:@"tip_val"];
            [defaults synchronize];
            break;
        default:
            break;
    }
}


@end
