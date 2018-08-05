//
//  NumeralFormatter.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

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


