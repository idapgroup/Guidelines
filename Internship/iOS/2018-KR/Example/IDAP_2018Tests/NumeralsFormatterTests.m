//
//  NumeralsFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 04.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NumeralsFormatter.h"

@interface NumeralsFormatterTests : XCTestCase

@end

@implementation NumeralsFormatterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    //  possible to create, impossible to use
    NumeralsFormatter *formatter = [[NumeralsFormatter alloc] init];
    
    XCTAssertThrows([formatter unitsFormatter:1 multiplier:1]);
//    XCTAssertThrows([formatter tensFormatter:22 multiplier:1]);
//    XCTAssertThrows([formatter hundredsFormatter:100 multiplier:1]);
//    
//    XCTAssertThrows([formatter largeNumbersFormatter:1000 quantity:1]);
//    
//    XCTAssertThrows([formatter ordinalFormatter:1 withParts:@[@"one"].mutableCopy]);
//    XCTAssertThrows([formatter finishingFormatter:1 withParts:@[@"one"].mutableCopy]);
}

@end
