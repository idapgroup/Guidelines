//
//  UkrainianCardinalTests.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 01.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Converter.h"
#import "UkrainianFormatter.h"
#import "GlobalKeys.h"

@interface UkrainianCardinalTests : XCTestCase

@property (strong, nonatomic) Converter *converter;

@end

@implementation UkrainianCardinalTests

- (void)setUp {
    [super setUp];
    
    if (!_converter) {
        _converter = [[Converter alloc] init];
        _converter.localeID = kUA;
        _converter.shortScale = YES;
        _converter.ordinal = NO;
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCardinalUnits {
    //    XCTAssert([[self.converter stringFromNumber:0] isEqualToString:@"нуль"]);
    XCTAssert([[self.converter stringFromNumber:1] isEqualToString:@"один"]);
    XCTAssert([[self.converter stringFromNumber:2] isEqualToString:@"два"]);
    XCTAssert([[self.converter stringFromNumber:3] isEqualToString:@"три"]);
    XCTAssert([[self.converter stringFromNumber:4] isEqualToString:@"чотири"]);
    XCTAssert([[self.converter stringFromNumber:5] isEqualToString:@"п'ять"]);
    XCTAssert([[self.converter stringFromNumber:6] isEqualToString:@"шість"]);
    XCTAssert([[self.converter stringFromNumber:7] isEqualToString:@"сім"]);
    XCTAssert([[self.converter stringFromNumber:8] isEqualToString:@"вісім"]);
    XCTAssert([[self.converter stringFromNumber:9] isEqualToString:@"дев'ять"]);
    
}


- (void)testCardinalTeens {
    XCTAssert([[self.converter stringFromNumber:11] isEqualToString:@"одинадцять"]);
    XCTAssert([[self.converter stringFromNumber:12] isEqualToString:@"дванадцять"]);
    XCTAssert([[self.converter stringFromNumber:13] isEqualToString:@"тринадцять"]);
    XCTAssert([[self.converter stringFromNumber:14] isEqualToString:@"чотирнадцять"]);
    XCTAssert([[self.converter stringFromNumber:15] isEqualToString:@"п'ятнадцять"]);
    XCTAssert([[self.converter stringFromNumber:16] isEqualToString:@"шістнадцять"]);
    XCTAssert([[self.converter stringFromNumber:17] isEqualToString:@"сімнадцять"]);
    XCTAssert([[self.converter stringFromNumber:18] isEqualToString:@"вісімнадцять"]);
    XCTAssert([[self.converter stringFromNumber:19] isEqualToString:@"дев'ятнадцять"]);
    
}

- (void)testCardinalRoundTens {
    XCTAssert([[self.converter stringFromNumber:10] isEqualToString:@"десять"]);
    XCTAssert([[self.converter stringFromNumber:20] isEqualToString:@"двадцять"]);
    XCTAssert([[self.converter stringFromNumber:30] isEqualToString:@"тридцять"]);
    XCTAssert([[self.converter stringFromNumber:40] isEqualToString:@"сорок"]);
    XCTAssert([[self.converter stringFromNumber:50] isEqualToString:@"п'ятдесят"]);
    XCTAssert([[self.converter stringFromNumber:60] isEqualToString:@"шістдесят"]);
    XCTAssert([[self.converter stringFromNumber:70] isEqualToString:@"сімдесят"]);
    XCTAssert([[self.converter stringFromNumber:80] isEqualToString:@"вісімдесят"]);
    XCTAssert([[self.converter stringFromNumber:90] isEqualToString:@"дев'яносто"]);
    
}

- (void)testCardinalTens {
    XCTAssert([[self.converter stringFromNumber:21] isEqualToString:@"двадцять один"]);
    XCTAssert([[self.converter stringFromNumber:22] isEqualToString:@"двадцять два"]);
    XCTAssert([[self.converter stringFromNumber:23] isEqualToString:@"двадцять три"]);
    XCTAssert([[self.converter stringFromNumber:24] isEqualToString:@"двадцять чотири"]);
    XCTAssert([[self.converter stringFromNumber:25] isEqualToString:@"двадцять п'ять"]);
    XCTAssert([[self.converter stringFromNumber:26] isEqualToString:@"двадцять шість"]);
    XCTAssert([[self.converter stringFromNumber:27] isEqualToString:@"двадцять сім"]);
    XCTAssert([[self.converter stringFromNumber:28] isEqualToString:@"двадцять вісім"]);
    XCTAssert([[self.converter stringFromNumber:29] isEqualToString:@"двадцять дев'ять"]);
    XCTAssert([[self.converter stringFromNumber:31] isEqualToString:@"тридцять один"]);
}

- (void)testCardinalHundreds {
     NSLog(@"%@", [self.converter stringFromNumber:101]);
    XCTAssert([[self.converter stringFromNumber:100] isEqualToString:@"сто"]);
    XCTAssert([[self.converter stringFromNumber:101] isEqualToString:@"сто один"]);
    XCTAssert([[self.converter stringFromNumber:119] isEqualToString:@"сто дев'ятнадцять"]);
    XCTAssert([[self.converter stringFromNumber:176] isEqualToString:@"сто сімдесят шість"]);
    
    XCTAssert([[self.converter stringFromNumber:264] isEqualToString:@"двісті шістдесят чотири"]);
    XCTAssert([[self.converter stringFromNumber:312] isEqualToString:@"триста дванадцять"]);
    XCTAssert([[self.converter stringFromNumber:400] isEqualToString:@"чотириста"]);
    XCTAssert([[self.converter stringFromNumber:541] isEqualToString:@"п'ятсот сорок один"]);
    XCTAssert([[self.converter stringFromNumber:677] isEqualToString:@"шістсот сімдесят сім"]);
    XCTAssert([[self.converter stringFromNumber:753] isEqualToString:@"сімсот п'ятдесят три"]);
    XCTAssert([[self.converter stringFromNumber:857] isEqualToString:@"вісімсот п'ятдесят сім"]);
    XCTAssert([[self.converter stringFromNumber:999] isEqualToString:@"дев'ятсот дев'яносто дев'ять"]);
}

- (void)testCardinalThousands {
    XCTAssert([[self.converter stringFromNumber:1000] isEqualToString:@"одна тисяча"]);
    XCTAssert([[self.converter stringFromNumber:2000] isEqualToString:@"дві тисячі"]);
    XCTAssert([[self.converter stringFromNumber:2001] isEqualToString:@"дві тисячі один"]);
    XCTAssert([[self.converter stringFromNumber:3010] isEqualToString:@"три тисячі десять"]);
    XCTAssert([[self.converter stringFromNumber:4011] isEqualToString:@"чотири тисячі одинадцять"]);
    XCTAssert([[self.converter stringFromNumber:5201] isEqualToString:@"п'ять тисяч двісті один"]);
    XCTAssert([[self.converter stringFromNumber:6486] isEqualToString:@"шість тисяч чотириста вісімдесят шість"]);
    XCTAssert([[self.converter stringFromNumber:7575] isEqualToString:@"сім тисяч п'ятсот сімдесят п'ять"]);
    
    XCTAssert([[self.converter stringFromNumber:11000] isEqualToString:@"одинадцять тисяч"]);
    XCTAssert([[self.converter stringFromNumber:12000] isEqualToString:@"дванадцять тисяч"]);
    XCTAssert([[self.converter stringFromNumber:19000] isEqualToString:@"дев'ятнадцять тисяч"]);
    XCTAssert([[self.converter stringFromNumber:30000] isEqualToString:@"тридцять тисяч"]);
    XCTAssert([[self.converter stringFromNumber:31000] isEqualToString:@"тридцять одна тисяча"]);
    XCTAssert([[self.converter stringFromNumber:32000] isEqualToString:@"тридцять дві тисячі"]);
    XCTAssert([[self.converter stringFromNumber:36000] isEqualToString:@"тридцять шість тисяч"]);
    XCTAssert([[self.converter stringFromNumber:38000] isEqualToString:@"тридцять вісім тисяч"]);
   
    XCTAssert([[self.converter stringFromNumber:21011] isEqualToString:@"двадцять одна тисяча одинадцять"]);
    XCTAssert([[self.converter stringFromNumber:721011] isEqualToString:@"сімсот двадцять одна тисяча одинадцять"]);
    
}

- (void)testCardinalLargeNumbers {
    
    //  short scale
    self.converter.shortScale = YES;
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"один мільйон"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"один більйон"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"один трильйон"]);
  
    XCTAssert([[self.converter stringFromNumber:2*MILLION] isEqualToString:@"два мільйона"]);
    XCTAssert([[self.converter stringFromNumber:2*BILLION] isEqualToString:@"два більйона"]);
    XCTAssert([[self.converter stringFromNumber:2*TRILLION] isEqualToString:@"два трильйона"]);
    
    XCTAssert([[self.converter stringFromNumber:6*MILLION] isEqualToString:@"шість мільйонів"]);
    XCTAssert([[self.converter stringFromNumber:9*MILLION] isEqualToString:@"дев'ять мільйонів"]);
    XCTAssert([[self.converter stringFromNumber:19*MILLION] isEqualToString:@"дев'ятнадцять мільйонів"]);
    XCTAssert([[self.converter stringFromNumber:21*MILLION] isEqualToString:@"двадцять один мільйон"]);
    XCTAssert([[self.converter stringFromNumber:35*MILLION] isEqualToString:@"тридцять п'ять мільйонів"]);
    XCTAssert([[self.converter stringFromNumber:82*MILLION] isEqualToString:@"вісімдесят два мільйона"]);
    XCTAssert([[self.converter stringFromNumber:90*MILLION] isEqualToString:@"дев'яносто мільйонів"]);
    XCTAssert([[self.converter stringFromNumber:91*MILLION] isEqualToString:@"дев'яносто один мільйон"]);
    XCTAssert([[self.converter stringFromNumber:94*MILLION] isEqualToString:@"дев'яносто чотири мільйона"]);

    

    //  1,256,721
    XCTAssert([[self.converter stringFromNumber:1256721] isEqualToString:
               @"один мільйон двісті п'ятдесят шість тисяч сімсот двадцять один"]);
    //  31,256,722
    XCTAssert([[self.converter stringFromNumber:31256722] isEqualToString:
               @"тридцять один мільйон двісті п'ятдесят шість тисяч сімсот двадцять два"]);
    //  631,256,723
    XCTAssert([[self.converter stringFromNumber:631256723] isEqualToString:
               @"шістсот тридцять один мільйон двісті п'ятдесят шість тисяч сімсот двадцять три"]);
    //  1,492,638,524
    XCTAssert([[self.converter stringFromNumber:1492638524] isEqualToString:
               @"один більйон чотириста дев'яносто два мільйона шістсот тридцять вісім тисяч п'ятсот двадцять чотири"]);
    //  41,492,638,525
    XCTAssert([[self.converter stringFromNumber:41492638525] isEqualToString:
               @"сорок один більйон чотириста дев'яносто два мільйона шістсот тридцять вісім тисяч п'ятсот двадцять п'ять"]);
    //  941,492,638,526
    XCTAssert([[self.converter stringFromNumber:941492638526] isEqualToString:
               @"дев'ятсот сорок один більйон чотириста дев'яносто два мільйона шістсот тридцять вісім тисяч п'ятсот двадцять шість"]);

    //  long scale
    self.converter.shortScale = NO;
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"один мільйон"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"один мільярд"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"один більйон"]);
}

@end
