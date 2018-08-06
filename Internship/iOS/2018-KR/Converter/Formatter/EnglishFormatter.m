//
//  EnglishFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "EnglishFormatter.h"

#import "Numerals.h"
#import "NumeralsFormatterPrivate.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"

static NSString * kOrdinalExceptions  = @"ordinalExceptions";

@implementation EnglishFormatter

#pragma mark -
#pragma mark Public API
+ (instancetype)formatter {
    Numerals *numerals = [Numerals english];
    EnglishFormatter *_formatter = [[EnglishFormatter alloc] initWithNumerals:numerals];
    
    return _formatter;
}

//  1..9
- (NSString *)unitsFormatter:(NSInteger)number multiplier:(NSInteger)multiplier {
    NSString *unitsString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
   
    return [NSString TYstringWithLeadingWhitespace:unitsString];
}

//  10..19
- (NSString *)teensFormatter:(NSInteger)number multiplier:(NSInteger)multiplier {
    NSString *teensString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:teensString];
}

//  20, 30, 40..90
- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(NSInteger)multiplier {
    NSString *roundTensString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:roundTensString];
}

//  21, 22, 23..99
- (NSString *)tensFormatter:(NSInteger)number multiplier:(NSInteger)multiplier {
    NSInteger units = number % 10;
    NSInteger roundTens = number - units;
    
    //  as part of combined numeral unit deesn't need leading whitespace
    NSString *unitsString = [self unitsFormatter:units multiplier:multiplier];
    unitsString = [unitsString TYstringByTrimmingWhitespace];
    
    NSString *roundTensString = [self roundTensFormatter:roundTens multiplier:multiplier];

    return [@[roundTensString, unitsString] componentsJoinedByString:@"-"];
}

//  100, 200, 300..900
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(NSInteger)multiplier {
    NSString *hundredsString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:hundredsString];
}

//  10^3, 10^6..10^12
- (NSString *)largeNumbersFormatter:(NSInteger)multiplier quantity:(NSInteger)quantity {
    NSString *result = kEMPTY_STRING;
    
    if (multiplier == THOUSAND) {
        result = self.numerals.cardinal[[NSString TYstringWithInt:multiplier]];
    } else {
        result = self.numerals.cardinalLarge[[NSString TYstringWithInt:multiplier]];
    }
//    NSString *result = self.numerals.cardinalLarge[[NSString TYstringWithInt:multiplier]];
    
    return [NSString TYstringWithLeadingWhitespace:result];
}

//  MARK:  common formatters
- (NSString *)starterFormatter:(NSInteger)number {
    NSString *result = nil;
    NSString *key = [NSString TYstringWithInt:number];
    
    switch (number) {
        case 0:
            result = self.numerals.cardinal[key];
            break;
        case MILLION:  //  million, billion, trillions have same one method call it's OK!
        case BILLION:
        case TRILLION:
            result = [NSString stringWithFormat:@"one %@", self.numerals.cardinalLarge[key]];
            break;
        default:
            break;
    }
    
    return result;
}

- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string {
    NSArray *numberParts = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableArray *tempNumberParts = [numberParts mutableCopy];

    NSString *ordinal = nil;
    NSString *cardinal = tempNumberParts.lastObject;

    //  one -> first, twenty-one -> twenty-first
    NSDictionary *exceptions = self.numerals.exceptions[kOrdinalExceptions];
    for (NSString *key in exceptions) {
        
        if ([cardinal hasSuffix:key]) {  //  use suffix for protection eighteen, nineteen
            ordinal = [cardinal TYreplaseSuffix:key withString:exceptions[key]];
            break;
        }
    }
    
    if (!ordinal) {  //  four -> fourth, forty -> fortieth
        if ([cardinal hasSuffix:@"y"]) {
            cardinal = [cardinal TYreplaseSuffix:@"y" withString:@"ie"];
        }
        ordinal = [cardinal stringByAppendingString:@"th"];
    }
    
    [tempNumberParts replaceObjectAtIndex:tempNumberParts.count - 1
                               withObject:ordinal];
    
    return [tempNumberParts componentsJoinedByString:kWHITESPACE];
}

- (NSString *)finishingFormatter:(NSInteger)number withString:(NSString *)string {
    
    return [string TYstringByTrimmingWhitespace];
};

#pragma mark -
#pragma mark Private API

@end
