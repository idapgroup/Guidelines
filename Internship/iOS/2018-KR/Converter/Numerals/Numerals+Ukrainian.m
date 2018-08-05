//
//  Numerals+Ukrainian.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 28.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "Numerals.h"

@implementation Numerals (Ukrainian)

+ (Numerals *)ukrainian {
    Numerals *_ukrainian = [Numerals new];
    
    _ukrainian.localeID = kUA;
    _ukrainian.shortScale = YES;
    
    _ukrainian.cardinal =
        @{
            @"0" : @"нуль",
            @"1" : @"один",
            @"2" : @"два",
            @"3" : @"три",
            @"4" : @"чотири",
            @"5" : @"п'ять",
            @"6" : @"шість",
            @"7" : @"сім",
            @"8" : @"вісім",
            @"9" : @"дев'ять",

            @"10" : @"десять",
            @"11" : @"одинадцять",
            @"12" : @"дванадцять",
            @"13" : @"тринадцять",
            @"14" : @"чотирнадцять",
            @"15" : @"п'ятнадцять",
            @"16" : @"шістнадцять",
            @"17" : @"сімнадцять",
            @"18" : @"вісімнадцять",
            @"19" : @"дев'ятнадцять",

            @"20" : @"двадцять",
            @"30" : @"тридцять",
            @"40" : @"сорок",
            @"50" : @"п'ятдесят",
            @"60" : @"шістдесят",
            @"70" : @"сімдесят",
            @"80" : @"вісімдесят",
            @"90" : @"дев'яносто",
          
            @"100" : @"сто",
            @"200" : @"двісті",
            @"300" : @"триста",
            @"400" : @"чотириста",
            @"500" : @"п'ятсот",
            @"600" : @"шістсот",
            @"700" : @"сімсот",
            @"800" : @"вісімсот",
            @"900" : @"дев'ятсот",
//            @"1000" : @"тисяча"
          };
    
    _ukrainian.ordinal =
        @{
            @"0" : @"нульовий",
            @"1" : @"перший",
            @"2" : @"другий",
            @"3" : @"третій",
            @"4" : @"четвертий",
            @"5" : @"п'ятий",
            @"6" : @"шостий",
            @"7" : @"сьомий",
            @"8" : @"восьмий",
            @"9" : @"дев'ятий",

            @"10" : @"десятий",
            @"11" : @"одинадцятий",
            @"12" : @"дванадцятий",
            @"13" : @"тринадцятий",
            @"14" : @"чотирнадцятий",
            @"15" : @"п'ятнадцятий",
            @"16" : @"шістнадцятий",
            @"17" : @"сімнадцятий",
            @"18" : @"вісімнадцятий",
            @"19" : @"дев'ятнадцятий",

            @"20" : @"двадцятий",
            @"30" : @"тридцятий",
            @"40" : @"сороковий",
            @"50" : @"п'ятдесятий",
            @"60" : @"шістдесятий",
            @"70" : @"сімдесятий",
            @"80" : @"вісімдесятий",
            @"90" : @"дев'яностий",

            @"100" : @"сотий",
            @"200" : @"двохсотий",
            @"300" : @"трьохсотий",
            @"400" : @"чотирьохсотий",
            @"500" : @"п'ятисотий",
            @"600" : @"шістсотий",
            @"700" : @"семісотий",
            @"800" : @"восьмисотий",
            @"900" : @"дев'ятисотий",
//            @"1000": @"тисячний"
        };
    
    [_ukrainian setOrdinalLargeShort:
     @{
       @"1000"             : @"тисячний",
       @"1000000"          : @"мільйонний",
       @"1000000000"       : @"більйонний",
       @"1000000000000"    : @"трильйонний",
//       @"1000000000000000" : @"квадрільйонний",
       }
     ];
    
    [_ukrainian setCardinalLargeShort:
     @{
       @"1000"             : @"тисяча",
       @"1000000"          : @"мільйон",
       @"1000000000"       : @"більйон",
       @"1000000000000"    : @"трильйон",
//       @"1000000000000000" : @"квадрільйон",
       }
     ];
    
    [_ukrainian setOrdinalLargeLong:
     @{
       @"1000"             : @"тисячний",
       @"1000000"          : @"мільйонний",
       @"1000000000"       : @"мільярдний",
       @"1000000000000"    : @"більйонний",
//       @"1000000000000000" : @"биллиардний",
       }
     ];
    
    [_ukrainian setCardinalLargeLong:
     @{
       @"1000"             : @"тисяча",
       @"1000000"          : @"мільйон",
       @"1000000000"       : @"мільярд",
       @"1000000000000"    : @"більйон",
//       @"1000000000000000" : @"більярд",
       }
     ];
    
    [_ukrainian setExceptions:
     @{
       //
       @"ordinalPrefixes" : @{
               @"тисяч" : @"тисячний",
               @"мільйон" : @"мільйонний",
               @"більйон" : @"більйонний",
               @"трильйон" : @"трильйонний",
               @"мільярд" : @"мільярдний"
               },
       @"unitsForThousend" : @{  //  female
               @"1" : @"одна",
               @"2" : @"дві",
               },
       @"genitiveForm" : @{  //  род падеж
               @"1" : @"одно",
               @"2" : @"двох",
               @"3" : @"трьох",
               @"4" : @"чотирьох",
               @"5" : @"п'яти",
               @"6" : @"шести",
               @"7" : @"семи",
               @"8" : @"восьми",
               @"9" : @"дев'яти",
               
               @"10" : @"десяти",
               @"11" : @"одинадцяти",
               @"12" : @"дванадцяти",
               @"13" : @"тринадцяти",
               @"14" : @"чотирнадцяти",
               @"15" : @"п'ятнадцяти",
               @"16" : @"шістнадцяти",
               @"17" : @"сімнадцяти",
               @"18" : @"вісімнадцяти",
               @"19" : @"дев'ятнадцяти",
               
               @"20" : @"двадцяти",
               @"30" : @"тридцяти",
               @"40" : @"сорока",
               @"50" : @"п'ятдесяти",
               @"60" : @"шістдесяти",
               @"70" : @"сімдесяти",
               @"80" : @"вісімдесяти",
               @"90" : @"дев'яноста",
               
               @"100" : @"сто",
               @"200" : @"двохсот",
               @"300" : @"трьохсот",
               @"400" : @"чотириста",
               @"500" : @"п'ятисот",
               @"600" : @"шестисот",
               @"700" : @"семисот",
               @"800" : @"вісімсот",
               @"900" : @"дев'ятсот"
               },

       
       }];
//    NSArray *arr = [NSLocale availableLocaleIdentifiers];
//
//    NSString *path = NSTemporaryDirectory();
//    path = [path stringByAppendingPathComponent:@"locale.plist"];
//
//    NSMutableDictionary *plist = [NSMutableDictionary new];
//    [plist setObject:_ukrainian.ordinal forKey:@"ordinal"];
//    [plist setObject:_ukrainian.cardinal forKey:@"cardinal"];
//    [plist setObject:_ukrainian.exceptions forKey:@"exceptions"];
//    [plist setObject:_ukrainian.ordinalLargeShort forKey:@"ordinalLargeShort"];
//    [plist setObject:_ukrainian.ordinalLargeLong forKey:@"ordinalLargeLong"];
//    [plist setObject:_ukrainian.cardinalLargeShort forKey:@"cardinalLargeShort"];
//    [plist setObject:_ukrainian.cardinalLargeLong forKey:@"cardinalLargeLong"];
//    [plist setObject:_ukrainian.localeID forKey:@"localeID"];
//    [plist setObject:[NSNumber numberWithBool:_ukrainian.shortScale] forKey:@"shortScale"];
//    
//    NSDictionary *consPlist = [plist copy];
//    
//    [arr writeToFile:path atomically:YES];
//    
//    

    
    
    return _ukrainian;
    
}


@end
