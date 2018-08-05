//
//  ConverterClassTests.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 03.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Converter.h"
#import "NumeralsFormatter.h"
#import "UkrainianFormatter.h"
#import "EnglishFormatter.h"
#import "DeutschFormatter.h"

#import "GlobalKeys.h"

@interface ConverterClassTests : XCTestCase

@property (strong, nonatomic, readonly) Converter *converter;
@property (strong, nonatomic, readonly) Converter *uaConverter;
@end


@implementation ConverterClassTests

- (void)setUp {
    [super setUp];
    
    _converter = [Converter new];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:kUA ofType:@"plist"];
    UkrainianFormatter *formatter = [[UkrainianFormatter alloc] initWithFile:path];
    
    _uaConverter = [[Converter alloc] initWithFormatter:formatter];

}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    
    XCTAssertEqualObjects([self.converter stringFromNumber:55], @"fifty-five");
    XCTAssertEqualObjects([self.converter stringFromNumber:TRILLION], @"one trillion");

    self.self.converter.localeID = @"de";
    XCTAssertEqualObjects([self.converter stringFromNumber:11], @"elf");
    self.self.converter.localeID = @"uk";
    XCTAssertEqualObjects([self.converter stringFromNumber:33], @"тридцять три");
}

- (void)testInitWithFormatter {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:kUA ofType:@"plist"];
    UkrainianFormatter *formatter = [[UkrainianFormatter alloc] initWithFile:path];
    
    Converter *converter = [[Converter alloc] initWithFormatter:formatter];

    XCTAssertEqualObjects(converter.localeID, formatter.localeID);
    XCTAssertEqual(1, converter.availableLocaleID.count);
    XCTAssertEqualObjects([converter stringFromNumber:33], @"тридцять три");
    
    XCTAssertNoThrow([[Converter alloc] initWithFormatter:nil]);
    XCTAssertNil([[Converter alloc] initWithFormatter:nil]);
}

- (void)testAddAndRemoveFormatters {
    NSInteger count = self.uaConverter.availableLocaleID.count;
    
    //  succefull remove
    XCTAssertNoThrow([self.uaConverter removeFormatterWithLocale:kUA]);
    XCTAssertNotEqual(count, self.uaConverter.availableLocaleID.count);
    XCTAssertNil(self.uaConverter.localeID);
    
    //  succefull adding
    EnglishFormatter *enFormatter = [EnglishFormatter formatter];
    
    [self.uaConverter addFormatter:enFormatter];
    XCTAssertEqual(count, self.uaConverter.availableLocaleID.count);
    
    //  safe remove with wrong local
    XCTAssertNoThrow([self.uaConverter removeFormatterWithLocale:@"XXX"]);
    XCTAssertEqual(count, self.uaConverter.availableLocaleID.count);
    
    //  safe remove without any formater
    NSInteger iteration = self.uaConverter.availableLocaleID.count + 10;
    while (iteration > 0) {
        XCTAssertNoThrow([self.uaConverter removeFormatterWithLocale:kEN]);
        iteration--;
    }
    
    //  switch localeID if formatter for current locale was removed
    DeutschFormatter *deFormatter = [DeutschFormatter formatter];
    XCTAssertNil(self.uaConverter.localeID);
    [self.uaConverter addFormatter:enFormatter];
    XCTAssertEqualObjects(self.uaConverter.localeID, kEN);
    [self.uaConverter addFormatter:deFormatter];
    XCTAssertEqualObjects(self.uaConverter.localeID, kEN);
    [self.uaConverter removeFormatterWithLocale:kEN];
    XCTAssertEqualObjects(self.uaConverter.localeID, kDE);
    [self.uaConverter removeFormatterWithLocale:kDE];
    XCTAssertNil(self.uaConverter.localeID);
    
    
}
@end
