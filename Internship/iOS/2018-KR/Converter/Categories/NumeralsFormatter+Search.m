//
//  NumeralsFormatter+Search.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 04.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NumeralsFormatter+Search.h"

#import "Numerals.h"

@implementation NumeralsFormatter (Search)

//  keys in dictionary for ordinal and cardinal the same
//  "two" -> "2" -> "second"
//  "million" -> "1000000" -> "millionth"
- (NSString *)searchOrdinalInDictionaryWithKey:(NSString *)cardinal {

    NSString *key = [self.numerals.cardinal allKeysForObject:cardinal].lastObject;
    
    if (!key) {
        key = [self.numerals.cardinalLarge allKeysForObject:cardinal].lastObject;
        return self.numerals.ordinalLarge[key];
    } else {
        return self.numerals.ordinal[key];
    }
}

@end
