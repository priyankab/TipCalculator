//
//  SettingsViewController.h
//  TipCalculator
//
//  Created by Priyanka Bhalerao on 1/6/14.
//  Copyright (c) 2014 iOSClass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>



@property (weak, nonatomic) IBOutlet UIPickerView *TipPicker;
@property (strong,nonatomic) NSArray *tipVals;

@end
