//
//  NSString+Formatting.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NSString+Formatting.h"

@implementation NSString (Formatting)

+ (NSString *)TYstringWithInt:(long long)number {
    
    return [NSString stringWithFormat:@"%lld", number];
}

- (NSString *)TYreplaseSuffix:(NSString *)suffix withString:(NSString *)string {
    NSString *result = self;
    
    if ([self hasSuffix:suffix]) {
        NSRange suffixRange = NSMakeRange(self.length - suffix.length, suffix.length);
        result = [self stringByReplacingOccurrencesOfString:suffix
                                               withString:string
                                                  options:NSCaseInsensitiveSearch
                                                    range:suffixRange];
    }
    
    return result;
}

- (NSString *)TYstringByTrimmingWhitespace {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
