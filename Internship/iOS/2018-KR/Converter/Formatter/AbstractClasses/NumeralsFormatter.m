//
//  NumeralFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NumeralsFormatter.h"
#import "NumeralsFormatter_PrivateHeader.h"

#define THROW_EXCEPTION           return [self protect];

#define PROTECT_GETTER(ivarName)  if (ivarName) { return ivarName; }\
                                  else          { THROW_EXCEPTION  }

@implementation NumeralsFormatter

#pragma mark -
#pragma mark Accessors
- (NSArray<NSString *> *)cardinalUnits {
    PROTECT_GETTER(_cardinalUnits)
}

- (NSArray<NSString *> *)cardinalTens {
    PROTECT_GETTER(_cardinalTens)
}

- (NSArray<NSString *> *)cardinalHundreds {
    PROTECT_GETTER(_cardinalHundreds)
}

- (NSArray<NSString *> *)cardinalLarge {
    PROTECT_GETTER(_cardinalLarge)
}


#pragma mark -
#pragma mark Public API
//  default units formatter
//  just take string from array by index

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier     {
    return self.cardinalUnits[number];
}

//  default tens (10..99) formatter
//  take string from array individiualy for units and tens
//  join result in "straight" order separated by whitespace
//  i.e. number of tens + whitespace + number of units

- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier      {
    if (number < 20) {  //  10..19
        
        return self.cardinalUnits[number];

    } else {  //  20, 30, .. 90
        NSString *tens = self.cardinalTens[number / TEN];
        NSInteger remainder = number % TEN;
        
        if (remainder > ZERO) {
            //  complex numerals, unit und tens
            NSString *units = [self unitsFormatter:remainder multiplier:multiplier];
            
            tens = [NSString stringWithFormat:@"%@ %@", tens, units];
        }
        
        return tens;
    }
}

//  default hundreds formatter
//  just take string from array by index

- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier  {
    return self.cardinalHundreds[number / HUNDRED];
}

//  default large formatter
//  calculate how many thousands in multiplier
//  take string from array by index

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity {
    NSInteger idx = log10(multiplier)/3;
    
    return self.cardinalLarge[idx];
}


- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts { THROW_EXCEPTION }

//  default finish formatter
//  handle ZERO and single digit
//  or
//  join all strigs in one separated by whitespace

- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts {
    
    if (parts.count == ZERO) {
        return self.cardinalUnits[ZERO];
    } else if (parts.count == 1) {
        return parts.firstObject;
    } else {
        return [parts componentsJoinedByString:kWHITESPACE];
    }
}

#pragma mark -
#pragma mark Private API
- (id)protect {
    if ([self isMemberOfClass:[NumeralsFormatter class]]) { //  проверка для норм работы наследников
        [self doesNotRecognizeSelector:_cmd];
    }
    
    return nil;
}

@end
