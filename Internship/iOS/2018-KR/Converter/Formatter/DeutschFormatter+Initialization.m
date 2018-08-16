//
//  DeutschFormatter+Initialization.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 15.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "DeutschFormatter.h"

#import "GlobalKeys.h"

@implementation DeutschFormatter (Initialization)
+ (instancetype)formatter {
    DeutschFormatter *formatter = [DeutschFormatter new];
    
//    formatter.localeID = kDE;
    [formatter setValue:kDE forKey:@"localeID"];
    
    formatter.cardinalUnits    = @[
                                    @"null",
                                    @"eins",
                                    @"zwei",
                                    @"drei",
                                    @"vier",
                                    @"fünf",
                                    @"sechs",
                                    @"sieben",
                                    @"acht",
                                    @"neun"
                                   ];
    
    formatter.cardinalTens     = @[
                                    @"zehn",
                                    @"elf",
                                    @"zwölf",
                                    @"dreizehn",
                                    @"vierzehn",
                                    @"fünfzehn",
                                    @"sechzehn",
                                    @"siebzehn",
                                    @"achtzehn",
                                    @"neunzehn",

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
                                   @"",
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
                                   @"",
                                   @"", //  must be 'tausend'
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
