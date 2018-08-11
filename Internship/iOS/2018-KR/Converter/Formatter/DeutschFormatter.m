//
//  DeutschFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "DeutschFormatter.h"

#import "Numerals.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"
#import "NumeralsFormatter+Search.h"

static NSString * kOrdinalExceptions  = @"ordinalExceptions";
static NSString * kSingleLargeExceptions = @"singleLargeExceptions";

@implementation DeutschFormatter

#pragma mark -
#pragma mark Public API
+ (instancetype)formatter {
    Numerals *numerals = [Numerals deutsch];
    DeutschFormatter *_formatter = [[DeutschFormatter alloc] initWithNumerals:numerals];
    
    return _formatter;
}

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    

    NSString *unitsString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    return [NSString TYstringWithLeadingWhitespace:unitsString];
}

- (NSString *)teensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *teensString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:teensString];
}

- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *roundTensString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:roundTensString];
}

//  units + und + tens
- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSInteger units = number % 10;
    NSInteger roundTens = number - units;
    
    NSString *unitsString = [self unitsFormatter:units multiplier:multiplier];
    if (units == 1) {  //  eins -> ein
        unitsString = [unitsString TYreplaseSuffix:@"s" withString:@""];
    }
    
    NSString *roundTensString = [self roundTensFormatter:roundTens multiplier:multiplier];
    roundTensString = [roundTensString TYstringByTrimmingWhitespace];
    
    //return [NSString TYjoinString:unitsString withString:roundTensString separatedByString:@" und "];
    
    return [@[unitsString, roundTensString] componentsJoinedByString:@" und "];
}

- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *hundredsString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:hundredsString];
}

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    NSString *result = kEMPTY_STRING;
    NSString *key = [NSString TYstringWithInt:multiplier];
    
    if (multiplier == THOUSAND) {
        result = self.numerals.cardinal[key];
//        if (quantity == 1) {
//            result = [@"ein" stringByAppendingString:result];
//        }
    } else {
        result = self.numerals.cardinalLarge[key];
            if (quantity > 1) {  //  plurals
                result = [result stringByAppendingString:@"en"];
                result = [result capitalizedString];
            }
    }

    return [NSString TYstringWithLeadingWhitespace:result];
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
            result = [NSString stringWithFormat:@"eine %@", self.numerals.cardinalLarge[key]];
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

    ordinal = [self searchOrdinalInDictionaryWithKey:cardinal];
    
    if (!ordinal) {
        NSDictionary *exceptions = self.numerals.exceptions[kOrdinalExceptions];
        ordinal = exceptions[cardinal];
    }
    
    [tempNumberParts replaceObjectAtIndex:tempNumberParts.count - 1 withObject:ordinal];
    
    return [tempNumberParts componentsJoinedByString:kWHITESPACE];
}

- (NSString *)finishingFormatter:(long long)number withString:(NSString *)string {
    NSString *result = nil;
    
    //  замена eins <large_number> -> eine <large_number>
    result = [self replaceEinsWithEineInString:string];

    
    //  удаление и вставка пробелов <large_namber> -> < large_number >
    NSArray *numberParts = [result componentsSeparatedByString:kWHITESPACE];
    numberParts = [self addWhitespaceToLarge:numberParts];

    //  склейка и последняя обрезка
    result = [numberParts componentsJoinedByString:kEMPTY_STRING];
    
    return [result TYstringByTrimmingWhitespace];
}

#pragma mark -
#pragma mark Private API
//  change not just eins -> eine, but eins 
- (NSString *)replaceEinsWithEineInString:(NSString *)string {
    NSMutableString *temp = [string mutableCopy];
    NSArray *singleLargeExceptions = [self.numerals.exceptions[kSingleLargeExceptions] allKeys];
    
    for (NSString *exception in singleLargeExceptions) {
        
        if ([temp containsString:exception]) {
            [temp replaceOccurrencesOfString:exception
                                  withString:self.numerals.exceptions[kSingleLargeExceptions][exception]
                                     options:0
                                       range:NSMakeRange(0, temp.length)];
        }
    }
    
    return [temp copy];
}

- (NSArray *)addWhitespaceToLarge:(NSArray<NSString *> *)parts {
    NSMutableArray<NSString *> *tempParts = [parts mutableCopy];
    
    NSMutableArray<NSString *> *largeNumbers = [[self.numerals.cardinalLarge allValues] mutableCopy];
    NSArray<NSString *> *singleLargeExceptions = [self.numerals.exceptions[kOrdinalExceptions] allValues];
    [largeNumbers addObjectsFromArray:singleLargeExceptions];
    
    
    
    for (NSString *large in largeNumbers) {
        
        for (NSInteger idx = 0; idx < tempParts.count; idx++) {
            NSString *part = tempParts[idx];
            
            if ([part hasPrefix:large]) {  
                part = [part stringByAppendingString:kWHITESPACE];
                part = [kWHITESPACE stringByAppendingString:part];
                tempParts[idx] = part;
            }
        }
    }

    return [tempParts copy];
}
@end
