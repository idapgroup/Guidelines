//
//  Numerals.m
//  IDAP_test
//
//  Created by Yevhen Triukhan on 26.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "Numerals.h"

@interface Numerals ()

@property (strong, nonatomic) NSDictionary<NSString *, NSString *> *ordinalLargeShort;
@property (strong, nonatomic) NSDictionary<NSString *, NSString *> *ordinalLargeLong;

@property (strong, nonatomic) NSDictionary<NSString *, NSString *> *cardinalLargeShort;
@property (strong, nonatomic) NSDictionary<NSString *, NSString *> *cardinalLargeLong;

@end

static NSString * kOrdinal            = @"ordinal";
static NSString * kOrdinalLargeShort  = @"ordinalLargeShort";
static NSString * kOrdinalLargeLong   = @"ordinalLargeLong";

static NSString * kCardinal           = @"cardinal";
static NSString * kCardinalLargeShort = @"cardinalLargeShort";
static NSString * kCardinalLargeLong  = @"cardinalLargeLong";

static NSString * kLocaleID           = @"localeID";
static NSString * kShortScale         = @"shortScale";
static NSString * kExceptions         = @"exceptions";



@implementation Numerals

@dynamic ordinalLarge, cardinalLarge;

#pragma mark -
#pragma mark Accessors
- (NSDictionary<NSString *,NSString *> *)ordinalLarge {
    if (self.isShortScale) {
        return self.ordinalLargeShort;
    } else {
        return self.ordinalLargeLong;
    }
}

- (NSDictionary<NSString *,NSString *> *)cardinalLarge {
    if (self.isShortScale) {
        return self.cardinalLargeShort;
    } else {
        return self.cardinalLargeLong;
    }
}

#pragma mark -
#pragma mark Public API
- (void)setOrdinalLargeShort:(NSDictionary<NSString *, NSString *> *)ordinalLargeShort {
    if (_ordinalLargeShort != ordinalLargeShort) {
        _ordinalLargeShort = ordinalLargeShort;
    }
}
- (void)setOrdinalLargeLong:(NSDictionary<NSString *, NSString *> *)ordinalLargeLong {
    if (_ordinalLargeLong != ordinalLargeLong) {
        _ordinalLargeLong = ordinalLargeLong;
    }
}
- (void)setCardinalLargeShort:(NSDictionary<NSString *, NSString *> *)cardinalLargeShort {
    if (_cardinalLargeShort != cardinalLargeShort) {
        _cardinalLargeShort = cardinalLargeShort;
    }
}
- (void)setCardinalLargeLong:(NSDictionary<NSString *, NSString *> *)cardinalLargeLong {
    if (_cardinalLargeLong != cardinalLargeLong) {
        _cardinalLargeLong = cardinalLargeLong;
    }
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,NSDictionary *> *)properties {
    self = [super init];
    return nil;
}

- (instancetype)initWithFile:(NSString *)path {
    self = [super init];
    
    if (self) {
        NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:path];
        
        if (plist) {
            _ordinal = [plist objectForKey:kOrdinal];
            _ordinalLargeShort = [plist objectForKey:kOrdinalLargeShort];
            _ordinalLargeLong = [plist objectForKey:kOrdinalLargeLong];
            
            _cardinal = [plist objectForKey:kCardinal];
            _cardinalLargeShort = [plist objectForKey:kCardinalLargeShort];
            _cardinalLargeLong = [plist objectForKey:kCardinalLargeLong];
            
            _exceptions = [plist objectForKey:kExceptions];
            
            _localeID = [plist objectForKey:kLocaleID];
            _shortScale = [plist objectForKey:kShortScale];
        }
    }
    
    return self;
}

@end
