//
//  EnglishFormatter+Initialization.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 15.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "EnglishFormatter.h"
#import "NumeralsFormatter_PrivateHeader.h"


@implementation EnglishFormatter (Initialization)

+ (instancetype)formatter {
    EnglishFormatter *formatter = [EnglishFormatter new];
    
    formatter.localeID         = kEN;
    
    formatter.cardinalUnits    = @[
                                    @"zero",
                                    @"one",
                                    @"two",
                                    @"three",
                                    @"four",
                                    @"five",
                                    @"six",
                                    @"seven",
                                    @"eight",
                                    @"nine",
                                    
                                    @"ten",
                                    @"eleven",
                                    @"twelve",
                                    @"thirteen",
                                    @"fourteen",
                                    @"fifteen",
                                    @"sixteen",
                                    @"seventeen",
                                    @"eighteen",
                                    @"nineteen",
                                  ];
    
    formatter.cardinalTens     = @[
                                    kEMPTY_STRING,
                                    @"ten",
                                    @"twenty",
                                    @"thirty",
                                    @"forty",
                                    @"fifty",
                                    @"sixty",
                                    @"seventy",
                                    @"eighty",
                                    @"ninety"
                                  ];
    
    
    formatter.cardinalHundreds = @[
                                    kEMPTY_STRING,
                                    @"one hundred",
                                    @"two hundred",
                                    @"three hundred",
                                    @"four hundred",
                                    @"five hundred",
                                    @"six hundred",
                                    @"seven hundred",
                                    @"eight hundred",
                                    @"nine hundred"
                                  ];
    
    formatter.cardinalLarge    = @[
                                    kEMPTY_STRING,
                                    @"thousand",
                                    @"million",
                                    @"billion",
                                    @"trillion"
                                  ];
    
    formatter.exceptions       = @{
                                    @"ordinalExceptions" : @{
                                                                @"one"    : @"first",
                                                                @"two"    : @"second",
                                                                @"three"  : @"third",
                                                                @"five"   : @"fifth",
                                                                @"eight"  : @"eighth",
                                                                @"nine"   : @"ninth",
                                                                @"twelve" : @"twelfth"
                                                            }
                                 };
    
    return formatter;
}


@end
