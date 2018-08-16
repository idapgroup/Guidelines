//
//  UkrainianFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "UkrainianFormatter.h"

#import "GlobalKeys.h"
#import "NSString+Formatting.h"

@interface UkrainianFormatter()

@property (strong, nonatomic, readwrite) NSString *localeID;

@end

static NSString * kOrdinalForm      = @"ordinalForm";
static NSString * kOrdinalPrefixes  = @"ordinalPrefixes";
static NSString * kUnitsForThousend = @"unitsForThousend";
static NSString * kGenitiveForm     = @"genitiveForm";

@implementation UkrainianFormatter

@synthesize localeID = _localeID;

#pragma mark -
#pragma mark Initialization
- (instancetype)init {
    self = [super init];
    
    if (self) {
        _localeID = kUA;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public API
- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    
    NSString *units = self.cardinalUnits[number];  //  1..9
    
    if (multiplier == THOUSAND && number <= 2) {  //  один -> одна, два -> дві
        units = self.exceptions[kUnitsForThousend][units];
    }
    
    return units;
}

- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier {
    
    if (number < 20) {  //  10..19
        
        return self.cardinalTens[number % 10];
        
    } else {  //  20, 30, .. 90
        NSString *tens = self.cardinalTens[8 + (number / 10)];
        NSInteger remainder = number % 10;
        
        if (remainder > 0) {
            //  complex numerals, unit und tens
            NSString *units = [self unitsFormatter:remainder multiplier:multiplier];
            
            tens = [NSString stringWithFormat:@"%@ %@", tens, units];
        }
        
        return tens;
    }
}

- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier {

    return self.cardinalHundreds[number / 100];
}


- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    NSInteger idx = log10(multiplier)/3;
    NSInteger tens  = quantity % 100;
    NSInteger units = quantity % 10;
    
    //  (три) тисячі, мільйона, більйона,
    //  2,3,4,.,22,23,24,..,32,33,34, x2,x3,x4. (except 12,13,14)
    BOOL isFirstRange = (units >= 2 && units <= 4) && (tens < 11 || tens > 20);
    
    //  (шість) тисяч, мільйонів, більйонів
    //  5,6,7-20,...,
    BOOL isSecondRange = (tens >= 5 && tens <= 20) || (units >= 5 && tens > 20) || units == 0;
    
    NSString *large = self.cardinalLarge[idx];  //  тисяча, hidden range 1,21,31..91 (except 11)

    
    if (isFirstRange) {
        if (multiplier == THOUSAND) {
            large = [large TYreplaseSuffix:@"а" withString:@"і"];
        } else {
            large = [large stringByAppendingString:@"а"];
        }
    } else if (isSecondRange) {
        if (multiplier == THOUSAND) {
            large = [large TYreplaseSuffix:@"а" withString:kEMPTY_STRING];
        } else {
            large = [large stringByAppendingString:@"ів"];
        }
    }
    
    return large;
}

- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts {
    
    if (parts.count == 0) {
        NSString *zero = self.exceptions[kOrdinalForm][self.cardinalUnits[ZERO]];
        return [NSMutableArray arrayWithObject:zero];
    }
    
    //  "двацять один" -> "двадцять", "один".
    NSMutableArray *tempParts = [[[parts componentsJoinedByString:kWHITESPACE] componentsSeparatedByString:kWHITESPACE] mutableCopy];
    
    NSString *ordinal = nil;
    NSString *cardinal = tempParts.lastObject;

    if (!cardinal) {
        cardinal = self.cardinalUnits[ZERO];
        [tempParts addObject:cardinal];
    }
    
    //  0..999
    if (!ordinal) {
        ordinal = self.exceptions[kOrdinalForm][cardinal];
    }
    
    //  n thousand, million, billion, etc
    if (!ordinal) {
        //  replace last word
        //  some large numbers have changed ending (тисяча -> тисячі, мільйон -> мільйона),
        //  they can't be found in main ordinalForm dictionary.
        //  check out prefix dictionary
        NSDictionary *prefixes = self.exceptions[kOrdinalPrefixes];
        
        for (NSString *prefix in prefixes) {
            if ([cardinal hasPrefix:prefix]) {
                ordinal = prefixes[prefix];
                break;
            }
        }
        [tempParts replaceObjectAtIndex:tempParts.count - 1
                             withObject:ordinal];
        
        //  replace word(s) before last with same word in genitive form
        tempParts = [self replaceWordWithGenitiveForm:tempParts number:number];
        
        //  join all words in ona big word
        tempParts = [NSMutableArray arrayWithObject:[tempParts componentsJoinedByString:kEMPTY_STRING]];
        
        return tempParts;
    }
    
    //  "одна тисяча" -> "тисячний", "один мільйон" -> "мільйонний"
    if (number == THOUSAND || number == MILLION || number == BILLION || number == TRILLION) {
        [tempParts removeObjectAtIndex:tempParts.count - 2];
        ordinal = self.exceptions[kOrdinalForm][cardinal];
    }
    
    [tempParts replaceObjectAtIndex:tempParts.count - 1 withObject:ordinal];
        
    return tempParts;
}

- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts {
    
    if (parts.count == 0) {
        return self.cardinalUnits[ZERO];
    } else if (parts.count == 1) {
        return parts.firstObject;
    } else {
        return [parts componentsJoinedByString:kWHITESPACE];
    }
}

#pragma mark -
#pragma mark Private API
- (NSMutableArray<NSString *> *) replaceWordWithGenitiveForm:(NSMutableArray<NSString *> *)parts number:(long long)number {
    
    //  replace  "дві", "тисячі" -> "двох", "тисячний"
    //  or even better  "двадцять", "дві", "тисячі" -> "двадцяти", "двох", "тисячний"
    NSInteger lastIdx = parts.count - 1;
    
    //  calculate two last valuable digits  24000 -> 24
    NSInteger units = 0;
    NSInteger tens = 0;
    if (number > 0) {
        while (true) {
            NSInteger remainder = number % THOUSAND;
            if(remainder > 0) {
                units = remainder % 10;
                tens = remainder % 100;
                break;
            } else {
                number /= THOUSAND;
            }
        }
    }
    
    //  all numerals from "двадцять один" to "дев'яносто дев'ять" (except round tens) is combined
    //  and need to replace two both digits
    BOOL isCombinedNumeral = (tens > 20 && units != 1);
    
    NSString *secondlast = parts[lastIdx - 1];
    [parts replaceObjectAtIndex:(lastIdx - 1)
                               withObject:[self genitiveForCardinalNumber:secondlast]];
    
    if (isCombinedNumeral) {
        NSString *thirdLast = parts[lastIdx - 2];
        [parts replaceObjectAtIndex:(lastIdx - 2)
                             withObject:[self genitiveForCardinalNumber:thirdLast]];
    }
    
    return parts;
}

- (NSString *)genitiveForCardinalNumber:(NSString *)number {
    NSString *genitive = self.exceptions[kGenitiveForm][number];
    
    //  одна, дві
    if (!genitive) {
        NSString *origin = [self.exceptions[kUnitsForThousend] allKeysForObject:number].firstObject;
        genitive = self.exceptions[kGenitiveForm][origin];
    }
    
    return genitive;
}

@end
