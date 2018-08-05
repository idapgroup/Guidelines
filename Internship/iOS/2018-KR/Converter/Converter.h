//
//  Converter.h
//  IDAP_test
//
//  Created by Yevhen Triukhan on 26.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NumeralsFormatter;

@interface Converter : NSObject

@property (strong, nonatomic) NSString *localeID;
@property (assign, nonatomic, getter = isOrdinal) BOOL ordinal;
@property (assign, nonatomic, getter = isShortScale) BOOL shortScale;
@property (strong, nonatomic, readonly) NSArray<NSString *> *availableLocaleID;

- (instancetype)init;  //  eng, ger, ukr
- (instancetype)initWithFormatter:(NumeralsFormatter *)formatter;

- (void)addFormatter:(NumeralsFormatter *)formatter;
- (void)removeFormatterWithLocale:(NSString *)localeID;

- (NSString *)stringFromNumber:(long long)number;  //  with current locale property
- (NSString *)stringFromNumber:(long long)number withLocale:(NSLocale *)locale;
@end
