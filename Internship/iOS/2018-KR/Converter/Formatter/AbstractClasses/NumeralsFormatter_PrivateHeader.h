//
//  NumeralsFormatter_PrivateHeader.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 01.09.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NumeralsFormatter.h"

#import "GlobalKeys.h"

@interface NumeralsFormatter ()

@property (strong, nonatomic, readwrite) NSString *localeID;

@property (strong, nonatomic, readwrite) NSArray<NSString *>*cardinalUnits;
@property (strong, nonatomic, readwrite) NSArray<NSString *>*cardinalTens;
@property (strong, nonatomic, readwrite) NSArray<NSString *>*cardinalHundreds;
@property (strong, nonatomic, readwrite) NSArray<NSString *>*cardinalLarge;

@property (strong, nonatomic, readwrite) NSDictionary<NSString *, NSDictionary *> *exceptions;

@end
