//
//  EnglishCardinalTests.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 31.07.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Converter.h"
#import "GlobalKeys.h"

@interface EnglishCardinalTests : XCTestCase

@property (strong, nonatomic) Converter *converter;

@end

@implementation EnglishCardinalTests

- (void)setUp {
    [super setUp];
    
    if (!_converter) {
        _converter = [[Converter alloc] init];
        _converter.localeID = kEN;
        _converter.ordinal = NO;
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testCardinalUnits {
    XCTAssert([[self.converter stringFromNumber:0] isEqualToString:@"zero"]);
    XCTAssert([[self.converter stringFromNumber:1] isEqualToString:@"one"]);
    XCTAssert([[self.converter stringFromNumber:2] isEqualToString:@"two"]);
    XCTAssert([[self.converter stringFromNumber:3] isEqualToString:@"three"]);
    XCTAssert([[self.converter stringFromNumber:4] isEqualToString:@"four"]);
    XCTAssert([[self.converter stringFromNumber:5] isEqualToString:@"five"]);
    XCTAssert([[self.converter stringFromNumber:6] isEqualToString:@"six"]);
    XCTAssert([[self.converter stringFromNumber:7] isEqualToString:@"seven"]);
    XCTAssert([[self.converter stringFromNumber:8] isEqualToString:@"eight"]);
    XCTAssert([[self.converter stringFromNumber:9] isEqualToString:@"nine"]);
    
}

- (void)testCardinalTeens {
    XCTAssert([[self.converter stringFromNumber:11] isEqualToString:@"eleven"]);
    XCTAssert([[self.converter stringFromNumber:12] isEqualToString:@"twelve"]);
    XCTAssert([[self.converter stringFromNumber:13] isEqualToString:@"thirteen"]);
    XCTAssert([[self.converter stringFromNumber:14] isEqualToString:@"fourteen"]);
    XCTAssert([[self.converter stringFromNumber:15] isEqualToString:@"fifteen"]);
    XCTAssert([[self.converter stringFromNumber:16] isEqualToString:@"sixteen"]);
    XCTAssert([[self.converter stringFromNumber:17] isEqualToString:@"seventeen"]);
    XCTAssert([[self.converter stringFromNumber:18] isEqualToString:@"eighteen"]);
    XCTAssert([[self.converter stringFromNumber:19] isEqualToString:@"nineteen"]);
    
}

- (void)testCardinalRoundTens {
    XCTAssert([[self.converter stringFromNumber:10] isEqualToString:@"ten"]);
    XCTAssert([[self.converter stringFromNumber:20] isEqualToString:@"twenty"]);
    XCTAssert([[self.converter stringFromNumber:30] isEqualToString:@"thirty"]);
    XCTAssert([[self.converter stringFromNumber:40] isEqualToString:@"forty"]);
    XCTAssert([[self.converter stringFromNumber:50] isEqualToString:@"fifty"]);
    XCTAssert([[self.converter stringFromNumber:60] isEqualToString:@"sixty"]);
    XCTAssert([[self.converter stringFromNumber:70] isEqualToString:@"seventy"]);
    XCTAssert([[self.converter stringFromNumber:80] isEqualToString:@"eighty"]);
    XCTAssert([[self.converter stringFromNumber:90] isEqualToString:@"ninety"]);
    
}

- (void)testCardinalTens {
    XCTAssert([[self.converter stringFromNumber:21] isEqualToString:@"twenty-one"]);
    XCTAssert([[self.converter stringFromNumber:22] isEqualToString:@"twenty-two"]);
    XCTAssert([[self.converter stringFromNumber:23] isEqualToString:@"twenty-three"]);
    XCTAssert([[self.converter stringFromNumber:24] isEqualToString:@"twenty-four"]);
    XCTAssert([[self.converter stringFromNumber:25] isEqualToString:@"twenty-five"]);
    XCTAssert([[self.converter stringFromNumber:26] isEqualToString:@"twenty-six"]);
    XCTAssert([[self.converter stringFromNumber:27] isEqualToString:@"twenty-seven"]);
    XCTAssert([[self.converter stringFromNumber:28] isEqualToString:@"twenty-eight"]);
    XCTAssert([[self.converter stringFromNumber:29] isEqualToString:@"twenty-nine"]);
    XCTAssert([[self.converter stringFromNumber:31] isEqualToString:@"thirty-one"]);
}

- (void)testCardinalHundreds {

    XCTAssert([[self.converter stringFromNumber:100] isEqualToString:@"one hundred"]);
    XCTAssert([[self.converter stringFromNumber:101] isEqualToString:@"one hundred one"]);
    XCTAssert([[self.converter stringFromNumber:119] isEqualToString:@"one hundred nineteen"]);
    XCTAssert([[self.converter stringFromNumber:176] isEqualToString:@"one hundred seventy-six"]);
    
    XCTAssert([[self.converter stringFromNumber:264] isEqualToString:@"two hundred sixty-four"]);
    XCTAssert([[self.converter stringFromNumber:312] isEqualToString:@"three hundred twelve"]);
    XCTAssert([[self.converter stringFromNumber:400] isEqualToString:@"four hundred"]);
    XCTAssert([[self.converter stringFromNumber:541] isEqualToString:@"five hundred forty-one"]);
    XCTAssert([[self.converter stringFromNumber:677] isEqualToString:@"six hundred seventy-seven"]);
    XCTAssert([[self.converter stringFromNumber:753] isEqualToString:@"seven hundred fifty-three"]);
    XCTAssert([[self.converter stringFromNumber:857] isEqualToString:@"eight hundred fifty-seven"]);
    XCTAssert([[self.converter stringFromNumber:999] isEqualToString:@"nine hundred ninety-nine"]);
}

- (void)testCardinalThousands {
    XCTAssert([[self.converter stringFromNumber:1000] isEqualToString:@"one thousand"]);
    XCTAssert([[self.converter stringFromNumber:2001] isEqualToString:@"two thousand one"]);
    XCTAssert([[self.converter stringFromNumber:3010] isEqualToString:@"three thousand ten"]);
    XCTAssert([[self.converter stringFromNumber:4011] isEqualToString:@"four thousand eleven"]);
    
    XCTAssert([[self.converter stringFromNumber:5201] isEqualToString:@"five thousand two hundred one"]);
    XCTAssert([[self.converter stringFromNumber:6486] isEqualToString:@"six thousand four hundred eighty-six"]);
    XCTAssert([[self.converter stringFromNumber:7575] isEqualToString:@"seven thousand five hundred seventy-five"]);
    
    XCTAssert([[self.converter stringFromNumber:21011] isEqualToString:@"twenty-one thousand eleven"]);
    XCTAssert([[self.converter stringFromNumber:721011] isEqualToString:@"seven hundred twenty-one thousand eleven"]);
    
}

//  http://anaseslblog.blogspot.com/2018/07/how-to-read-numbers-in-english.html
- (void)testCardinalLargeNumbers {
    
    //  short scale
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"one million"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"one billion"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"one trillion"]);
    
    //  1,256,721
//     NSLog(@"%@", [self.converter stringFromNumber:1256721]);
    XCTAssert([[self.converter stringFromNumber:1256721] isEqualToString:
               @"one million two hundred fifty-six thousand seven hundred twenty-one"]);
    //  31,256,721
//    NSLog(@"%@", [self.converter stringFromNumber:31256721]);
    XCTAssert([[self.converter stringFromNumber:31256721] isEqualToString:
               @"thirty-one million two hundred fifty-six thousand seven hundred twenty-one"]);
    //  631,256,721
    XCTAssert([[self.converter stringFromNumber:631256721] isEqualToString:
               @"six hundred thirty-one million two hundred fifty-six thousand seven hundred twenty-one"]);
    //  1,492,638,526
    XCTAssert([[self.converter stringFromNumber:1492638526] isEqualToString:
               @"one billion four hundred ninety-two million six hundred thirty-eight thousand five hundred twenty-six"]);
    //  41,492,638,526
    XCTAssert([[self.converter stringFromNumber:41492638526] isEqualToString:
               @"forty-one billion four hundred ninety-two million six hundred thirty-eight thousand five hundred twenty-six"]);
    //  941,492,638,526
    XCTAssert([[self.converter stringFromNumber:941492638526] isEqualToString:
               @"nine hundred forty-one billion four hundred ninety-two million six hundred thirty-eight thousand five hundred twenty-six"]);
    

}



@end
