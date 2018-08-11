//
//  NumeralFormatter.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Numerals, map;

@interface NumeralsFormatter : NSObject

@property (strong, nonatomic, readonly) NSString *localeID;
@property (strong, nonatomic, readonly) Numerals *numerals;

+ (instancetype)formatter;

- (instancetype)initWithNumerals:(Numerals *)numerals;
- (instancetype)initWithFile:(NSString *)path;

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier;
- (NSString *)teensFormatter:(NSInteger)number multiplier:(long long)multiplier;
- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(long long)multiplier;
- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier;
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier;

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity;

- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string;
- (NSString *)starterFormatter:(long long)number;
- (NSString *)finishingFormatter:(long long)number withString:(NSString *)string;


- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts;
- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts;

@end


