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

#define AFTER_FIRST_INDEX 1

static NSString * kOrdinalExceptions = @"ordinalExceptions";

static NSString * kEnglishSeparator = @"-";

@implementation EnglishFormatter

#pragma mark -
#pragma mark Public API

- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *result = [super tensFormatter:number multiplier:multiplier];

    //  twenty one -> twenty-one
    return [result stringByReplacingOccurrencesOfString:kWHITESPACE
                                             withString:kEnglishSeparator];
    
}

- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts {

    NSString *ordinal = nil;
    NSString *cardinal = parts.lastObject;

    if (parts.count == 0) {
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

@end
