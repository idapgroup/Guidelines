//
//  Matcher.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NumeralsFormatter;

@interface Matcher : NSObject

@property (strong, nonatomic) NSString *localeID;
@property (assign, nonatomic, getter = isShortScale) BOOL shortScale;

+ (instancetype)defaultMatcher;

- (void)addFormatter:(NumeralsFormatter *)formatter;
- (void)removeFormatterWithLocale:(NSString *)localeID;

- (NSArray<NSString *> *)availableLocaleID;

- (NSString *)unitsIn:(NSInteger)number multiplier:(long long)multiplier;
- (NSString *)tensAndTeensIn:(NSInteger)number multiplier:(long long)multiplier;
- (NSString *)hundredsIn:(NSInteger)number multiplier:(long long)multiplier;

- (NSString *)largeNumbersForMultiplier:(long long)multiplier quantity:(NSInteger)quantity;

//- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string;
//- (NSString *)starterFormatter:(long long)number;
//- (NSString *)finishingFormatter:(long long)number withString:(NSString *)string;


- (NSMutableArray *)threeDigitParser:(NSInteger)number multiplier:(long long)multiplier;


- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts;
- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts;





- (NSMutableArray *)newThreeDigitParser:(NSInteger)number multiplier:(long long)multiplier;
@end
