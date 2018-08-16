//
//  Numerals+English.m
//  IDAP_test
//
//  Created by Yevhen Triukhan on 28.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "Numerals.h"

#import "GlobalKeys.h"

@implementation Numerals (English)

+ (Numerals *)english {
    Numerals *_english = [Numerals new];
    
    _english.localeID = kEN;
    
    _english.cardinal =
        @{
            @"0" : @"zero",
            @"1" : @"one",
            @"2" : @"two",
            @"3" : @"three",
            @"4" : @"four",
            @"5" : @"five",
            @"6" : @"six",
            @"7" : @"seven",
            @"8" : @"eight",
            @"9" : @"nine",

            @"10" : @"ten",
            @"11" : @"eleven",
            @"12" : @"twelve",
            @"13" : @"thirteen",
            @"14" : @"fourteen",
            @"15" : @"fifteen",
            @"16" : @"sixteen",
            @"17" : @"seventeen",
            @"18" : @"eighteen",
            @"19" : @"nineteen",

            @"20" : @"twenty",
            @"30" : @"thirty",
            @"40" : @"forty",
            @"50" : @"fifty",
            @"60" : @"sixty",
            @"70" : @"seventy",
            @"80" : @"eighty",
            @"90" : @"ninety",

            @"100" : @"one hundred",
            @"200" : @"two hundred",
            @"300" : @"three hundred",
            @"400" : @"four hundred",
            @"500" : @"five hundred",
            @"600" : @"six hundred",
            @"700" : @"seven hundred",
            @"800" : @"eight hundred",
            @"900" : @"nine hundred",
            @"1000": @"thousand",
        };
    
//  if language have simple rules you can construct ordinal number from cardinal and need no ordinal dictionaries.
    _english.ordinal = @{ };
    
 
    [_english setOrdinalLargeShort:@{ }];
    
    [_english setCardinalLargeShort:
        @{
             @"1000000"          : @"million",
             @"1000000000"       : @"billion",
             @"1000000000000"    : @"trillion",
             @"1000000000000000" : @"quadrillion",
        }
    ];
    
    [_english setOrdinalLargeLong:@{ }];
    
    [_english setCardinalLargeLong:
        @{
             @"1000000"          : @"million",
             @"1000000000"       : @"milliard",
             @"1000000000000"    : @"billion",
             @"1000000000000000" : @"billiard",
        }
    ];
    
    [_english setExceptions:
        @{
            @"ordinalExceptions" : @{
                                        @"one"    : @"first",
                                        @"two"    : @"second",
                                        @"three"  : @"third",
                                        @"five"   : @"fifth",
                                        @"eight"  : @"eighth",
                                        @"nine"   : @"ninth",
                                        @"twelve" : @"twelfth"
                                    }
        }];
    
    return _english;
}

@end
