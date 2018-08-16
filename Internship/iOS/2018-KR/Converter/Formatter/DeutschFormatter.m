//
//  DeutschFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "DeutschFormatter.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"

@interface DeutschFormatter()

@property (strong, nonatomic, readwrite) NSString *localeID;

@end

static NSString * kOrdinalExceptions  = @"ordinalExceptions";
static NSString * kSingleLargeExceptions = @"singleLargeExceptions";

@implementation DeutschFormatter

@synthesize localeID = _localeID;

#pragma mark -
#pragma mark Initialization
- (instancetype)init {
    self = [super init];
    
    if (self) {
        _localeID = kUA;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public API

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {

    NSString *units = self.cardinalUnits[number];
    
    if (number == 1 && multiplier == THOUSAND) {
        //  ein for tausend
        units = [units TYreplaseSuffix:@"s" withString:kEMPTY_STRING];
    } else if (number == 1 && multiplier >= MILLION) {
        //  eine for Million, Milliard and more
        units = [units TYreplaseSuffix:@"s" withString:@"e"];
    }
    return units;

}

- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    
    if (number < 20) {  //  10..19
        
        return self.cardinalTens[number % 10];
        
    } else {  //  20, 30, .. 90
        NSString *tens = self.cardinalTens[8 + (number / 10)];
        NSInteger remainder = number % 10;
        
        if (remainder > 0) {
            //  complex numerals, unit und tens
            NSString *units = [self unitsFormatter:remainder multiplier:multiplier];
            
            if (remainder == 1) {  //  eins -> ein
                units = [units TYreplaseSuffix:@"s" withString:@""];
            }
            tens = [NSString stringWithFormat:@"%@und%@", units, tens];
        }
        
        return tens;
    }
}

- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier {

    return self.cardinalHundreds[number / 100];
}

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    NSString *result = nil;
    NSInteger idx = log10(multiplier)/3;
    
    if (multiplier == THOUSAND) {
        
        return self.cardinalHundreds.lastObject;
    } else {
        result = self.cardinalLarge[idx];
        
            if (quantity > 1) {  //  plurals
                if ([result hasSuffix:@"e"]) {
                    //  Milliarde -> Milliard
                    result = [result TYreplaseSuffix:@"e" withString:kEMPTY_STRING];
                }
                //  Million -> Millionen
                result = [result stringByAppendingString:@"en"];
            }
        
        return result;
    }
}

- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts {
    
    if (parts.count == 0) {
        return [NSMutableArray arrayWithObject:self.cardinalUnits[ZERO]];
    }
    
    NSString *ordinal = nil;
    NSString *cardinal = parts.lastObject;
    //  new поиск по исключениям, нет - добавление окончания
    //  eins -> erste,
    NSDictionary *exceptions = self.exceptions[kOrdinalExceptions];
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
        
    }
    
    
    [parts replaceObjectAtIndex:parts.count - 1 withObject:ordinal];
    
    return parts;
}

- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts {
    NSString *result = nil;
    
    if (parts.count == 0) {
        return self.cardinalUnits[ZERO];
    }
    
    if (number >= MILLION) {  //  <large_namber> -> < large_number >
        parts = [self addWhitespaceToLarge:parts];
    }
    
    //  склейка и последняя обрезка
    if (parts.count > 1) {
        result = [parts componentsJoinedByString:kEMPTY_STRING];
    } else {
        result = parts.firstObject;
    }
    
    return [result TYstringByTrimmingWhitespace];
}


#pragma mark -
#pragma mark Private API
- (NSMutableArray<NSString *> *)addWhitespaceToLarge:(NSMutableArray<NSString *> *)parts {

    for (NSInteger idx = 0; idx < parts.count; idx++) {
        
        if ([parts[idx] containsString:@"illi"]) {
            NSString *temp = parts[idx];
            temp = [temp stringByAppendingString:kWHITESPACE];
            temp = [kWHITESPACE stringByAppendingString:temp];
            parts[idx] = temp;
        }
    }
    
    return parts;
}

@end
