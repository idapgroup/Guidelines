//
//  EnglishFormatter.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NumeralsFormatter.h"

@interface EnglishFormatter : NumeralsFormatter

@end

@interface EnglishFormatter (Initialization)

+ (instancetype)formatter;

@end
