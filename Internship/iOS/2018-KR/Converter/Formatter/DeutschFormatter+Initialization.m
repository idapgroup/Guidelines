//
//  DeutschFormatter+Initialization.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 15.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "DeutschFormatter.h"
#import "NumeralsFormatter_PrivateHeader.h"

@implementation DeutschFormatter (Initialization)
+ (instancetype)formatter {
    DeutschFormatter *formatter = [DeutschFormatter new];
    
    formatter.localeID         = kDE;
    
    formatter.cardinalUnits    = @[
                                    @"null",  //  0
                                    @"eins",
                                    @"zwei",
                                    @"drei",
                                    @"vier",
                                    @"fünf",
                                    @"sechs",
                                    @"sieben",
                                    @"acht",
                                    @"neun",  //  9
                                    
                                    @"zehn",  //  10
                                    @"elf",
                                    @"zwölf",
                                    @"dreizehn",
                                    @"vierzehn",
                                    @"fünfzehn",
                                    @"sechzehn",
                                    @"siebzehn",
                                    @"achtzehn",
                                    @"neunzehn",  //  19
                                   ];
    
    formatter.cardinalTens     = @[
                                    kEMPTY_STRING,
                                    @"zehn",
                                    @"zwanzig",
                                    @"dreißig",
                                    @"vierzig",
                                    @"fünfzig",
                                    @"sechzig",
                                    @"siebzig",
                                    @"achtzig",
                                    @"neunzig"
                                   ];
    
    
    formatter.cardinalHundreds = @[
                                   kEMPTY_STRING,
                                   @"einhundert",
                                   @"zweihundert",
                                   @"dreihundert",
                                   @"vierhundert",
                                   @"fünfhundert",
                                   @"sechshundert",
                                   @"siebenhundert",
                                   @"achthundert",
                                   @"neunhundert",
                                   @"tausend"
                                  ];
    
    formatter.cardinalLarge    = @[
                                   kEMPTY_STRING,
//                                   kEMPTY_STRING, //  can be 'tausend'
                                   @"tausend",
                                   @"Million",
                                   @"Milliarde",
                                   @"Billion"
                                  ];
    
    formatter.exceptions       = @{
                                   @"ordinalExceptions" : @{
                                           @"eins"   : @"erste",
                                           @"drei"   : @"dritte",
                                           @"sieben" : @"siebte",
                                           @"acht"   : @"achte",
                                           
                                           @"Millionen"  : @"Millionste",
                                           @"Milliarden" : @"Milliardste",
                                           @"Billionen"  : @"Billionste",
                                           },
                                   @"singleLargeExceptions" : @{
                                           @"eins tausend"    : @"eintausend",
                                           @"eins Million"    : @"eine Million",
                                           @"eins Milliard"   : @"eine Milliard",
                                           @"eins Billion"    : @"eine Billion",
                                           
                                           },

                                   };
    
    return formatter;
}

@end
