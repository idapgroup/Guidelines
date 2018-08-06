//
//  Matcher.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "Matcher.h"

#import "DeutschFormatter.h"
#import "EnglishFormatter.h"
#import "Numerals.h"
#import "UkrainianFormatter.h"

#import "GlobalKeys.h"

@interface Matcher ()


@property (strong, nonatomic) NSMutableDictionary <NSString *, NumeralsFormatter *> *formatters;
@property (strong, nonatomic) NumeralsFormatter *localeFormatter;

@end

@implementation Matcher

@dynamic localeFormatter, shortScale;

#pragma mark -
#pragma mark Accessors

- (void)setLocaleID:(NSString *)userLocale {

    userLocale = [userLocale substringToIndex:2];
    
    if (!_localeID || [self isCorrectLocaleID:userLocale]) {
        _localeID = userLocale;
    }
}

- (void)setShortScale:(BOOL)shortScale {
    self.localeFormatter.numerals.shortScale = shortScale;
}

- (BOOL)isShortScale {
    return self.localeFormatter.numerals.isShortScale;
}

- (NSMutableDictionary<NSString *,NumeralsFormatter *> *)formatters {
    
    if (!_formatters) {
        _formatters = [NSMutableDictionary new];
    }
    
    return _formatters;
}

- (NumeralsFormatter *)localeFormatter {
    return [self.formatters objectForKey:self.localeID];
}


#pragma mark -
#pragma mark Public API
+ (instancetype)defaultMatcher {
    Matcher *_matcher = [Matcher new];
    
    if (_matcher) {
        DeutschFormatter *deutschFormatter = [DeutschFormatter formatter];
        EnglishFormatter *englishFormatter = [EnglishFormatter formatter];
        UkrainianFormatter *ukrainianFormatter = [UkrainianFormatter formatter];
        
        _matcher.formatters = [NSMutableDictionary new];
        [_matcher.formatters setObject:deutschFormatter forKey:deutschFormatter.localeID];
        [_matcher.formatters setObject:englishFormatter forKey:englishFormatter.localeID];
        [_matcher.formatters setObject:ukrainianFormatter forKey:ukrainianFormatter.localeID];
        
        _matcher.localeID   = kEN;
    }
    
    return _matcher;
}

- (void)addFormatter:(NumeralsFormatter *)formatter {
    
    if (formatter) {
        [self.formatters setObject:formatter forKey:formatter.localeID];
        
        if (!self.localeID) {  //  add to empty matcher
            self.localeID = formatter.localeID;
            self.shortScale = formatter.numerals.shortScale;
        }
    }
}

- (void)removeFormatterWithLocale:(NSString *)userLocale {
    
    if ([self isCorrectLocaleID:userLocale]) {
        [self.formatters removeObjectForKey:userLocale];

        if (self.availableLocaleID.count > 0) {
            _localeID = self.availableLocaleID.firstObject;
        } else {
            _localeID = nil;
        }
      
    }
}

- (NSArray<NSString *> *)availableLocaleID {
    return [self.formatters allKeys];
}

- (NSString *)unitsIn:(NSInteger)number multiplier:(NSInteger)multiplier {
    NSString *unitString = kEMPTY_STRING;
    NSInteger units = number % 100;
    
    if (units > 0 && units < 10) {
        unitString = [self.localeFormatter unitsFormatter:units multiplier:multiplier];
    }
    
    return unitString;
}


- (NSString *)tensAndTeensIn:(NSInteger)number multiplier:(NSInteger)multiplier {
    NSString *tensOrTeensString = kEMPTY_STRING;
    NSInteger tens = number % 100;
    
    if (tens > 9 && tens <= 19) {
        tensOrTeensString = [self.localeFormatter teensFormatter:tens multiplier:multiplier];
        
    } else if (tens > 19) {  //  защита от 01, 02 итд.
        BOOL isRoundNumber = number % 10 ? NO : YES;
        
        if (isRoundNumber) {
            tensOrTeensString = [self.localeFormatter roundTensFormatter:tens multiplier:multiplier];
        } else {
            tensOrTeensString = [self.localeFormatter tensFormatter:tens multiplier:multiplier];
        }
    }
    
    return tensOrTeensString;
}

- (NSString *)hundredsIn:(NSInteger)number multiplier:(NSInteger)multiplier {
    NSString *hundredsString = kEMPTY_STRING;
    
    if (number > 99) {
        NSInteger hundreds = number - (number % 100);  //  сотни
        hundredsString = [self.localeFormatter hundredsFormatter:hundreds multiplier:multiplier];
    }
    
    return hundredsString;
}

- (NSString *)largeNumbersForMultiplier:(long long)multiplier quantity:(NSInteger)quantity {
    NSString *largeNumberString = kEMPTY_STRING;
    
    if (multiplier >= THOUSAND) {
        largeNumberString = [self.localeFormatter largeNumbersFormatter:multiplier quantity:quantity];
    }
    
    return largeNumberString;
}

- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string {
    return [self.localeFormatter ordinalFormatter:number withString:string];
}


- (NSString *) starterFormatter:(long long)number {
    return [self.localeFormatter starterFormatter:number];
}

- (NSString *) finishingFormatter:(long long)number withString:(NSString *)string{
    return [self.localeFormatter finishingFormatter:number withString:(NSString *)string];
}

#pragma mark -
#pragma mark Private API
- (BOOL)isCorrectLocaleID:(NSString *)userLocale {  //
    NSSet *locales = [NSSet setWithArray:[self availableLocaleID]];

    return [locales containsObject:userLocale];
}
@end
