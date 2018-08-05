//
//  DeutschOrdinalTests.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 01.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Converter.h"

#import "GlobalKeys.h"

@interface DeutschOrdinalTests : XCTestCase

@property (strong, nonatomic) Converter *converter;

@end

@implementation DeutschOrdinalTests

- (void)setUp {
    [super setUp];

    if (!_converter) {
        _converter = [[Converter alloc] init];
        _converter.localeID = kDE;
        _converter.ordinal = YES;
        
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOrdinalUnits {
    //    XCTAssert([[self.converter stringFromNumber:0] isEqualToString:@"null"]);
    XCTAssert([[self.converter stringFromNumber:1] isEqualToString:@"erste"]);
    XCTAssert([[self.converter stringFromNumber:2] isEqualToString:@"zweite"]);
    XCTAssert([[self.converter stringFromNumber:3] isEqualToString:@"dritte"]);
    XCTAssert([[self.converter stringFromNumber:4] isEqualToString:@"vierte"]);
    XCTAssert([[self.converter stringFromNumber:5] isEqualToString:@"fünfte"]);
    XCTAssert([[self.converter stringFromNumber:6] isEqualToString:@"sechste"]);
    XCTAssert([[self.converter stringFromNumber:7] isEqualToString:@"siebte"]);
    XCTAssert([[self.converter stringFromNumber:8] isEqualToString:@"achte"]);
    XCTAssert([[self.converter stringFromNumber:9] isEqualToString:@"neunte"]);
    
}

- (void)testOrdinalTeens {
    XCTAssert([[self.converter stringFromNumber:11] isEqualToString:@"elfte"]);
    XCTAssert([[self.converter stringFromNumber:12] isEqualToString:@"zwölfte"]);
    XCTAssert([[self.converter stringFromNumber:13] isEqualToString:@"dreizehnte"]);
    XCTAssert([[self.converter stringFromNumber:14] isEqualToString:@"vierzehnte"]);
    XCTAssert([[self.converter stringFromNumber:15] isEqualToString:@"fünfzehnte"]);
    XCTAssert([[self.converter stringFromNumber:16] isEqualToString:@"sechzehnte"]);
    XCTAssert([[self.converter stringFromNumber:17] isEqualToString:@"siebzehnte"]);
    XCTAssert([[self.converter stringFromNumber:18] isEqualToString:@"achtzehnte"]);
    XCTAssert([[self.converter stringFromNumber:19] isEqualToString:@"neunzehnte"]);
    
}

- (void)testOrdinalRoundTens {
    XCTAssert([[self.converter stringFromNumber:10] isEqualToString:@"zehnte"]);
    XCTAssert([[self.converter stringFromNumber:20] isEqualToString:@"zwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:30] isEqualToString:@"dreißigste"]);
    XCTAssert([[self.converter stringFromNumber:40] isEqualToString:@"vierzigste"]);
    XCTAssert([[self.converter stringFromNumber:50] isEqualToString:@"fünfzigste"]);
    XCTAssert([[self.converter stringFromNumber:60] isEqualToString:@"sechzigste"]);
    XCTAssert([[self.converter stringFromNumber:70] isEqualToString:@"siebzigste"]);
    XCTAssert([[self.converter stringFromNumber:80] isEqualToString:@"achtzigste"]);
    XCTAssert([[self.converter stringFromNumber:90] isEqualToString:@"neunzigste"]);
    
}

- (void)testOrdinalTens {
    XCTAssert([[self.converter stringFromNumber:21] isEqualToString:@"einundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:22] isEqualToString:@"zweiundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:23] isEqualToString:@"dreiundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:24] isEqualToString:@"vierundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:25] isEqualToString:@"fünfundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:26] isEqualToString:@"sechsundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:27] isEqualToString:@"siebenundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:28] isEqualToString:@"achtundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:29] isEqualToString:@"neunundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:31] isEqualToString:@"einunddreißigste"]);
}

- (void)testOrdinalHundreds {
    XCTAssert([[self.converter stringFromNumber:100] isEqualToString:@"einhundertste"]);
    XCTAssert([[self.converter stringFromNumber:101] isEqualToString:@"einhunderterste"]);
    XCTAssert([[self.converter stringFromNumber:102] isEqualToString:@"einhundertzweite"]);
    XCTAssert([[self.converter stringFromNumber:120] isEqualToString:@"einhundertzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:122] isEqualToString:@"einhundertzweiundzwanzigste"]);

    XCTAssert([[self.converter stringFromNumber:139] isEqualToString:@"einhundertneununddreißigste"]);
    XCTAssert([[self.converter stringFromNumber:176] isEqualToString:@"einhundertsechsundsiebzigste"]);
    XCTAssert([[self.converter stringFromNumber:200] isEqualToString:@"zweihundertste"]);
    XCTAssert([[self.converter stringFromNumber:264] isEqualToString:@"zweihundertvierundsechzigste"]);
    XCTAssert([[self.converter stringFromNumber:500] isEqualToString:@"fünfhundertste"]);
    XCTAssert([[self.converter stringFromNumber:541] isEqualToString:@"fünfhunderteinundvierzigste"]);
    XCTAssert([[self.converter stringFromNumber:857] isEqualToString:@"achthundertsiebenundfünfzigste"]);
    XCTAssert([[self.converter stringFromNumber:999] isEqualToString:@"neunhundertneunundneunzigste"]);
}

- (void)testOrdinalThousands {
  
    XCTAssert([[self.converter stringFromNumber:1000] isEqualToString:@"eintausendste"]);
    XCTAssert([[self.converter stringFromNumber:1001] isEqualToString:@"eintausenderste"]);
    XCTAssert([[self.converter stringFromNumber:1002] isEqualToString:@"eintausendzweite"]);
    XCTAssert([[self.converter stringFromNumber:1050] isEqualToString:@"eintausendfünfzigste"]);
    XCTAssert([[self.converter stringFromNumber:1100] isEqualToString:@"eintausendeinhundertste"]);
    XCTAssert([[self.converter stringFromNumber:1200] isEqualToString:@"eintausendzweihundertste"]);
    XCTAssert([[self.converter stringFromNumber:1250] isEqualToString:@"eintausendzweihundertfünfzigste"]);
    XCTAssert([[self.converter stringFromNumber:1251] isEqualToString:@"eintausendzweihunderteinundfünfzigste"]);
    XCTAssert([[self.converter stringFromNumber:3021] isEqualToString:@"dreitausendeinundzwanzigste"]);

    XCTAssert([[self.converter stringFromNumber:10000] isEqualToString:@"zehntausendste"]);
    XCTAssert([[self.converter stringFromNumber:100000] isEqualToString:@"einhunderttausendste"]);

}

- (void)testOrdinalLargeNumbers {
    //  short scale
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"eine Millionste"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"eine Billionste"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"eine Trillionste"]);
    
    XCTAssert([[self.converter stringFromNumber:50*MILLION] isEqualToString:@"fünfzig Millionste"]);
    XCTAssert([[self.converter stringFromNumber:2*BILLION] isEqualToString:@"zwei Billionste"]);
    
    
    XCTAssert([[self.converter stringFromNumber:1204613] isEqualToString:@"eine Million zweihundertviertausendsechshundertdreizehnte"]);
    XCTAssert([[self.converter stringFromNumber:4000] isEqualToString:@"viertausendste"]);
    XCTAssert([[self.converter stringFromNumber:12853] isEqualToString:@"zwölftausendachthundertdreiundfünfzigste"]);
    XCTAssert([[self.converter stringFromNumber:400000] isEqualToString:@"vierhunderttausendste"]);
    XCTAssert([[self.converter stringFromNumber:891724]
               isEqualToString:@"achthunderteinundneunzigtausendsiebenhundertvierundzwanzigste"]);
    XCTAssert([[self.converter stringFromNumber:914] isEqualToString:@"neunhundertvierzehnte"]);
    
    
    //  long scale is more popular in Germany
    self.converter.shortScale = NO;
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"eine Millionste"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"eine Milliardste"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"eine Billionste"]);
    XCTAssert([[self.converter stringFromNumber:1001001001000] isEqualToString:@"eine Billion eine Milliarde eine Million eintausendste"]);
    
}


@end
