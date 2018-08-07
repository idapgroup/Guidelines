//
//  NumeralFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NumeralsFormatter.h"

#import "NumeralsFormatterPrivate.h"
#import "Numerals.h"

#define PROTECT  return [self protect];

@implementation NumeralsFormatter

@synthesize numerals = _numerals;

#pragma mark -
#pragma mark Initialization
- (instancetype)initWithNumerals:(Numerals *)numerals {
    self = [super init];
    
    if (self) {
        _numerals = numerals;
    }
    
    return self;
}

- (instancetype)initWithFile:(NSString *)path {
    self = [super init];
    
    if (self) {
        Numerals *numerals = [[Numerals alloc] initWithFile:path];
        self = [self initWithNumerals:numerals];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors
- (NSString *)localeID {
    return self.numerals.localeID;
}

- (Numerals *)numerals {
    return _numerals;
}

#pragma mark -
#pragma mark Public API
+ (instancetype)formatter {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier     { PROTECT }
- (NSString *)teensFormatter:(NSInteger)number multiplier:(long long)multiplier     { PROTECT }
- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(long long)multiplier { PROTECT }
- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier      { PROTECT }
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier  { PROTECT }

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity   { PROTECT }

- (NSString *)ordinalFormatter:(long long)number withString:(NSString *)string    { PROTECT }
- (NSString *)starterFormatter:(long long)number                                  { PROTECT }
- (NSString *)finishingFormatter:(long long)number  withString:(NSString *)string { PROTECT }

#pragma mark -
#pragma mark Private API
- (id)protect {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

@end
