//
//  NSString+Formatting.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 30.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NSString+Formatting.h"

@implementation NSString (Formatting)

+ (NSString *)TYstringWithInt:(NSInteger)number {
    
    return [NSString stringWithFormat:@"%ld", number];
}

+ (NSString *)TYstringWithLeadingWhitespace:(NSString *)string {
    
    return [NSString stringWithFormat:@" %@", string];
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
