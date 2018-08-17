//
//  Converter.m
//  IDAP_test
//
//  Created by Yevhen Triukhan on 26.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "Converter.h"

#import "NumeralsFormatter.h"
#import "DeutschFormatter.h"
#import "EnglishFormatter.h"
#import "UkrainianFormatter.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"


@interface Converter()

@property (strong, nonatomic) NSMutableDictionary <NSString *, NumeralsFormatter *> *formatters;
@property (strong, nonatomic, readonly) NumeralsFormatter *localeFormatter;
@end

static NSString * kMAX_LIMIT_MESSAGE = @"number larger than limit";
static NSString * kMIN_LIMIT_MESSAGE = @"converter doesn't support negative numbers";

@implementation Converter

@dynamic availableLocaleID;

#pragma mark -
#pragma mark Initialization
- (instancetype)init {
    self = [super init];
    if (self) {
        _ordinal = YES;
        _localeID = kEN;
        
        DeutschFormatter *deutschFormatter = [DeutschFormatter formatter];
        EnglishFormatter *englishFormatter = [EnglishFormatter formatter];
        UkrainianFormatter *ukrainianFormatter = [UkrainianFormatter formatter];
        
        _formatters = [NSMutableDictionary new];
        [_formatters setObject:deutschFormatter forKey:deutschFormatter.localeID];
        [_formatters setObject:englishFormatter forKey:englishFormatter.localeID];
        [_formatters setObject:ukrainianFormatter forKey:ukrainianFormatter.localeID];
        
        _localeFormatter = englishFormatter;
    }
    
    return self;
}

- (instancetype)initWithFormatter:(NumeralsFormatter *)formatter {
    if ([formatter isKindOfClass:[NumeralsFormatter class]]) {
        self = [super init];
        
        if (self) {
            _ordinal = YES;
            _formatters = [NSMutableDictionary new];
            
            [self addFormatter:formatter];
        }
    } else {
        return nil;
    }
    
    return self;
}


#pragma mark -
#pragma mark Accessors
- (void)setLocaleID:(NSString *)userLocale {
    
    userLocale = [userLocale substringToIndex:2];
    
    if (!_localeID || [self isCorrectLocaleID:userLocale]) {
        _localeID = userLocale;
        _localeFormatter = [self.formatters objectForKey:_localeID];
    }
}

- (NSArray<NSString *> *)availableLocaleID {
    
    return [self.formatters allKeys];
}

#pragma mark -
#pragma mark Public API

- (void)addFormatter:(NumeralsFormatter *)formatter {
    
    if ([formatter isKindOfClass:[NumeralsFormatter class]]) {
        [self.formatters setObject:formatter forKey:formatter.localeID];
        
        if (!self.localeID) {  //  add to empty matcher
            self.localeID = formatter.localeID;
        }
    }
}

- (void)removeFormatterWithLocale:(NSString *)userLocale {
    
    if ([self isCorrectLocaleID:userLocale]) {
        [self.formatters removeObjectForKey:userLocale];
        
        if (self.availableLocaleID.count > 0) {
            self.localeID = self.availableLocaleID.firstObject;
        } else {
            _localeID = nil;
            _localeFormatter = nil;
        }
    }
}

- (NSString *)stringFromNumber:(long long)number {
    
    if (number > QUADRILLION)  return kMAX_LIMIT_MESSAGE;
    if (number < 0)            return kMIN_LIMIT_MESSAGE;
    
    return [self convertNumber:number];
}

#pragma mark -
#pragma mark Private API
- (NSString *)convertNumber:(long long)number {
    NSMutableArray *parts = [NSMutableArray new];

    long long tempNumber = number;
    
    NSInteger power = log10(number);
    long long multiplier = pow(THOUSAND, power/3);
    
        for (; multiplier > 0; multiplier /= THOUSAND) {
            NSInteger threeDigits = (NSInteger)(tempNumber / multiplier);
            
            if (threeDigits > 0) {
                [parts addObjectsFromArray:[self threeDigitParser:threeDigits multiplier:multiplier]];
                
                if (multiplier > 1) {
                    [parts addObject:[self.localeFormatter largeNumbersFormatter:multiplier quantity:threeDigits]];
                }
            }
            tempNumber = tempNumber % multiplier;
            
            if (tempNumber == 0) break;
        }


    if(self.isOrdinal) {
        parts = [self.localeFormatter ordinalFormatter:number withParts:parts];
    }


    return [self.localeFormatter finishingFormatter:number withParts:parts];
}

- (NSMutableArray *)threeDigitParser:(NSInteger)number multiplier:(long long)multiplier {
    NSMutableArray *parts = [NSMutableArray new];
    NSString *result = nil;
    
    if (number >= 100) {
        NSInteger hundreds = number - (number % 100);  //  сотни
        result = [self.localeFormatter hundredsFormatter:hundreds multiplier:multiplier];
        if (result) [parts addObject:result];
    }
    
    NSInteger units = number % 100;
    
    if (units >= 10) {
        result = [self.localeFormatter tensFormatter:units multiplier:multiplier];
        
        if (result) [parts addObject:result];
        
    } else if (units > 0) {  //  защита от остатка круглых чисел
        result = [self.localeFormatter unitsFormatter:units multiplier:multiplier];
        
        if (result) [parts addObject:result];
    }
    
    return parts;
}

- (BOOL)isCorrectLocaleID:(NSString *)userLocale {  //
    NSSet *locales = [NSSet setWithArray:[self availableLocaleID]];
    
    return [locales containsObject:userLocale];
}
@end

