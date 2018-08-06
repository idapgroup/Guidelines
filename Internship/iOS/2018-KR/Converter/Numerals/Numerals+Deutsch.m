//
//  Numerals+Deutsch.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "Numerals.h"

#import "GlobalKeys.h"

@implementation Numerals (Deutsch)

+ (Numerals *)deutsch {
    Numerals *_deutsch = [Numerals new];
    
    _deutsch.localeID = kDE;
    _deutsch.shortScale = YES;
    
    _deutsch.cardinal =
    @{
        @"0" : @"null",
        @"1" : @"eins",
        @"2" : @"zwei",
        @"3" : @"drei",
        @"4" : @"vier",
        @"5" : @"fünf",
        @"6" : @"sechs",
        @"7" : @"sieben",
        @"8" : @"acht",
        @"9" : @"neun",

        @"10" : @"zehn",
        @"11" : @"elf",
        @"12" : @"zwölf",
        @"13" : @"dreizehn",
        @"14" : @"vierzehn",
        @"15" : @"fünfzehn",
        @"16" : @"sechzehn",
        @"17" : @"siebzehn",
        @"18" : @"achtzehn",
        @"19" : @"neunzehn",

        @"20" : @"zwanzig",
        @"30" : @"dreißig",
        @"40" : @"vierzig",
        @"50" : @"fünfzig",
        @"60" : @"sechzig",
        @"70" : @"siebzig",
        @"80" : @"achtzig",
        @"90" : @"neunzig",
        
        @"100" : @"einhundert",
        @"200" : @"zweihundert",
        @"300" : @"dreihundert",
        @"400" : @"vierhundert",
        @"500" : @"fünfhundert",
        @"600" : @"sechshundert",
        @"700" : @"siebenhundert",
        @"800" : @"achthundert",
        @"900" : @"neunhundert",
        @"1000": @"tausend",
      };
    
    _deutsch.ordinal =
    @{
        @"0" : @"null",
        @"1" : @"erste",
        @"2" : @"zweite",
        @"3" : @"dritte",
        @"4" : @"vierte",
        @"5" : @"fünfte",
        @"6" : @"sechste",
        @"7" : @"siebte",
        @"8" : @"achte",
        @"9" : @"neunte",

        @"10" : @"zehnte",
        @"11" : @"elfte",
        @"12" : @"zwölfte",
        @"13" : @"dreizehnte",
        @"14" : @"vierzehnte",
        @"15" : @"fünfzehnte",
        @"16" : @"sechzehnte",
        @"17" : @"siebzehnte",
        @"18" : @"achtzehnte",
        @"19" : @"neunzehnte",

        @"20" : @"zwanzigste",
        @"30" : @"dreißigste",
        @"40" : @"vierzigste",
        @"50" : @"fünfzigste",
        @"60" : @"sechzigste",
        @"70" : @"siebzigste",
        @"80" : @"achtzigste",
        @"90" : @"neunzigste",
        
        @"100" : @"einhundertste",
        @"200" : @"zweihundertste",
        @"300" : @"dreihundertste",
        @"400" : @"vierhundertste",
        @"500" : @"fünfhundertste",
        @"600" : @"sechshundertste",
        @"700" : @"siebenhundertste",
        @"800" : @"achthundertste",
        @"900" : @"neunhundertste",
        @"1000": @"tausendste",

    };
 
    
    [_deutsch setOrdinalLargeShort:
     @{
        @"1000000"          : @"Millionste",
        @"1000000000"       : @"Billionste",
        @"1000000000000"    : @"Trillionste",
        @"1000000000000000" : @"Quadrillionste",
       }
     ];
    
    [_deutsch setCardinalLargeShort:
     @{
        @"1000000"          : @"Million",
        @"1000000000"       : @"Billion",
        @"1000000000000"    : @"Trillion",
        @"1000000000000000" : @"Quadrillion",
       }
     ];
    
    [_deutsch setOrdinalLargeLong:
     @{
        @"1000000"          : @"Millionste",
        @"1000000000"       : @"Milliardste",
        @"1000000000000"    : @"Billionste",
        @"1000000000000000" : @"Billiardste",
       }
     ];
    
    [_deutsch setCardinalLargeLong:
     @{
        @"1000000"          : @"Million",
        @"1000000000"       : @"Milliarde",
        @"1000000000000"    : @"Billion",
        @"1000000000000000" : @"Billiarde",
       }
     ];

    
    [_deutsch setExceptions:
     @{
       //
       @"ordinalExceptions" : @{
               @"Millionen" : @"Millionste",
               @"Billionen" : @"Billionste",
               @"Trillion" : @"Trillionste",
               @"Milliarden" : @"Milliardste",
               @"Billiarden" : @"Billiardste"
               },
       @"singleLargeExceptions" : @{
               @"eins tausend"    : @"eintausend",
               @"eins Million"    : @"eine Million",
               @"eins Billion"    : @"eine Billion",
               @"eins Trillion"   : @"eine Trillion",
               @"eins Milliard"   : @"eine Milliard",
               @"eins Billiard"   : @"eine Billiard",

               },

       }];
    
    return _deutsch;
}

@end
