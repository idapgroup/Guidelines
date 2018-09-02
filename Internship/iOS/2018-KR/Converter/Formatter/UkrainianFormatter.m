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

static NSString * kOrdinalForm      = @"ordinalForm";
static NSString * kOrdinalPrefixes  = @"ordinalPrefixes";
static NSString * kUnitsForThousend = @"unitsForThousend";
static NSString * kGenitiveForm     = @"genitiveForm";

@implementation UkrainianFormatter

#pragma mark -
#pragma mark Public API
- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier {
    NSString *units = [super unitsFormatter:number multiplier:multiplier];
    
    if (multiplier == THOUSAND && number <= 2) {  //  один -> одна, два -> дві
        units = self.exceptions[kUnitsForThousend][units];
    }
    
    return units;
}

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    NSString *large = [super largeNumbersFormatter:multiplier quantity:quantity];
    
    NSInteger tens  = quantity % HUNDRED;
    NSInteger units = quantity % TEN;
    
    //  (три) тисячі, мільйона, більйона,
    //  2,3,4,.,22,23,24,..,32,33,34, x2,x3,x4. (except 12,13,14)
    BOOL isFirstRange = (units >= 2 && units <= 4) && (tens < 11 || tens > 20);
    
    //  (шість) тисяч, мільйонів, більйонів
    //  5,6,7-20,...,
    BOOL isSecondRange = (tens >= 5 && tens <= 20) || (units >= 5 && tens > 20) || units == 0;
    
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
    //  remaining numbers 1,21,31..91 (except 11) -> leave "тисяча" as is

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
                units = remainder % TEN;
                tens = remainder % HUNDRED;
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
