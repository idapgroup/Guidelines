//
//  NumeralFormatter.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

//  NumeralFormatter имеет набор правил, возможно расширяемых категорией
//  самые основные правила для КОЛИЧЕСТВЕННЫХ числительных
//  однозначное число от 0 до 9 -- ничего
//  двузначное число от 10 до 19 -- ничего
//  двузначное число от 20 до 99 -- если круглое, то ничего, не кругло -- вставляем разделитель
//  трехзначное чило от 100 до 999 -- ничего
//  большое число (10^3 до 10^15) -- иногда убирают единицу (не один миллион, а миллион)
//
//  основные правила для ПЕРЕЧИСЛЯЕМЫХ числительных
//  все изменения касаются лишь последней (крайней справа) значащей цифры
//  изменения касаются либо замены этой цифры, либо добавления окончаний
//  т.к. последняя значащая цифра и её порядок заранее не известны
//  приходится иметь полный набор для всех пяти групп цифр.

//  английский сет
//  cardinal
//      20-99 не круглые через дефис (twenty -> twenty-five
//      между всеми цифрами пробел
//  ordinal
//      замена последней цифры и стирание единицы для large (one million -> millionth)
//        но не для сотен, one hundredth вполне легально
//        для остальных one thousandth -- тысячная часть, а не тысячная по счету.
//        а может и нет :(
//      в дальнейшем возможно через правила.

//  немецкий сет
//  cardinal
//      20-99 не круглые сначала единица потом десяток, связаны союзом und.
//      все слова кроме large пишутся слитно
//      large обрамлен пробелами, с большой буквы и два окончания (для ед.ч. и мн.ч.)
//      Million -- Millionen, Milliard -- Milliarden
//  ordinal
//      замена последней цифры и стирание единственной значащей единицы для large
//      вполне возможно заменить на правила

#import <Foundation/Foundation.h>

@class Numerals;

@interface NumeralsFormatter : NSObject

@property (strong, nonatomic, readonly) NSString *localeID;
@property (strong, nonatomic, readonly) Numerals *numerals;

+ (instancetype)formatter;

- (instancetype)initWithNumerals:(Numerals *)numerals;
- (instancetype)initWithFile:(NSString *)path;

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(NSInteger)multiplier;
- (NSString *)teensFormatter:(NSInteger)number multiplier:(NSInteger)multiplier;
- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(NSInteger)multiplier;
- (NSString *)tensFormatter:(NSInteger)number multiplier:(NSInteger)multiplier;
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(NSInteger)multiplier;

- (NSString *)largeNumbersFormatter:(NSInteger)multiplier quantity:(NSInteger)quantity;

- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string;
- (NSString *)starterFormatter:(NSInteger)number;
- (NSString *)finishingFormatter:(NSInteger)number withString:(NSString *)string;

@end


