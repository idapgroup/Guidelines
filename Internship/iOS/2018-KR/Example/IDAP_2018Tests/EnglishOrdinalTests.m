//
//  EnglishOrdinalTests.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 01.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Converter.h"
#import "GlobalKeys.h"


@interface EnglishOrdinalTests : XCTestCase

@property (strong, nonatomic) Converter *converter;

@end

@implementation EnglishOrdinalTests

- (void)setUp {
    [super setUp];
    [super setUp];
    if (!_converter) {
        _converter = [[Converter alloc] init];
        _converter.localeID = kEN;
        _converter.ordinal = YES;
    }
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testOrdinalUnits {
        XCTAssert([[self.converter stringFromNumber:0] isEqualToString:@"zeroth"]);
    XCTAssert([[self.converter stringFromNumber:1] isEqualToString:@"first"]);
    XCTAssert([[self.converter stringFromNumber:2] isEqualToString:@"second"]);
    XCTAssert([[self.converter stringFromNumber:3] isEqualToString:@"third"]);
    XCTAssert([[self.converter stringFromNumber:4] isEqualToString:@"fourth"]);
    XCTAssert([[self.converter stringFromNumber:5] isEqualToString:@"fifth"]);
    XCTAssert([[self.converter stringFromNumber:6] isEqualToString:@"sixth"]);
    XCTAssert([[self.converter stringFromNumber:7] isEqualToString:@"seventh"]);
    XCTAssert([[self.converter stringFromNumber:8] isEqualToString:@"eighth"]);
    XCTAssert([[self.converter stringFromNumber:9] isEqualToString:@"ninth"]);
    
}

- (void)testOrdinalTeens {
    XCTAssert([[self.converter stringFromNumber:11] isEqualToString:@"eleventh"]);
    XCTAssert([[self.converter stringFromNumber:12] isEqualToString:@"twelfth"]);
    XCTAssert([[self.converter stringFromNumber:13] isEqualToString:@"thirteenth"]);
    XCTAssert([[self.converter stringFromNumber:14] isEqualToString:@"fourteenth"]);
    XCTAssert([[self.converter stringFromNumber:15] isEqualToString:@"fifteenth"]);
    XCTAssert([[self.converter stringFromNumber:16] isEqualToString:@"sixteenth"]);
    XCTAssert([[self.converter stringFromNumber:17] isEqualToString:@"seventeenth"]);
    XCTAssert([[self.converter stringFromNumber:18] isEqualToString:@"eighteenth"]);
    XCTAssert([[self.converter stringFromNumber:19] isEqualToString:@"nineteenth"]);
    
}

- (void)testOrdinalRoundTens {
    XCTAssert([[self.converter stringFromNumber:10] isEqualToString:@"tenth"]);
    XCTAssert([[self.converter stringFromNumber:20] isEqualToString:@"twentieth"]);
    XCTAssert([[self.converter stringFromNumber:30] isEqualToString:@"thirtieth"]);
    XCTAssert([[self.converter stringFromNumber:40] isEqualToString:@"fortieth"]);
    XCTAssert([[self.converter stringFromNumber:50] isEqualToString:@"fiftieth"]);
    XCTAssert([[self.converter stringFromNumber:60] isEqualToString:@"sixtieth"]);
    XCTAssert([[self.converter stringFromNumber:70] isEqualToString:@"seventieth"]);
    XCTAssert([[self.converter stringFromNumber:80] isEqualToString:@"eightieth"]);
    XCTAssert([[self.converter stringFromNumber:90] isEqualToString:@"ninetieth"]);
    
}

- (void)testOrdinalTens {
    XCTAssert([[self.converter stringFromNumber:21] isEqualToString:@"twenty-first"]);
    XCTAssert([[self.converter stringFromNumber:22] isEqualToString:@"twenty-second"]);
    XCTAssert([[self.converter stringFromNumber:23] isEqualToString:@"twenty-third"]);
    XCTAssert([[self.converter stringFromNumber:24] isEqualToString:@"twenty-fourth"]);
    XCTAssert([[self.converter stringFromNumber:25] isEqualToString:@"twenty-fifth"]);
    XCTAssert([[self.converter stringFromNumber:26] isEqualToString:@"twenty-sixth"]);
    XCTAssert([[self.converter stringFromNumber:27] isEqualToString:@"twenty-seventh"]);
    XCTAssert([[self.converter stringFromNumber:28] isEqualToString:@"twenty-eighth"]);
    XCTAssert([[self.converter stringFromNumber:29] isEqualToString:@"twenty-ninth"]);
    XCTAssert([[self.converter stringFromNumber:31] isEqualToString:@"thirty-first"]);
}

- (void)testOrdinalHundreds {
    XCTAssert([[self.converter stringFromNumber:100] isEqualToString:@"one hundredth"]);
    XCTAssert([[self.converter stringFromNumber:101] isEqualToString:@"one hundred first"]);
    XCTAssert([[self.converter stringFromNumber:119] isEqualToString:@"one hundred nineteenth"]);
    XCTAssert([[self.converter stringFromNumber:176] isEqualToString:@"one hundred seventy-sixth"]);
    
    XCTAssert([[self.converter stringFromNumber:264] isEqualToString:@"two hundred sixty-fourth"]);
    XCTAssert([[self.converter stringFromNumber:312] isEqualToString:@"three hundred twelfth"]);
    XCTAssert([[self.converter stringFromNumber:400] isEqualToString:@"four hundredth"]);
    XCTAssert([[self.converter stringFromNumber:541] isEqualToString:@"five hundred forty-first"]);
    XCTAssert([[self.converter stringFromNumber:677] isEqualToString:@"six hundred seventy-seventh"]);
    XCTAssert([[self.converter stringFromNumber:753] isEqualToString:@"seven hundred fifty-third"]);
    XCTAssert([[self.converter stringFromNumber:888] isEqualToString:@"eight hundred eighty-eighth"]);
    XCTAssert([[self.converter stringFromNumber:999] isEqualToString:@"nine hundred ninety-ninth"]);
}

- (void)testOrdinalThousands {
    XCTAssert([[self.converter stringFromNumber:1000] isEqualToString:@"one thousandth"]);
    XCTAssert([[self.converter stringFromNumber:2001] isEqualToString:@"two thousand first"]);
    XCTAssert([[self.converter stringFromNumber:3010] isEqualToString:@"three thousand tenth"]);
    XCTAssert([[self.converter stringFromNumber:4011] isEqualToString:@"four thousand eleventh"]);
    
    XCTAssert([[self.converter stringFromNumber:5202] isEqualToString:@"five thousand two hundred second"]);
    XCTAssert([[self.converter stringFromNumber:6486] isEqualToString:@"six thousand four hundred eighty-sixth"]);
    XCTAssert([[self.converter stringFromNumber:7575] isEqualToString:@"seven thousand five hundred seventy-fifth"]);
    
    XCTAssert([[self.converter stringFromNumber:21011] isEqualToString:@"twenty-one thousand eleventh"]);
    XCTAssert([[self.converter stringFromNumber:721011] isEqualToString:@"seven hundred twenty-one thousand eleventh"]);
}

//  http://anaseslblog.blogspot.com/2018/07/how-to-read-numbers-in-english.html
- (void)testOrdinalLargeNumbers {
    
    //  short scale
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"one millionth"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"one billionth"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"one trillionth"]);
    
    //  1,256,721
    XCTAssert([[self.converter stringFromNumber:1256721] isEqualToString:
               @"one million two hundred fifty-six thousand seven hundred twenty-first"]);
    //  31,256,721
    XCTAssert([[self.converter stringFromNumber:31256721] isEqualToString:
               @"thirty-one million two hundred fifty-six thousand seven hundred twenty-first"]);
    //  631,256,721
    XCTAssert([[self.converter stringFromNumber:631256721] isEqualToString:
               @"six hundred thirty-one million two hundred fifty-six thousand seven hundred twenty-first"]);
    //  1,492,638,526
    XCTAssert([[self.converter stringFromNumber:1492638526] isEqualToString:
               @"one billion four hundred ninety-two million six hundred thirty-eight thousand five hundred twenty-sixth"]);
    //  41,492,638,526
    XCTAssert([[self.converter stringFromNumber:41492638526] isEqualToString:
               @"forty-one billion four hundred ninety-two million six hundred thirty-eight thousand five hundred twenty-sixth"]);
    //  941,492,638,526
    XCTAssert([[self.converter stringFromNumber:941492638526] isEqualToString:
               @"nine hundred forty-one billion four hundred ninety-two million six hundred thirty-eight thousand five hundred twenty-sixth"]);
    
}


@end
