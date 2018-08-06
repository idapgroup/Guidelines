//
//  Numerals.h
//  IDAP_test
//
//  Created by Yevhen Triukhan on 26.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Numerals : NSObject

@property (strong, nonatomic) NSString *localeID;
@property (assign, nonatomic, getter = isShortScale) BOOL shortScale;

@property (strong, nonatomic) NSDictionary <NSString *, NSString *> *cardinal;
@property (strong, nonatomic) NSDictionary <NSString *, NSString *> *ordinal;
@property (strong, nonatomic) NSDictionary <NSString *, NSDictionary <NSString *, NSString *>*> *exceptions;

@property (strong, nonatomic, readonly) NSDictionary<NSString *, NSString *> *ordinalLarge;
@property (strong, nonatomic, readonly) NSDictionary<NSString *, NSString *> *cardinalLarge;

- (instancetype)initWithFile:(NSString *)path;

- (void)setOrdinalLargeShort:(NSDictionary<NSString *, NSString *> *)ordinalLargeShort;
- (void)setOrdinalLargeLong:(NSDictionary<NSString *, NSString *> *)ordinalLargeLong;
- (void)setCardinalLargeShort:(NSDictionary<NSString *, NSString *> *)cardinalLargeShort;
- (void)setCardinalLargeLong:(NSDictionary<NSString *, NSString *> *)cardinalLargeLong;

@end

@interface Numerals (English)

+ (Numerals *)english;

@end

@interface Numerals (Ukrainian)

+ (Numerals *)ukrainian;

@end

@interface Numerals (Deutsch)

+ (Numerals *)deutsch;

@end
