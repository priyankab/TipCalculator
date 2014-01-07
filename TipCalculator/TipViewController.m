//
//  TipViewController.m
//  TipCalculator
//
//  Created by Priyanka Bhalerao on 1/5/14.
//  Copyright (c) 2014 iOSClass. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegmentControl;

- (IBAction)onTapAction:(id)sender; //Compile time thing that helps Xcode understand that this event is Compile time. You want to link this event to actions in your class
- (void) updateValues;
- (void) onSettingsButton;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Y! Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapAction:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    float billValue = [self.billTextField.text floatValue];
    //its like .floatValue() in Java
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.2)];
    float tipValue = billValue * [tipValues[self.tipSegmentControl.selectedSegmentIndex] floatValue];
    float totalValue = billValue + tipValue ;
    
    
    //Putting the calculated values back into the labels
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipValue];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalValue];
    
}
- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intTipValue = [defaults integerForKey:@"tip_val"];
    self.tipSegmentControl.selectedSegmentIndex = intTipValue;
    [self updateValues];
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}
@end
