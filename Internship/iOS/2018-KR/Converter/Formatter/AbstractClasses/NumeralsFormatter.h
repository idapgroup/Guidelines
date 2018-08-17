//
//  NumeralFormatter.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumeralsFormatter : NSObject

@property (strong, nonatomic, readonly) NSString *localeID;

@property (strong, nonatomic) NSArray<NSString *>*cardinalUnits;
@property (strong, nonatomic) NSArray<NSString *>*cardinalTens;
@property (strong, nonatomic) NSArray<NSString *>*cardinalHundreds;
@property (strong, nonatomic) NSArray<NSString *>*cardinalLarge;

@property (strong, nonatomic) NSDictionary<NSString *, NSDictionary *> *exceptions;

//  maybe later
//- (instancetype)initWithFile:(NSString *)path;

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier;
- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier;
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier;

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity;

- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts;
- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts;

@end


