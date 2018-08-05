//
//  DeutschCardinalTests.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 01.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Converter.h"

#import "GlobalKeys.h"

@interface DeutschCardinalTests : XCTestCase

@property (strong, nonatomic) Converter *converter;

@end

@implementation DeutschCardinalTests

- (void)setUp {
    [super setUp];

    if (!_converter) {
        _converter = [[Converter alloc] init];
        _converter.localeID = kDE;
        _converter.ordinal = NO;
        
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCardinalUnits {
//    XCTAssert([[self.converter stringFromNumber:0] isEqualToString:@"null"]);
    XCTAssert([[self.converter stringFromNumber:1] isEqualToString:@"eins"]);
    XCTAssert([[self.converter stringFromNumber:2] isEqualToString:@"zwei"]);
    XCTAssert([[self.converter stringFromNumber:3] isEqualToString:@"drei"]);
    XCTAssert([[self.converter stringFromNumber:4] isEqualToString:@"vier"]);
    XCTAssert([[self.converter stringFromNumber:5] isEqualToString:@"fünf"]);
    XCTAssert([[self.converter stringFromNumber:6] isEqualToString:@"sechs"]);
    XCTAssert([[self.converter stringFromNumber:7] isEqualToString:@"sieben"]);
    XCTAssert([[self.converter stringFromNumber:8] isEqualToString:@"acht"]);
    XCTAssert([[self.converter stringFromNumber:9] isEqualToString:@"neun"]);

}

- (void)testCardinalTeens {
    XCTAssert([[self.converter stringFromNumber:11] isEqualToString:@"elf"]);
    XCTAssert([[self.converter stringFromNumber:12] isEqualToString:@"zwölf"]);
    XCTAssert([[self.converter stringFromNumber:13] isEqualToString:@"dreizehn"]);
    XCTAssert([[self.converter stringFromNumber:14] isEqualToString:@"vierzehn"]);
    XCTAssert([[self.converter stringFromNumber:15] isEqualToString:@"fünfzehn"]);
    XCTAssert([[self.converter stringFromNumber:16] isEqualToString:@"sechzehn"]);
    XCTAssert([[self.converter stringFromNumber:17] isEqualToString:@"siebzehn"]);
    XCTAssert([[self.converter stringFromNumber:18] isEqualToString:@"achtzehn"]);
    XCTAssert([[self.converter stringFromNumber:19] isEqualToString:@"neunzehn"]);
    
}

- (void)testCardinalRoundTens {
    XCTAssert([[self.converter stringFromNumber:10] isEqualToString:@"zehn"]);
    XCTAssert([[self.converter stringFromNumber:20] isEqualToString:@"zwanzig"]);
    XCTAssert([[self.converter stringFromNumber:30] isEqualToString:@"dreißig"]);
    XCTAssert([[self.converter stringFromNumber:40] isEqualToString:@"vierzig"]);
    XCTAssert([[self.converter stringFromNumber:50] isEqualToString:@"fünfzig"]);
    XCTAssert([[self.converter stringFromNumber:60] isEqualToString:@"sechzig"]);
    XCTAssert([[self.converter stringFromNumber:70] isEqualToString:@"siebzig"]);
    XCTAssert([[self.converter stringFromNumber:80] isEqualToString:@"achtzig"]);
    XCTAssert([[self.converter stringFromNumber:90] isEqualToString:@"neunzig"]);
    
}

- (void)testCardinalTens {
    XCTAssert([[self.converter stringFromNumber:21] isEqualToString:@"einundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:22] isEqualToString:@"zweiundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:23] isEqualToString:@"dreiundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:24] isEqualToString:@"vierundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:25] isEqualToString:@"fünfundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:26] isEqualToString:@"sechsundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:27] isEqualToString:@"siebenundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:28] isEqualToString:@"achtundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:29] isEqualToString:@"neunundzwanzig"]);
    XCTAssert([[self.converter stringFromNumber:31] isEqualToString:@"einunddreißig"]);
}

- (void)testCardinalHundreds {
    XCTAssert([[self.converter stringFromNumber:100] isEqualToString:@"einhundert"]);
    XCTAssert([[self.converter stringFromNumber:101] isEqualToString:@"einhunderteins"]);
    XCTAssert([[self.converter stringFromNumber:139] isEqualToString:@"einhundertneununddreißig"]);
    XCTAssert([[self.converter stringFromNumber:176] isEqualToString:@"einhundertsechsundsiebzig"]);
    XCTAssert([[self.converter stringFromNumber:200] isEqualToString:@"zweihundert"]);
    XCTAssert([[self.converter stringFromNumber:264] isEqualToString:@"zweihundertvierundsechzig"]);
    XCTAssert([[self.converter stringFromNumber:500] isEqualToString:@"fünfhundert"]);
    XCTAssert([[self.converter stringFromNumber:541] isEqualToString:@"fünfhunderteinundvierzig"]);
    XCTAssert([[self.converter stringFromNumber:857] isEqualToString:@"achthundertsiebenundfünfzig"]);
    XCTAssert([[self.converter stringFromNumber:999] isEqualToString:@"neunhundertneunundneunzig"]);
}

- (void)testCardinalThousands {
 
    XCTAssert([[self.converter stringFromNumber:1571] isEqualToString:@"eintausendfünfhunderteinundsiebzig"]);
//    XCTAssert([[self.converter stringFromNumber:3834] isEqualToString:@"dreitausendachthundertvierunddreißig"]);
    XCTAssert([[self.converter stringFromNumber:3834] isEqualToString:@"dreitausendachthundertvierunddreißig"]);
    XCTAssert([[self.converter stringFromNumber:4000] isEqualToString:@"viertausend"]);
    XCTAssert([[self.converter stringFromNumber:12853] isEqualToString:@"zwölftausendachthundertdreiundfünfzig"]);
    XCTAssert([[self.converter stringFromNumber:400000] isEqualToString:@"vierhunderttausend"]);
    XCTAssert([[self.converter stringFromNumber:532951]
               isEqualToString:@"fünfhundertzweiunddreißigtausendneunhunderteinundfünfzig"]);
    XCTAssert([[self.converter stringFromNumber:891724]
               isEqualToString:@"achthunderteinundneunzigtausendsiebenhundertvierundzwanzig"]);
    //    XCTAssert([[self.converter stringFromNumber:914] isEqualToString:@"einunddreißig"]);
}

- (void)testCardinalLargeNumbers {
    //  short scale
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"eine Million"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"eine Billion"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"eine Trillion"]);
//
//    

    XCTAssert([[self.converter stringFromNumber:2*MILLION] isEqualToString:@"zwei Millionen"]);
    XCTAssert([[self.converter stringFromNumber:2*BILLION] isEqualToString:@"zwei Billionen"]);

    

    

//    XCTAssert([[self.converter stringFromNumber:1204613] isEqualToString:@"eine Million zweihundertviertausendsechshundertdreizehn"]);
//    XCTAssert([[self.converter stringFromNumber:4000] isEqualToString:@"viertausend"]);
//    XCTAssert([[self.converter stringFromNumber:12853] isEqualToString:@"zwölftausendachthundertdreiundfünfzig"]);
//    XCTAssert([[self.converter stringFromNumber:400000] isEqualToString:@"vierhunderttausend"]);
//    XCTAssert([self.converter stringFromNumber:891724]
//               isEqualToString:@"achthunderteinundneunzigtausendsiebenhundertvierundzwanzig"]);
    //    XCTAssert([[self.converter stringFromNumber:914] isEqualToString:@"einunddreißig"]);
    
    
    //  long scale is more popular in Germany
    self.converter.shortScale = NO;
    XCTAssert([[self.converter stringFromNumber:MILLION] isEqualToString:@"eine Million"]);
    XCTAssert([[self.converter stringFromNumber:BILLION] isEqualToString:@"eine Milliarde"]);
    XCTAssert([[self.converter stringFromNumber:TRILLION] isEqualToString:@"eine Billion"]);
    XCTAssert([[self.converter stringFromNumber:1001001001000] isEqualToString:@"eine Billion eine Milliarde eine Million eintausend"]);

}

@end
