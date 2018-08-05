//
//  Matcher.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

//  Matcher просто сопостовляет цифры с ключами словаря
//  выбор словаря зависит от текущей локали.
//  формиратирование слова (установка порядка, вставка пробелов, дефисов, союзов)
//  выполняет Formatter.

#import <Foundation/Foundation.h>

@class NumeralsFormatter;

@interface Matcher : NSObject

@property (strong, nonatomic) NSString *localeID;
@property (assign, nonatomic, getter = isShortScale) BOOL shortScale;

+ (instancetype)defaultMatcher;

- (void)addFormatter:(NumeralsFormatter *)formatter;
- (BOOL)removeFormatterWithLocale:(NSString *)localeID;

- (NSArray<NSString *> *)availableLocaleID;

- (NSString *)unitsIn:(NSInteger)number multiplier:(NSInteger)multiplier;
- (NSString *)tensAndTeensIn:(NSInteger)number multiplier:(NSInteger)multiplier;
- (NSString *)hundredsIn:(NSInteger)number multiplier:(NSInteger)multiplier;

- (NSString *)largeNumbersForMultiplier:(long long)multiplier quantity:(NSInteger)quantity;

- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string;
- (NSString *)starterFormatter:(NSInteger)number;
- (NSString *)finishingFormatter:(NSInteger)number withString:(NSString *)string;

@end
