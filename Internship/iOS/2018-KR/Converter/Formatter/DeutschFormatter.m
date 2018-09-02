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

static NSString * kOrdinalExceptions  = @"ordinalExceptions";
static NSString * kSingleLargeExceptions = @"singleLargeExceptions";

static NSString * kDeutschSeparator = @"und";

@implementation DeutschFormatter

#pragma mark -
#pragma mark Public API

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *units = [super unitsFormatter:number multiplier:multiplier];
    
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
     NSString *result = [super tensFormatter:number multiplier:multiplier];
     NSRange separatorRange = [result rangeOfString:kWHITESPACE];
     
     if (separatorRange.location != NSNotFound) { // составное числительное
         //  eins -> ein
         if ([result hasSuffix:@"eins"]) {
             result = [result TYreplaseSuffix:@"s" withString:kEMPTY_STRING];
         }
         
         // swap first and last (before and after separator) words
         result = [self swapWordsInString:result separatorRange:separatorRange];
         
         // insert "und" between words
         result = [result stringByReplacingOccurrencesOfString:kWHITESPACE
         withString:kDeutschSeparator];
     
     }
    
     return result;
}

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    NSString *result = [super largeNumbersFormatter:multiplier quantity:quantity];

    if (quantity > 1 && multiplier != THOUSAND) {  //  plurals
        if ([result hasSuffix:@"e"]) {
            //  Milliarde -> Milliard
            result = [result TYreplaseSuffix:@"e" withString:kEMPTY_STRING];
        }
        //  Million -> Millionen
        result = [result stringByAppendingString:@"en"];
    }
    
    return result;
  
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
        NSInteger remainder = (number % HUNDRED);
        
        if ( remainder > 0 && remainder < 20) {
            ordinal = [cardinal stringByAppendingString:@"te"];
        } else {
            //  Millionen -> Million
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
    
    if (parts.count <= 1) {  //  0..100 and 200,300,400 etc
        
        return [super finishingFormatter:number withParts:parts];
    } else {
        
        if (number >= MILLION) {  //  "Million" -> " Million "
            parts = [self addWhitespaceToLarge:parts];
        }
        
        return [[parts componentsJoinedByString:kEMPTY_STRING] TYstringByTrimmingWhitespace];
    }
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

//  "one two" -> "two one"
- (NSString *)swapWordsInString:(NSString *)string separatorRange:(NSRange)range{
    NSString *firstWord = [string substringToIndex:range.location];
    NSString *secondWord = [string substringFromIndex:(range.location + range.length)];
    
    return [NSString stringWithFormat:@"%@ %@", secondWord, firstWord];
}

@end
