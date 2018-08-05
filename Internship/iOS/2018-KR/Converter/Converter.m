//
//  Converter.m
//  IDAP_test
//
//  Created by Yevhen Triukhan on 26.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "Converter.h"

#import "Numerals.h"
#import "NumeralsFormatter.h"
#import "Matcher.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"


@interface Converter()

@property (strong, nonatomic) Matcher *matcher;

@end

@implementation Converter

#pragma mark -
#pragma mark Initialization
- (instancetype)init {
    self = [super init];
    if (self) {
        _ordinal = NO;
        _localeID = kEN;
        _shortScale = YES;
        
        _matcher = [Matcher defaultMatcher];
        _matcher.localeID = _localeID;
        _matcher.shortScale = _shortScale;
    }
    
    return self;
}

- (instancetype)initWithFormatter:(NumeralsFormatter *)formatter {
    if ([formatter isKindOfClass:[NumeralsFormatter class]]) {
        self = [super init];
        
        if (self) {
            _ordinal = NO;
            _localeID = formatter.localeID;
            _shortScale = formatter.numerals.shortScale;
            
            _matcher = [Matcher new];  //  empty
            [_matcher addFormatter:formatter];
        }
    } else {
        return nil;
    }
    
    return self;
}

- (NSArray<NSString *> *)availableLocaleID {
    return self.matcher.availableLocaleID;
}

#pragma mark -
#pragma mark Accessors
- (void)setLocaleID:(NSString *)localeID {
    if(_localeID != localeID) {
        
        _matcher.localeID = _localeID = localeID;
    }
}

- (void)setShortScale:(BOOL)shortScale {
    if (_shortScale != shortScale) {
        _shortScale = shortScale;
        _matcher.shortScale = _shortScale = shortScale;
    }
}
#pragma mark -
#pragma mark Public API

- (void)addFormatter:(NumeralsFormatter *)formatter {
    
    if (formatter) {
        [self.matcher addFormatter:formatter];
    }
    self.localeID = self.matcher.localeID;
}

- (void)removeFormatterWithLocale:(NSString *)localeID {
    BOOL success = [self.matcher removeFormatterWithLocale:localeID];
    
    if (success) {
        self.localeID = self.matcher.localeID;
    }
}

- (NSString *)stringFromNumber:(long long)number {
    
    if (number > QUADRILLION)  return @"number larger than limit";
    if (number < 0)            return @"converter doesn't support negative numbers";
    
    NSString *result = [self convertNumber:number];
    
    return result;
}

- (NSString *)stringFromNumber:(long long)number withLocale:(NSLocale *)locale {
    NSString *localeIdentifier = locale.localeIdentifier;
    NSArray *keys = [self availableLocaleID];
    NSString *result = nil;

    for (NSString *key in keys) {
        //  only language designator
        if ([localeIdentifier hasPrefix:key]) {
            NSString *currentLocaleID = self.localeID;
            self.localeID = key;
            result = [self stringFromNumber:number];
            self.localeID = currentLocaleID;
        }
    }
    
    return result;
}

#pragma mark -
#pragma mark Private API
- (NSString *)convertNumber:(long long)number {
    NSString *result = nil;
    long long tempNumber = number;
    
    result = [self.matcher starterFormatter:number];
    
    if (!result) {
        result = kEMPTY_STRING;
        
        for (NSInteger idx = 0; tempNumber > 0; idx++, tempNumber /= THOUSAND) {
            NSInteger threeDigits = tempNumber % THOUSAND;
            NSString *threeDigitsString = kEMPTY_STRING;
            
            if (threeDigits > 0) {
                long long multiplier = (long long)pow((double)THOUSAND, (double)idx);
                
                
                threeDigitsString = [self threeDigitParser:threeDigits multiplier:multiplier];
                
                if (multiplier >= THOUSAND) {
                    NSString *largeNumberString = [self.matcher largeNumbersForMultiplier:multiplier
                                                                                 quantity:threeDigits];
                    
                    threeDigitsString = [threeDigitsString stringByAppendingString:largeNumberString];
                }
                
            }
            //  накопление результата 1 миллион + 100 тысяч + 200
            result = [threeDigitsString stringByAppendingString:result];
        }
 
    }
    
    if(self.isOrdinal) {
        result = [self.matcher ordinalFormatter:number withString:result];
    }
    
    return [self.matcher finishingFormatter:number withString:result];
}

- (NSString *)threeDigitParser:(NSInteger)number multiplier:(NSInteger)multiplier{
    NSString *result = kEMPTY_STRING;
    
    result = [self.matcher unitsIn:number multiplier:multiplier];
    result = [[self.matcher tensAndTeensIn:number multiplier:multiplier] stringByAppendingString:result];
    result = [[self.matcher hundredsIn:number multiplier:multiplier] stringByAppendingString:result];
    
    return result;
}

@end

