//
//  TipViewController.m
//  TipCalculator
//
//  Created by Bhagyashree Shekhawat on 12/15/13.
//  Copyright (c) 2013 Bhagyashree. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billText;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"tip_percent"];
    NSArray *tipPercent =@[@(10), @(15), @(20)];
    self.tipControl.selectedSegmentIndex = [tipPercent indexOfObject:@(intValue)];
    self.billText.text = @"";
    [self updateValues];
}
- (void)viewDidLoad
{
    NSLog(@"view did load");
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues{
    float billAmount = [self.billText.text floatValue];
    NSArray *tipPercent =@[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipPercent[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];

}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
