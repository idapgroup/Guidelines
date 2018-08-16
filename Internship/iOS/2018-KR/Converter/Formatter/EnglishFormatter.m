//
//  EnglishFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "EnglishFormatter.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"

@interface EnglishFormatter ()

@property (strong, nonatomic, readwrite) NSString *localeID;

@end


static NSString * kOrdinalExceptions = @"ordinalExceptions";

@implementation EnglishFormatter

@synthesize localeID = _localeID;

#pragma mark -
#pragma mark Initialization
- (instancetype)init {
    self = [super init];
    
    if (self) {
        _localeID = kEN;
    }
    
    return self;
}


#pragma mark -
#pragma mark Public API

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    
    return self.cardinalUnits[number];
}

- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    if (number < 20) {
        
        return self.cardinalTens[number % 10];
        
    } else {
        NSString *tens = self.cardinalTens[8 + (number / 10)];
        NSInteger remainder = number %  10;
        
        if (remainder > 0) {
            tens = [NSString stringWithFormat:@"%@-%@", tens, [self unitsFormatter:remainder multiplier:multiplier]];
        }
        
        return tens;
    }
}

- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier {

    return self.cardinalHundreds[number / 100];
}

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    NSInteger idx = log10(multiplier)/3;
    
    return self.cardinalLarge[idx];
}

- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts {
    NSString *ordinal = nil;
    NSString *cardinal = parts.lastObject;
    
    if (!cardinal) {
        cardinal = self.cardinalUnits[ZERO];
        [parts addObject:cardinal];
    }

    //  one -> first, twenty-one -> twenty-first
    NSDictionary *exceptions = self.exceptions[kOrdinalExceptions];
    for (NSString *key in exceptions) {
        
        if ([cardinal hasSuffix:key]) {  //  use suffix for protection eighteen, nineteen
            ordinal = [cardinal TYreplaseSuffix:key withString:exceptions[key]];
            break;
        }
    }
    
    if (!ordinal) {
        //  four -> fourth, forty -> fortieth
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
    
    if (parts.count == 0) {
        return self.cardinalUnits[ZERO];
    } else if (parts.count == 1) {
        return parts.firstObject;
    } else {
        return [parts componentsJoinedByString:kWHITESPACE];
    }
};


@end
