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
- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
}

//  10..19
- (NSString *)teensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
}

//  20, 30, 40..90
- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
}

//  21, 22, 23..99
- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSInteger units = number % 10;
    NSInteger roundTens = number - units;
    
    //  as part of combined numeral unit deesn't need leading whitespace
    NSString *unitsString = [self unitsFormatter:units multiplier:multiplier];
    
    NSString *roundTensString = [self roundTensFormatter:roundTens multiplier:multiplier];

    return [@[roundTensString, unitsString] componentsJoinedByString:@"-"];
}

//  100, 200, 300..900
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
}

//  10^3, 10^6..10^12
- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    
    if (multiplier == THOUSAND) {
        return self.numerals.cardinal[[NSString TYstringWithInt:multiplier]];
    } else {
        return self.numerals.cardinalLarge[[NSString TYstringWithInt:multiplier]];
    }
}

//  MARK:  common formatters
- (NSString *)starterFormatter:(long long)number {
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

- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts {

    NSString *ordinal = nil;
    NSString *cardinal = parts.lastObject;

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
    
    [parts replaceObjectAtIndex:parts.count - 1
                               withObject:ordinal];
    
    return parts;
}

- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts {
    
    return [[parts componentsJoinedByString:kWHITESPACE] TYstringByTrimmingWhitespace];
};

#pragma mark -
#pragma mark Private API

@end
