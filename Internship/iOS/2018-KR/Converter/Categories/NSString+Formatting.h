//
//  NSString+Formatting.h
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Formatting)

+ (NSString *)TYstringWithInt:(NSInteger)number;

+ (NSString *)TYstringWithLeadingWhitespace:(NSString *)string;

- (NSString *)TYreplaseSuffix:(NSString *)suffix withString:(NSString *)string;

- (NSString *)TYstringByTrimmingWhitespace;

@end
