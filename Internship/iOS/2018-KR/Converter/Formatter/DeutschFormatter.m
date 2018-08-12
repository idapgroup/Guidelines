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
    

//    NSString *unitsString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
//    return [NSString TYstringWithLeadingWhitespace:unitsString];
    NSString *unitsString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
    if (multiplier == THOUSAND && number == 1) {
        unitsString = [unitsString TYreplaseSuffix:@"s" withString:kEMPTY_STRING];
    }
    return unitsString;
}

- (NSString *)teensFormatter:(NSInteger)number multiplier:(long long)multiplier {
//    NSString *teensString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
//    
//    return [NSString TYstringWithLeadingWhitespace:teensString];
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
}

- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(long long)multiplier {
//    NSString *roundTensString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
//    
//    return [NSString TYstringWithLeadingWhitespace:roundTensString];
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
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
//    roundTensString = [roundTensString TYstringByTrimmingWhitespace];
    
    //return [NSString TYjoinString:unitsString withString:roundTensString separatedByString:@" und "];
    
    return [@[unitsString, roundTensString] componentsJoinedByString:@" und "];
}

- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier {
//    NSString *hundredsString = self.numerals.cardinal[[NSString TYstringWithInt:number]];
//    
//    return [NSString TYstringWithLeadingWhitespace:hundredsString];
    return self.numerals.cardinal[[NSString TYstringWithInt:number]];
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
    return result;
//    return [NSString TYstringWithLeadingWhitespace:result];
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
//            result = [NSString stringWithFormat:@"eine %@", self.numerals.cardinalLarge[key]];
//            break;
//        default:
//            break;
//    }
//    
//    return result;
//}

//- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string {
//    NSArray *numberParts = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    NSMutableArray *tempNumberParts = [numberParts mutableCopy];
//    
//    NSString *ordinal = nil;
//    NSString *cardinal = tempNumberParts.lastObject;
//
//    ordinal = [self searchOrdinalInDictionaryWithKey:cardinal];
//    
//    if (!ordinal) {
//        NSDictionary *exceptions = self.numerals.exceptions[kOrdinalExceptions];
//        ordinal = exceptions[cardinal];
//    }
//    
//    [tempNumberParts replaceObjectAtIndex:tempNumberParts.count - 1 withObject:ordinal];
//    
//    return [tempNumberParts componentsJoinedByString:kWHITESPACE];
//}
//
//- (NSString *)finishingFormatter:(long long)number withString:(NSString *)string {
//    NSString *result = nil;
//    
//    //  замена eins <large_number> -> eine <large_number>
//    result = [self replaceEinsWithEineInString:string];
//
//    
//    //  удаление и вставка пробелов <large_namber> -> < large_number >
//    NSArray *numberParts = [result componentsSeparatedByString:kWHITESPACE];
//    numberParts = [self addWhitespaceToLarge:numberParts];
//
//    //  склейка и последняя обрезка
//    result = [numberParts componentsJoinedByString:kEMPTY_STRING];
//    
//    return [result TYstringByTrimmingWhitespace];
//}


//   new
- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts {
//    NSArray *numberParts = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //  проблема: составное числительное идет как одно слово. Мне нужно разбить его на части. Приходится собирать строку из массива и заново разбивать.
    //  может лучше что-то с форматтером нихимичить
    //  может как с английским искать не слово, а suffix
    NSMutableArray *tempParts = [[[parts componentsJoinedByString:kWHITESPACE] componentsSeparatedByString:kWHITESPACE] mutableCopy];
    
    NSString *ordinal = nil;
    NSString *cardinal = tempParts.lastObject;
    //  old -- поиск по словарю, если неудача поиск по словарю исключений
    //  ОЧЕНЬ медленно
//    ordinal = [self searchOrdinalInDictionaryWithKey:cardinal];
//    
//    if (!ordinal) {
//        NSDictionary *exceptions = self.numerals.exceptions[kOrdinalExceptions];
//        ordinal = exceptions[cardinal];
//    }
    
    //  new поиск по исключениям, нет - добавление окончания
    
    //  eins -> erste,
    NSDictionary *exceptions = self.numerals.exceptions[kOrdinalExceptions];
    for (NSString *key in exceptions) {
        
        if ([cardinal hasSuffix:key]) {
            ordinal = [cardinal TYreplaseSuffix:key withString:exceptions[key]];
            break;
        }
    }
    
    if (!ordinal) {
        NSInteger remainder = (number % 100);
        //  numbers
        if ( remainder > 0 && remainder < 20) {
            ordinal = [cardinal stringByAppendingString:@"te"];
//            cardinal = [cardinal TYreplaseSuffix:@"y" withString:@"ie"];
        } else {
            //  Millionen, Trillionen -> Million, Trillion
            //  Milliarden, Trilliarden -> Milliard, Trilliard
            if ([cardinal hasSuffix:@"nen"] ) {
                cardinal = [cardinal TYreplaseSuffix:@"en" withString:kEMPTY_STRING];
            //  Milliarde, Trilliarde -> Milliard, Trilliard
            } else if ([cardinal hasSuffix:@"arde"]) {
                cardinal = [cardinal TYreplaseSuffix:@"e" withString:kEMPTY_STRING];
            }
            ordinal = [cardinal stringByAppendingString:@"ste"];
        }
        
       
//        ordinal = [cardinal stringByAppendingString:@"th"];
    }
    
    
    [tempParts replaceObjectAtIndex:tempParts.count - 1 withObject:ordinal];
    
    return tempParts;
}

- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts {
//    NSString *result = [parts componentsJoinedByString:kWHITESPACE];
    NSString *result = nil;
    
    parts = [[[parts componentsJoinedByString:kWHITESPACE] componentsSeparatedByString:kWHITESPACE] mutableCopy];

    //  замена eins <large_number> -> eine <large_number>
//    parts = [self replaceEinsWithEineInString:parts];
//    result = [self replaceEinsWithEineInString:result];
    
    
    //  удаление и вставка пробелов <large_namber> -> < large_number >
    if (number >= MILLION) {
        parts = [self addWhitespaceToLarge:parts];
        
        //  замена eins <large_number> -> eine <large_number>

        for (NSInteger idx = 0; idx < parts.count-1; idx++) {
            if ([parts[idx] isEqualToString:@"eins"]) {
                [parts replaceObjectAtIndex:idx withObject:@"eine"];
            }
        }
        
        
    }
//    NSArray *numberParts = [result componentsSeparatedByString:kWHITESPACE];
//    result = [self addWhitespaceToLarge:numberParts];
//    parts = [self addWhitespaceToLarge:parts];
    
    //  склейка и последняя обрезка
    result = [parts componentsJoinedByString:kEMPTY_STRING];
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


- (NSMutableArray<NSString *> *)addWhitespaceToLarge:(NSMutableArray<NSString *> *)parts {
//    NSMutableArray<NSString *> *tempParts = [parts mutableCopy];
    
    NSMutableArray<NSString *> *largeNumbers = [[self.numerals.cardinalLarge allValues] mutableCopy];
    NSArray<NSString *> *singleLargeExceptions = [self.numerals.exceptions[kOrdinalExceptions] allValues];
    [largeNumbers addObjectsFromArray:singleLargeExceptions];
    
    
    
    for (NSString *large in largeNumbers) {
        
        for (NSInteger idx = 0; idx < parts.count; idx++) {
            NSString *part = parts[idx];
            
            if ([part hasPrefix:large]) {  
                part = [part stringByAppendingString:kWHITESPACE];
                part = [kWHITESPACE stringByAppendingString:part];
                parts[idx] = part;
            }
        }
    }
    
    return parts;
//    return [tempParts copy];
//    return [tempParts componentsJoinedByString:kEMPTY_STRING];
}

//- (NSMutableArray<NSString *> *)replaceEinsWithEineInString:(NSMutableArray<NSString *> *)parts {
//    NSArray *singleLargeExceptions = [self.numerals.exceptions[kSingleLargeExceptions] allKeys];
//    
//    
//    for (NSInteger idx = 0; idx < parts.count; idx++) {
//        NSString *part = parts[idx];
//        
//        for (NSString *exception in singleLargeExceptions) {
//            if ([part isEqualToString:exception]) {
//                [parts replaceObjectAtIndex:idx withObject:self.numerals.exceptions[kSingleLargeExceptions][exception]];
//            }
//        }
//    }
//    
//    return parts;
//}

//- (NSMutableArray<NSString *> *)addWhitespaceToLarge:(NSMutableArray<NSString *> *)parts {
//    
//    NSMutableArray<NSString *> *largeNumbers = [[self.numerals.cardinalLarge allValues] mutableCopy];
//    NSArray<NSString *> *singleLargeExceptions = [self.numerals.exceptions[kOrdinalExceptions] allValues];
//    [largeNumbers addObjectsFromArray:singleLargeExceptions];
//    
//    
//    
//    for (NSString *large in largeNumbers) {
//        
//        for (NSInteger idx = 0; idx < parts.count; idx++) {
//            NSString *part = parts[idx];
//            
//            if ([part hasPrefix:large]) {
//                part = [part stringByAppendingString:kWHITESPACE];
//                part = [kWHITESPACE stringByAppendingString:part];
//                parts[idx] = part;
//            }
//        }
//    }
//    
//    return parts;
//}
@end
