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

static NSString * kMAX_LIMIT_MESSAGE = @"number larger than limit";
static NSString * kMIN_LIMIT_MESSAGE = @"converter doesn't support negative numbers";

@implementation Converter

@dynamic availableLocaleID, shortScale, localeID;

#pragma mark -
#pragma mark Initialization
- (instancetype)init {
    self = [super init];
    if (self) {
        _ordinal = YES;
        
        _matcher = [Matcher defaultMatcher];
        _matcher.localeID = kEN;
        _matcher.shortScale = YES;
        
    }
    
    return self;
}

- (instancetype)initWithFormatter:(NumeralsFormatter *)formatter {
    if ([formatter isKindOfClass:[NumeralsFormatter class]]) {
        self = [super init];
        
        if (self) {
            _ordinal = YES;
            
            _matcher = [Matcher new];  //  empty
            [_matcher addFormatter:formatter];
        }
    } else {
        return nil;
    }
    
    return self;
}


#pragma mark -
#pragma mark Accessors
- (void)setLocaleID:(NSString *)localeID {
    self.matcher.localeID = localeID;
}

- (NSString *)localeID {
    return self.matcher.localeID;
}

- (void)setShortScale:(BOOL)shortScale {
    self.matcher.shortScale = shortScale;
}

- (BOOL)isShortScale {
    return self.matcher.isShortScale;
}

- (NSArray<NSString *> *)availableLocaleID {
    return self.matcher.availableLocaleID;
}

#pragma mark -
#pragma mark Public API

- (void)addFormatter:(NumeralsFormatter *)formatter {
    
    if (formatter) {
        [self.matcher addFormatter:formatter];
    }
}

- (void)removeFormatterWithLocale:(NSString *)localeID {
    [self.matcher removeFormatterWithLocale:localeID];
}

- (NSString *)stringFromNumber:(long long)number {
    
    if (number > QUADRILLION)  return kMAX_LIMIT_MESSAGE;
    if (number < 0)            return kMIN_LIMIT_MESSAGE;
    
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
    NSMutableArray *parts = [NSMutableArray new];

    long long tempNumber = number;
    
    NSInteger power = log10(number);
    long long multiplier = pow(THOUSAND, power/3);
    
        for (; multiplier > 0; multiplier /= THOUSAND) {
            NSInteger threeDigits = tempNumber / multiplier;
            
            if (threeDigits > 0) {
//                [parts addObjectsFromArray:[self.matcher threeDigitParser:threeDigits multiplier:multiplier]];
                [parts addObjectsFromArray:[self.matcher newThreeDigitParser:threeDigits multiplier:multiplier]];
                
                if (multiplier > 1) {
                    [parts addObject:[self.matcher largeNumbersForMultiplier:multiplier quantity:threeDigits]];
                }
            }
            tempNumber = tempNumber % multiplier;
            
            if (tempNumber == 0) break;
        }

    if(self.isOrdinal) {
        parts = [self.matcher ordinalFormatter:number withParts:parts];
    }

    return [self.matcher finishingFormatter:number withParts:parts];;
}


@end

