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
@property (strong, nonatomic, readonly) NSArray<NSString *> *availableLocaleID;

- (instancetype)init;  //  eng, ger, ukr

- (NSString *)stringFromNumber:(long long)number;  //  with current locale property
//- (NSString *)stringFromNumber:(long long)number withLocale:(NSLocale *)locale;


@end
