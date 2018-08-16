//
//  ConverterViewController.m
//  IDAP_test
//
//  Created by Yevhen Triukhan on 26.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "ConverterViewController.h"

#import "Converter.h"

#import "GlobalKeys.h"


@interface ConverterViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *deLabel;
@property (weak, nonatomic) IBOutlet UILabel *enLabel;
@property (weak, nonatomic) IBOutlet UILabel *uaLabel;

@property (weak, nonatomic) IBOutlet UITextView *numberTextView;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *randNumberLabel;

@property (strong, nonatomic) Converter *converter;
@end

@implementation ConverterViewController
#pragma mark -
#pragma mark Accessors
- (Converter *)converter {
    if (!_converter) {
        _converter = [Converter new];
        _converter.ordinal = YES;
    }
    
    return _converter;
}


#pragma mark -
#pragma mark View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Private API
- (void)setupViews {
    self.containerView.hidden = self.isManual;
    self.numberTextView.hidden = !self.isManual;
    self.numberTextView.userInteractionEnabled = self.isManual;
    
    self.enLabel.text = self.uaLabel.text = self.deLabel.text = kEMPTY_STRING;
    
    if (self.isManual) {
        [self.numberTextView becomeFirstResponder];
    } else {
        self.maxLabel.text = [self formattedStringFromInteger:self.slider.value];
        [self.numberTextView resignFirstResponder];
    }

}

- (void)convertNumber:(NSInteger)number {
    self.converter.localeID = kDE;
    self.deLabel.text = [self.converter stringFromNumber:number];
    self.converter.localeID = kEN;
    self.enLabel.text = [self.converter stringFromNumber:number];
    self.converter.localeID = kUA;
    self.uaLabel.text = [self.converter stringFromNumber:number];
}



- (NSString *)formattedStringFromInteger:(NSInteger)number {
    NSNumber *temp = [NSNumber numberWithLongLong:number];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    return [formatter stringFromNumber:temp];
}

//  MARK: UI Actions
//  current max limit
- (IBAction)valueChanged:(UISlider *)sender {
    NSInteger value = (NSInteger)sender.value;
    self.maxLabel.text = [self formattedStringFromInteger:value];
}

- (IBAction)generate:(UIButton *)sender {
    NSInteger number = arc4random_uniform(self.slider.value);
    self.randNumberLabel.text = [self formattedStringFromInteger:number];
//    self.numberTextView.text = [NSString stringWithFormat:@"%ld", (long)number];
    [self convertNumber:number];
}

#pragma mark -
#pragma mark UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    [self convertNumber:textView.text.integerValue];
}


@end
