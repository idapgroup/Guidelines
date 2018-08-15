//
//  EnglishFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "EnglishFormatter.h"

#import "Numerals.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"

@interface EnglishFormatter ()
{
    NSArray *__cardinalNSA;
}
@property (strong, nonatomic) NSArray *cardinal;

@property (strong, nonatomic) NSArray <NSString *>*cardinalUnits;
@property (strong, nonatomic) NSArray <NSString *>*cardinalTens;
@property (strong, nonatomic) NSArray <NSString *>*cardinalHundreds;
@property (strong, nonatomic) NSArray <NSString *>*cardinalLarge;

@end
static NSString * kOrdinalExceptions  = @"ordinalExceptions";

static NSString *__cardinalUnits [] = { @"zero",@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine" };
static NSString *__cardinalTens [] = { @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"thirty", @"forty", @"fifty", @"sixty", @"seventy", @"eighty", @"ninety" };
static NSString *__cardinalHundreds [] = { @"", @"one hundred", @"two hundred", @"three hundred", @"four hundred", @"five hundred", @"six hundred", @"seven hundred", @"eight hundred", @"nine hundred" };


@implementation EnglishFormatter

#pragma mark -
#pragma mark Public API
+ (instancetype)formatter {
    Numerals *numerals = [Numerals english];
    EnglishFormatter *_formatter = [[EnglishFormatter alloc] initWithNumerals:numerals];
//    _formatter->__cardinalMap = { {0, @"zero"},
//        {1, @"one"},
//        {2, @"two"},
//        {3, @"three"},
//        {4, @"four"},
//        {5, @"five"},
//        {6, @"six"},
//        {7, @"seven"},
//        {8, @"eight"},
//        {9, @"nine"},
//        
//        {10, @"ten"},
//        {11, @"eleven"},
//        {12, @"twelve"},
//        {13, @"thirteen"},
//        {14, @"fourteen"},
//        {15, @"fifteen"},
//        {16, @"sixteen"},
//        {17, @"seventeen"},
//        {18, @"eighteen"},
//        {19, @"nineteen"},
//        
//        {20, @"twenty"},
//        {30, @"thirty"},
//        {40, @"forty"},
//        {50, @"fifty"},
//        {60, @"sixty"},
//        {70, @"seventy"},
//        {80, @"eighty"},
//        {90, @"ninety"},
//        
//        {100, @"one hundred"},
//        {200, @"two hundred"},
//        {300, @"three hundred"},
//        {400, @"four hundred"},
//        {500, @"five hundred"},
//        {600, @"six hundred"},
//        {700, @"seven hundred"},
//        {800, @"eight hundred"},
//        {900, @"nine hundred"},
//        {1000, @"thousand"}};
    
    _formatter->__cardinalNSA = @[ @"MARK_X",
                                   @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten",
                                   @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen",
                                   @"twenty", @"thirty", @"forty", @"fifty", @"sixty", @"seventy", @"eighty", @"ninety",
                                   @"one hundred", @"two hundred", @"three hundred", @"four hundred", @"five hundred", @"six hundred", @"seven hundred", @"eight hundred", @"nine hundred",
                                   @"thousand"];
    
    _formatter.cardinalUnits = @[@"zero",@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine"];
    _formatter.cardinalTens = @[@"ten",@"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"thirty", @"forty", @"fifty", @"sixty", @"seventy", @"eighty", @"ninety"];
    
    
    _formatter.cardinalTens = @[@"", @"ten", @"twenty", @"thirty", @"forty", @"fifty", @"sixty", @"seventy", @"eighty", @"ninety"];
    _formatter.cardinalHundreds = @[@"", @"one hundred", @"two hundred", @"three hundred", @"four hundred", @"five hundred", @"six hundred", @"seven hundred", @"eight hundred", @"nine hundred"];
    _formatter.cardinalLarge = @[@"", @"thousand", @"million", @"billion", @"trillion"];
    return _formatter;
}



//  1..9
- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {
//    return __cardinalMap[number];
    return __cardinalUnits[number];
    return __cardinalNSA[number];
//    return self.cardinalUnitsAndTeens[number];
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
}

//  10..19
- (NSString *)teensFormatter:(NSInteger)number multiplier:(long long)multiplier {
//    return __cardinalMap[number];
    return __cardinalNSA[number];
//    return self.cardinalUnitsAndTeens[number];
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
}

//  20, 30, 40..90
- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(long long)multiplier {
//    return __cardinalMap[number];
    return __cardinalNSA[18 + (number / 10)];
//    return self.cardinalTens[number / 10];
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];

}

//  21, 22, 23..99
- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    //  new version, from 10 to 99
    if (number < 20) {
        return __cardinalTens[number % 10];
        return __cardinalNSA[number];
    } else {
        NSString *tens = __cardinalTens[8 + (number / 10)];
        NSInteger remainder = number %  10;
        
        if (remainder > 0) {
            tens = [NSString stringWithFormat:@"%@-%@", tens, [self unitsFormatter:remainder multiplier:multiplier]];
        }

//        NSString *tens = __cardinalNSA[18 + (number / 10)];
//        NSInteger remainder = number %  10;
//        
//        if (remainder > 0) {
//            tens = [NSString stringWithFormat:@"%@-%@", tens, [self unitsFormatter:remainder multiplier:multiplier]];
//        }
        
        return tens;
    }
    
    
    
    
    NSString *tens = __cardinalNSA[18 + (number / 10)];
    NSInteger remainder = number %  10;
    if (remainder > 0) {
        tens = [NSString stringWithFormat:@"%@-%@", tens, [self unitsFormatter:remainder multiplier:multiplier]];
    }
    return tens;
    
    NSInteger units = number % 10;
    NSInteger roundTens = number - units;
    
    
    //  as part of combined numeral unit deesn't need leading whitespace
    NSString *unitsString = [self unitsFormatter:units multiplier:multiplier];
//
    NSString *roundTensString = [self roundTensFormatter:roundTens multiplier:multiplier];

//    return [@[self.cardinalTens[number / 10], self.cardinalUnitsAndTeens[number % 10]] componentsJoinedByString:@"-"];
    return [@[roundTensString, unitsString] componentsJoinedByString:@"-"];
}

//  100, 200, 300..900
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier {
//    return __cardinalMap[number];
//    return __cardinalNSA[27 + (number / 100)];
//    return self.cardinalHundreds[number / 100];
    return __cardinalHundreds[number / 100];
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];

}

//  10^3, 10^6..10^12
- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    switch (multiplier) {
        case THOUSAND: return @"thousand";
            break;
        case MILLION: return @"million";
            break;
        case BILLION: return @"billion";
            break;
        case TRILLION: return @"trillion";
            break;
        default:
            break;
    }
    return nil;
    
//    NSUInteger power = (log10(multiplier)) / 3;
//    return self.cardinalLarge[power];
    
//    if (multiplier == THOUSAND) {
////        return __cardinalMap[multiplier];
//        return __cardinalNSA[37];
//    } else {
//        return self.numerals.cardinalLarge[[NSString TYstringWithInt:multiplier]];
//    }
    if (multiplier == THOUSAND) {
        //        result = self.numerals.cardinal[[NSString TYstringWithInt:multiplier]];
        return self.numerals.cardinal[[NSString TYstringWithInt:multiplier]];
    } else {
        //        result = self.numerals.cardinalLarge[[NSString TYstringWithInt:multiplier]];
        return self.numerals.cardinalLarge[[NSString TYstringWithInt:multiplier]];
    }

}

//  MARK:  common formatters
//- (NSString *)starterFormatter:(long long)number {
//    NSString *result = nil;
//    NSString *key = [NSString TYstringWithInt:number];
//    
//    switch (number) {
//        case 0:
//            result = self.numerals.cardinal[key];
//            break;
//        case MILLION:  //  million, billion, trillions have same one method call it's OK!
//        case BILLION:
//        case TRILLION:
//            result = [NSString stringWithFormat:@"one %@", self.numerals.cardinalLarge[key]];
//            break;
//        default:
//            break;
//    }
//    
//    return result;
//}

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

- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray<NSString *> *)parts {
//    char *carr = (char *)calloc(1000, sizeof(char));
//    strcat(carr, parts.firstObject.UTF8String);
//    
//        for (NSInteger idx = 1; idx < parts.count; idx++) {
//            char const * currstr = parts[idx].UTF8String;
//            
//            size_t length = strlen(carr);
//            carr[length] = ' '; // overwrite null termination
//            
//            memcpy(carr+strlen(carr), currstr, strlen(currstr)+1);
//        }
//    return [NSString stringWithUTF8String:carr];
    
    return [parts componentsJoinedByString:kWHITESPACE];
//        return [[parts componentsJoinedByString:kWHITESPACE] TYstringByTrimmingWhitespace];
};

#pragma mark -
#pragma mark Private API

@end
