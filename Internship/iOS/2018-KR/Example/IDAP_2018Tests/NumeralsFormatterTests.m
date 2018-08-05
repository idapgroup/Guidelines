//
//  NumeralsFormatter.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 04.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Numerals.h"
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
    //  base class, most methods should be overrided
    XCTAssertThrows([NumeralsFormatter formatter]);
    
    //  you can create, bat you can't use
    Numerals *uaNumerals = [Numerals ukrainian];
    NumeralsFormatter *formatter = [[NumeralsFormatter alloc] initWithNumerals:uaNumerals];
    
    XCTAssertThrows([formatter unitsFormatter:1 multiplier:1]);
    XCTAssertThrows([formatter teensFormatter:11 multiplier:1]);
    XCTAssertThrows([formatter roundTensFormatter:10 multiplier:1]);
    XCTAssertThrows([formatter hundredsFormatter:100 multiplier:1]);
    
    XCTAssertThrows([formatter largeNumbersFormatter:1000 quantity:1]);
    
    XCTAssertThrows([formatter ordinalFormatter:1 withString:@"one"]);
    XCTAssertThrows([formatter starterFormatter:1]);
    XCTAssertThrows([formatter finishingFormatter:1 withString:@"one"]);
}

@end
