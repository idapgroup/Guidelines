//
//  UkrainianFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "UkrainianFormatter.h"

#import "Numerals.h"
#import "NumeralsFormatterPrivate.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"
#import "NumeralsFormatter+Search.h"

@interface UkrainianFormatter()

@property (strong, nonatomic)  NSDictionary <NSString *, NSDictionary <NSString *, NSString *>*> *exceptions;

@end

static NSString * kOrdinalPrefixes  = @"ordinalPrefixes";
static NSString * kUnitsForThousend = @"unitsForThousend";
static NSString * kGenitiveForm     = @"genitiveForm";

@implementation UkrainianFormatter

#pragma mark -
#pragma mark Accessors
- ( NSDictionary <NSString *, NSDictionary <NSString *, NSString *>*> *)exceptions {
    if (!_exceptions) {
        _exceptions = self.numerals.exceptions;
    }
    
    return _exceptions;
}

#pragma mark -
#pragma mark Public API
+ (instancetype)formatter {
    Numerals *numerals = [Numerals ukrainian];
    UkrainianFormatter *_formatter = [[UkrainianFormatter alloc] initWithNumerals:numerals];
    
    return _formatter;
}

//  1..9
- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *unitsString = nil;
    NSString *key = [NSString TYstringWithInt:number];
    
    if (multiplier == THOUSAND && number <= 2) {  //  один -> одна, два -> дві
        unitsString = self.exceptions[kUnitsForThousend][key];
    } else {
        unitsString = self.numerals.cardinal[key];
    }
    
    return [NSString TYstringWithLeadingWhitespace:unitsString];
}
//  10..19
- (NSString *)teensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *teensString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:teensString];
}
//  20, 30, 40..90
- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *roundTensString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:roundTensString];
}
//  21, 22, 23..99
- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSInteger units = number % 10;
    NSInteger roundTens = number - units;
    
    NSString *unitsString = [self unitsFormatter:units multiplier:multiplier];
    unitsString = [unitsString TYstringByTrimmingWhitespace];
    
    NSString *roundTensString = [self roundTensFormatter:roundTens multiplier:multiplier];
    
    return [@[roundTensString, unitsString] componentsJoinedByString:kWHITESPACE];
}
//  100, 200, 300..900
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *hundredsString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    
    return [NSString TYstringWithLeadingWhitespace:hundredsString];
}


- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    NSString *result = kEMPTY_STRING;
    NSString *key = [NSString TYstringWithInt:multiplier];
    NSInteger tens  = quantity % 100;
    NSInteger units = quantity % 10;
    
    //  (три) тисячі, мільйона, більйона,
    //  2,3,4,.,22,23,24,..,32,33,34, x2,x3,x4. (except 12,13,14)
    BOOL isFirstRange = (units >= 2 && units <= 4) && (tens < 11 || tens > 20);
    
    //  (шість) тисяч, мільйонів, більйонів
    //  5,6,7-20,...,
    BOOL isSecondRange = (tens >= 5 && tens <= 20) || (units >= 5 && tens > 20) || units == 0;
    
    result = self.numerals.cardinalLarge[key];  //  тисяча, hidden range 1,21,31..91 (except 11)

    
    if (isFirstRange) {
        if (multiplier == THOUSAND) {
            result = [result TYreplaseSuffix:@"а" withString:@"і"];
        } else {
            result = [result stringByAppendingString:@"а"];
        }
    } else if (isSecondRange) {
        if (multiplier == THOUSAND) {
            result = [result TYreplaseSuffix:@"а" withString:kEMPTY_STRING];
        } else {
            result = [result stringByAppendingString:@"ів"];
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
            result = [NSString stringWithFormat:@"один %@", self.numerals.cardinalLarge[key]];
            break;
        default:
            break;
    }
    
    return result;
}

- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string {
    //  split, analyze, replace, join
    NSString *ordinal = nil;
    NSArray *numberParts = [[string TYstringByTrimmingWhitespace]
                            componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableArray *tempNumberParts = [numberParts mutableCopy];
    
    NSString *cardinal = tempNumberParts.lastObject;

    
    //  "одна тисяча" -> "тисячний"
    if (number == THOUSAND || number == MILLION || number == BILLION || number == TRILLION) {
        [tempNumberParts removeObjectAtIndex:tempNumberParts.count - 2];
        ordinal = [self searchOrdinalInDictionaryWithKey:cardinal];
    }
    
    
    //  1..999
    if (!ordinal) {
        ordinal = [self searchOrdinalInDictionaryWithKey:cardinal];
    }

    //  thousand, million, billion, etc
    if (!ordinal) {
        
    //  some large numbers were changed (дві тисячі, два мільйона), they can't be found in main dictionary
        NSDictionary *prefixes = self.exceptions[kOrdinalPrefixes];
        
        for (NSString *prefix in prefixes) {
            if ([cardinal hasPrefix:prefix]) {
                ordinal = prefixes[prefix];
                break;
            }
        }
        tempNumberParts = [[self replaceWordWithGenitiveForm:tempNumberParts number:number] mutableCopy];
        
        [tempNumberParts replaceObjectAtIndex:tempNumberParts.count - 1
                                   withObject:ordinal];
        
        return [tempNumberParts componentsJoinedByString:kEMPTY_STRING];
        
    } else {  //  success for 1...999
        //  restore whitespaces
        [tempNumberParts replaceObjectAtIndex:tempNumberParts.count - 1 withObject:ordinal];

        return [tempNumberParts componentsJoinedByString:kWHITESPACE];
    }
}





- (NSString *)finishingFormatter:(long long)number withString:(NSString *)string {
    return [string TYstringByTrimmingWhitespace];
};

#pragma mark -
#pragma mark Private Api
- (NSArray<NSString *> *) replaceWordWithGenitiveForm:(NSArray<NSString *> *)parts number:(long long)number {
    NSMutableArray *tempParts = [parts mutableCopy];
    
    //  replace  "дві", "тисячі" -> "двох", "тисячний"
    //  or even better    "двадцять", "дві", "тисячі" -> "двадцяти", "двох", "тисячний"
    NSInteger lastIdx = tempParts.count - 1;
    
    //  calculate two last valuable digits  24000 -> 24
    NSInteger units = 0;
    NSInteger tens = 0;
    if (number > 0) {
        while (true) {
            NSInteger remainder = number % THOUSAND;
            if(remainder > 0) {
                units = remainder % 10;
                tens = remainder % 100;
                break;
            } else {
                number /= THOUSAND;
            }
        }
    }

    BOOL isCombinedNumeral = (tens > 20 && units != 1);
    
    NSString *secondlast = tempParts[lastIdx - 1];
    [tempParts replaceObjectAtIndex:(lastIdx - 1)
                               withObject:[self genitiveForCardinalNumber:secondlast]];
    
    if (isCombinedNumeral) {
        NSString *thirdLast = tempParts[lastIdx - 2];
        [tempParts replaceObjectAtIndex:(lastIdx - 2)
                             withObject:[self genitiveForCardinalNumber:thirdLast]];
    }
     
    return [tempParts copy];
}

- (NSString *)genitiveForCardinalNumber:(NSString *)number {
    NSString *key = [self.numerals.cardinal allKeysForObject:number].lastObject;
    if (!key) {
        key = [self.exceptions[kUnitsForThousend] allKeysForObject:number].lastObject;
    }
    
    return self.exceptions[kGenitiveForm][key];
}

@end
