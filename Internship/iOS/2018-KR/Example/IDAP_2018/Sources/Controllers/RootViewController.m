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

@end

static NSString * kManual = @"manual";
static NSString * kSemiautomatic = @"semiautomatic";


@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ConverterViewController *destinationVC = ((ConverterViewController *)segue.destinationViewController);
    
    if ([segue.identifier isEqualToString:kManual]) {
        destinationVC.manual = YES;
    } else if ([segue.identifier isEqualToString:kSemiautomatic]) {
        destinationVC.manual = NO;
    }
    
}

@end
