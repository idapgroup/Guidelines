//
//  UkrainianOrdinalTests.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 02.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Converter.h"
#import "GlobalKeys.h"

@interface UkrainianOrdinalTests : XCTestCase

@property (strong, nonatomic) Converter *converter;

@end

@implementation UkrainianOrdinalTests

- (void)setUp {
    [super setUp];
    
    
    
    if (!_converter) {
        _converter = [[Converter alloc] init];
        _converter.localeID = kUA;
        _converter.shortScale = YES;
        _converter.ordinal = YES;
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOrdinalUnits {
    //    XCTAssert([[self.converter stringFromNumber:0] isEqualToString:@"нуль"]);
    XCTAssert([[self.converter stringFromNumber:1] isEqualToString:@"перший"]);
    XCTAssert([[self.converter stringFromNumber:2] isEqualToString:@"другий"]);
    XCTAssert([[self.converter stringFromNumber:3] isEqualToString:@"третій"]);
    XCTAssert([[self.converter stringFromNumber:4] isEqualToString:@"четвертий"]);
    XCTAssert([[self.converter stringFromNumber:5] isEqualToString:@"п'ятий"]);
    XCTAssert([[self.converter stringFromNumber:6] isEqualToString:@"шостий"]);
    XCTAssert([[self.converter stringFromNumber:7] isEqualToString:@"сьомий"]);
    XCTAssert([[self.converter stringFromNumber:8] isEqualToString:@"восьмий"]);
    XCTAssert([[self.converter stringFromNumber:9] isEqualToString:@"дев'ятий"]);
    
}


- (void)testOrdinalTeens {
    XCTAssert([[self.converter stringFromNumber:11] isEqualToString:@"одинадцятий"]);
    XCTAssert([[self.converter stringFromNumber:12] isEqualToString:@"дванадцятий"]);
    XCTAssert([[self.converter stringFromNumber:13] isEqualToString:@"тринадцятий"]);
    XCTAssert([[self.converter stringFromNumber:14] isEqualToString:@"чотирнадцятий"]);
    XCTAssert([[self.converter stringFromNumber:15] isEqualToString:@"п'ятнадцятий"]);
    XCTAssert([[self.converter stringFromNumber:16] isEqualToString:@"шістнадцятий"]);
    XCTAssert([[self.converter stringFromNumber:17] isEqualToString:@"сімнадцятий"]);
    XCTAssert([[self.converter stringFromNumber:18] isEqualToString:@"вісімнадцятий"]);
    XCTAssert([[self.converter stringFromNumber:19] isEqualToString:@"дев'ятнадцятий"]);
    
}

- (void)testOrdinalRoundTens {
    XCTAssert([[self.converter stringFromNumber:10] isEqualToString:@"десятий"]);
    XCTAssert([[self.converter stringFromNumber:20] isEqualToString:@"двадцятий"]);
    XCTAssert([[self.converter stringFromNumber:30] isEqualToString:@"тридцятий"]);
    XCTAssert([[self.converter stringFromNumber:40] isEqualToString:@"сороковий"]);
    XCTAssert([[self.converter stringFromNumber:50] isEqualToString:@"п'ятдесятий"]);
    XCTAssert([[self.converter stringFromNumber:60] isEqualToString:@"шістдесятий"]);
    XCTAssert([[self.converter stringFromNumber:70] isEqualToString:@"сімдесятий"]);
    XCTAssert([[self.converter stringFromNumber:80] isEqualToString:@"вісімдесятий"]);
    XCTAssert([[self.converter stringFromNumber:90] isEqualToString:@"дев'яностий"]);
    
}

- (void)testOrdinalTens {
    XCTAssert([[self.converter stringFromNumber:21] isEqualToString:@"двадцять перший"]);
    XCTAssert([[self.converter stringFromNumber:22] isEqualToString:@"двадцять другий"]);
    XCTAssert([[self.converter stringFromNumber:23] isEqualToString:@"двадцять третій"]);
    XCTAssert([[self.converter stringFromNumber:24] isEqualToString:@"двадцять четвертий"]);
    XCTAssert([[self.converter stringFromNumber:25] isEqualToString:@"двадцять п'ятий"]);
    XCTAssert([[self.converter stringFromNumber:26] isEqualToString:@"двадцять шостий"]);
    XCTAssert([[self.converter stringFromNumber:27] isEqualToString:@"двадцять сьомий"]);
    XCTAssert([[self.converter stringFromNumber:28] isEqualToString:@"двадцять восьмий"]);
    XCTAssert([[self.converter stringFromNumber:29] isEqualToString:@"двадцять дев'ятий"]);
    XCTAssert([[self.converter stringFromNumber:31] isEqualToString:@"тридцять перший"]);
}

- (void)testOrdinalHundreds {
    XCTAssert([[self.converter stringFromNumber:100] isEqualToString:@"сотий"]);
    XCTAssert([[self.converter stringFromNumber:101] isEqualToString:@"сто перший"]);
    XCTAssert([[self.converter stringFromNumber:119] isEqualToString:@"сто дев'ятнадцятий"]);
    XCTAssert([[self.converter stringFromNumber:176] isEqualToString:@"сто сімдесят шостий"]);
    
    XCTAssert([[self.converter stringFromNumber:264] isEqualToString:@"двісті шістдесят четвертий"]);
    XCTAssert([[self.converter stringFromNumber:312] isEqualToString:@"триста дванадцятий"]);
    XCTAssert([[self.converter stringFromNumber:400] isEqualToString:@"чотирьохсотий"]);
    XCTAssert([[self.converter stringFromNumber:541] isEqualToString:@"п'ятсот сорок перший"]);
    XCTAssert([[self.converter stringFromNumber:677] isEqualToString:@"шістсот сімдесят сьомий"]);
    XCTAssert([[self.converter stringFromNumber:753] isEqualToString:@"сімсот п'ятдесят третій"]);
    XCTAssert([[self.converter stringFromNumber:857] isEqualToString:@"вісімсот п'ятдесят сьомий"]);
    XCTAssert([[self.converter stringFromNumber:999] isEqualToString:@"дев'ятсот дев'яносто дев'ятий"]);
}

- (void)testOrdinalThousands {
    XCTAssert([[self.converter stringFromNumber:1000] isEqualToString:@"тисячний"]);
    XCTAssert([[self.converter stringFromNumber:2000] isEqualToString:@"двохтисячний"]);
    XCTAssert([[self.converter stringFromNumber:3000] isEqualToString:@"трьохтисячний"]);
    XCTAssert([[self.converter stringFromNumber:4000] isEqualToString:@"чотирьохтисячний"]);
    XCTAssert([[self.converter stringFromNumber:5000] isEqualToString:@"п'ятитисячний"]);
    XCTAssert([[self.converter stringFromNumber:6000] isEqualToString:@"шеститисячний"]);
    XCTAssert([[self.converter stringFromNumber:7000] isEqualToString:@"семитисячний"]);
    
    XCTAssert([[self.converter stringFromNumber:12000] isEqualToString:@"дванадцятитисячний"]);
    XCTAssert([[self.converter stringFromNumber:35000] isEqualToString:@"тридцятип'ятитисячний"]);
    XCTAssert([[self.converter stringFromNumber:100000] isEqualToString:@"стотисячний"]);
    
    XCTAssert([[self.converter stringFromNumber:5201] isEqualToString:@"п'ять тисяч двісті перший"]);
    XCTAssert([[self.converter stringFromNumber:6486] isEqualToString:@"шість тисяч чотириста вісімдесят шостий"]);
    XCTAssert([[self.converter stringFromNumber:7575] isEqualToString:@"сім тисяч п'ятсот сімдесят п'ятий"]);
    
    XCTAssert([[self.converter stringFromNumber:21011] isEqualToString:@"двадцять одна тисяча одинадцятий"]);
    XCTAssert([[self.converter stringFromNumber:721011] isEqualToString:@"сімсот двадцять одна тисяча одинадцятий"]);
    
}

- (void)testOrdinalLargeNumbers {
    
    //  short scale
    self.converter.shortScale = YES;
     NSLog(@"%@", [self.converter stringFromNumber:MILLION]);
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"мільйонний"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"більйонний"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"трильйонний"]);
    
    XCTAssert([[self.converter stringFromNumber:2*MILLION] isEqualToString:@"двохмільйонний"]);
    XCTAssert([[self.converter stringFromNumber:2*BILLION] isEqualToString:@"двохбільйонний"]);
    XCTAssert([[self.converter stringFromNumber:2*TRILLION] isEqualToString:@"двохтрильйонний"]);
    
    XCTAssert([[self.converter stringFromNumber:2*MILLION] isEqualToString:@"двохмільйонний"]);
    XCTAssert([[self.converter stringFromNumber:4*MILLION] isEqualToString:@"чотирьохмільйонний"]);
    XCTAssert([[self.converter stringFromNumber:9*MILLION] isEqualToString:@"дев'ятимільйонний"]);
    XCTAssert([[self.converter stringFromNumber:11*MILLION] isEqualToString:@"одинадцятимільйонний"]);
    XCTAssert([[self.converter stringFromNumber:19*MILLION] isEqualToString:@"дев'ятнадцятимільйонний"]);

    XCTAssert([[self.converter stringFromNumber:22*MILLION] isEqualToString:@"двадцятидвохмільйонний"]);
    XCTAssert([[self.converter stringFromNumber:34*MILLION] isEqualToString:@"тридцятичотирьохмільйонний"]);
    XCTAssert([[self.converter stringFromNumber:59*MILLION] isEqualToString:@"п'ятдесятидев'ятимільйонний"]);
    XCTAssert([[self.converter stringFromNumber:124*MILLION] isEqualToString:@"стодвадцятичотирьохмільйонний"]);
    XCTAssert([[self.converter stringFromNumber:999*MILLION] isEqualToString:@"дев'ятсотдев'яностадев'ятимільйонний"]);

    //  long scale
    self.converter.shortScale = NO;
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"мільйонний"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"мільярдний"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"більйонний"]);
}

@end
