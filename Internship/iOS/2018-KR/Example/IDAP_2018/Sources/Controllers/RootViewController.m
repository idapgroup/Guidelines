//
//  RootViewController.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 03.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "RootViewController.h"

#import "ConverterViewController.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cardinalLabel;
@property (weak, nonatomic) IBOutlet UILabel *ordinalLabel;

@property (weak, nonatomic) IBOutlet UISwitch *ordinalSwitch;

@end

static NSString * kManual = @"manual";
static NSString * kSemiautomatic = @"semiautomatic";

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ordinalMode:self.ordinalSwitch];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ConverterViewController *destinationVC = ((ConverterViewController *)segue.destinationViewController);
    destinationVC.ordinal = self.ordinalSwitch.on;
    
    if ([segue.identifier isEqualToString:kManual]) {
        destinationVC.manual = YES;
    } else if ([segue.identifier isEqualToString:kSemiautomatic]) {
        destinationVC.manual = NO;
    }
    
}
- (IBAction)ordinalMode:(UISwitch *)sender {
    self.ordinalLabel.enabled = sender.on;
    self.cardinalLabel.enabled = !sender.on;
}

@end
