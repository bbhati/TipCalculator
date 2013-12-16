//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Bhagyashree Shekhawat on 12/15/13.
//  Copyright (c) 2013 Bhagyashree. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *tipSelector;
@property (weak, nonatomic) IBOutlet UILabel *defaultTipLabel;

- (IBAction)valueChanged:(id)sender;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self valueChanged:self.tipSelector];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillDisappear:(BOOL)animated{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:(int)self.tipSelector.value forKey:@"tip_percent"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"tip_percent"];
    if(intValue){
        self.tipSelector.value = intValue;
        NSString* stringval = [NSString stringWithFormat:@"%d", intValue];
        stringval = [stringval stringByAppendingString:@"%"];
        [self.defaultTipLabel setText:stringval];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChanged:(UIStepper *)sender {
    double value = [sender value];
    NSString* stringval = [NSString stringWithFormat:@"%d", (int)value];
    stringval = [stringval stringByAppendingString:@"%"];
    [self.defaultTipLabel setText:stringval];
}
@end
