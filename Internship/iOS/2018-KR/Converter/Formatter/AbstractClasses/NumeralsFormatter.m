//
//  NumeralFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NumeralsFormatter.h"

#define PROTECT  return [self protect];

@implementation NumeralsFormatter

#pragma mark -
#pragma mark Initialization
//- (instancetype)initWithFile:(NSString *)path {
//    self = [super init];
//    
//    if (self) {
//        //  path should point to plist with arrays and dictionaries
//        //  in this place all properties will initialize with these collections
//    }
//    
//    return self;
//}

#pragma mark -
#pragma mark Public API
- (NSString *)unitsFormatter:(NSInteger)number multiplier:(long long)multiplier     { PROTECT }
- (NSString *)teensFormatter:(NSInteger)number multiplier:(long long)multiplier     { PROTECT }
- (NSString *)roundTensFormatter:(NSInteger)number multiplier:(long long)multiplier { PROTECT }
- (NSString *)tensFormatter:(NSInteger)number multiplier:(long long)multiplier      { PROTECT }
- (NSString *)hundredsFormatter:(NSInteger)number multiplier:(long long)multiplier  { PROTECT }

- (NSString *)largeNumbersFormatter:(long long)multiplier quantity:(NSInteger)quantity   { PROTECT }

- (NSMutableArray *)ordinalFormatter:(long long)number withParts:(NSMutableArray *)parts { PROTECT }
- (NSString *)finishingFormatter:(long long)number withParts:(NSMutableArray *)parts { PROTECT }

#pragma mark -
#pragma mark Private API
- (id)protect {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

@end
