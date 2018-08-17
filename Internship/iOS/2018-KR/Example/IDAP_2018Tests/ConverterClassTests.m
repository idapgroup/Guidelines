//
//  ConverterClassTests.m
//  IDAP_2018
//
//  Created by Yevhen Triukhan on 03.08.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Converter.h"
#import "DeutschFormatter.h"
#import "EnglishFormatter.h"
#import "NumeralsFormatter.h"
#import "UkrainianFormatter.h"

#import "GlobalKeys.h"

@interface ConverterClassTests : XCTestCase

@end


@implementation ConverterClassTests

- (void)setUp {

}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    
    [super tearDown];
}

- (void)testInit {
    Converter *defaultConverter = [Converter new];
    defaultConverter.ordinal = NO;
    
    XCTAssertEqualObjects([defaultConverter stringFromNumber:55], @"fifty-five");
    XCTAssertEqualObjects([defaultConverter stringFromNumber:TRILLION], @"one trillion");

    defaultConverter.localeID = kDE;
    XCTAssertEqualObjects([defaultConverter stringFromNumber:11], @"elf");
    defaultConverter.localeID = kUA;
    XCTAssertEqualObjects([defaultConverter stringFromNumber:33], @"тридцять три");
}

- (void)testInitWithFormatter {
    UkrainianFormatter *formatter = [UkrainianFormatter formatter];
    
    Converter *converter = [[Converter alloc] initWithFormatter:formatter];
    converter.ordinal = NO;
    
    XCTAssertEqualObjects(converter.localeID, formatter.localeID);
    XCTAssertEqual(1, converter.availableLocaleID.count);
    XCTAssertEqualObjects([converter stringFromNumber:33], @"тридцять три");
    
    XCTAssertNoThrow([[Converter alloc] initWithFormatter:nil]);
    XCTAssertNil([[Converter alloc] initWithFormatter:nil]);
}

- (void)testProperties {
    //  localeID, shortScale, availableLocaleID is @dynamic
    Converter * defaultConverter = [Converter new];
    
    //  check default values
    XCTAssertEqualObjects(defaultConverter.localeID, kEN);
    XCTAssertEqual(defaultConverter.ordinal, YES);
    XCTAssertEqual(defaultConverter.availableLocaleID.count, 3);  //  en, de, ua

    //  switch locale
    //  try set wrong (unavailable) locale
    //  must stay previous locale
    NSString *currentLocale = defaultConverter.localeID;
    XCTAssertNoThrow(defaultConverter.localeID = @"XXX");
    XCTAssertEqualObjects(defaultConverter.localeID, currentLocale);
    
    //  try set extended locale
    //  must recognize language designator, ignore country designator
    defaultConverter.localeID = @"en_GB";
    XCTAssertEqualObjects(defaultConverter.localeID, kEN);
    defaultConverter.localeID = @"en_AU";
    XCTAssertEqualObjects(defaultConverter.localeID, kEN);
    defaultConverter.localeID = @"en_US_POSIX";
    XCTAssertEqualObjects(defaultConverter.localeID, kEN);

}

- (void)testAddAndRemoveFormatters {
    //  old tests
    //  in new version there is no way add/remove Formatters
    
    Converter *testConverter = [[Converter alloc] initWithFormatter:[UkrainianFormatter formatter]];
    
    //  count = 1
    NSInteger count = testConverter.availableLocaleID.count;
    
    //  succefull remove
    XCTAssertNoThrow([testConverter removeFormatterWithLocale:kUA]);
    XCTAssertNotEqual(count, testConverter.availableLocaleID.count);
    XCTAssertNil(testConverter.localeID);
    XCTAssertNil([testConverter stringFromNumber:1]);
    
    //  succefull adding
    EnglishFormatter *enFormatter = [EnglishFormatter formatter];
    
    [testConverter addFormatter:enFormatter];
    XCTAssertEqual(count, testConverter.availableLocaleID.count);
    XCTAssertEqualObjects(testConverter.localeID, kEN);
    XCTAssertEqualObjects([testConverter stringFromNumber:1], @"first");

    //  safe remove with wrong local
    XCTAssertNoThrow([testConverter removeFormatterWithLocale:@"XXX"]);
    XCTAssertEqual(count, testConverter.availableLocaleID.count);
    XCTAssertEqualObjects([testConverter stringFromNumber:1], @"first");

    //  safe remove without any formater
    NSInteger iteration = testConverter.availableLocaleID.count + 10;
    while (iteration > 0) {
        XCTAssertNoThrow([testConverter removeFormatterWithLocale:kEN]);
        iteration--;
    }
    XCTAssertNil([testConverter stringFromNumber:1]);

    //  switch localeID if formatter for current locale was removed
    //  without any formatters localeID return nil
    XCTAssertNil(testConverter.localeID);
    
    //  after adding first formatter, localeID automatically switch LocaleID...
    [testConverter addFormatter:enFormatter];
    XCTAssertEqualObjects(testConverter.localeID, kEN);
    
    //  ...and remain LocaleID when add another formatters
    DeutschFormatter *deFormatter = [DeutschFormatter formatter];
    [testConverter addFormatter:deFormatter];
    XCTAssertEqualObjects(testConverter.localeID, kEN);
    
    UkrainianFormatter *uaFormatter = [UkrainianFormatter formatter];
    [testConverter addFormatter:uaFormatter];
    XCTAssertEqualObjects(testConverter.localeID, kEN);
    
    //  when removing formatter which is "current formatter"
    //  localeID switch to first available
    //  or niled if it was last formatter
    [testConverter removeFormatterWithLocale:kEN];
    XCTAssertEqualObjects(testConverter.localeID, kDE);
    
    [testConverter removeFormatterWithLocale:kDE];
    XCTAssertEqualObjects(testConverter.localeID, kUA);
    
    [testConverter removeFormatterWithLocale:kUA];
    XCTAssertNil(testConverter.localeID);
}

//- (void)testConvertWithLocale {
//    Converter *defaultConverter = [Converter new];
//    
//    defaultConverter.localeID = kEN;
//    NSString *enNumber = [defaultConverter stringFromNumber:2];
//    NSLocale *enLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
//    XCTAssertEqualObjects([defaultConverter stringFromNumber:2 withLocale:enLocale], enNumber);
//    
//    defaultConverter.localeID = kDE;
//    NSString *deNumber = [defaultConverter stringFromNumber:2];
//    NSLocale *deLocale = [NSLocale localeWithLocaleIdentifier:@"de_DE"];
//    XCTAssertEqualObjects([defaultConverter stringFromNumber:2 withLocale:deLocale], deNumber);
//    
//    defaultConverter.localeID = kUA;
//    NSString *uaNumber = [defaultConverter stringFromNumber:2];
//    NSLocale *uaLocale = [NSLocale localeWithLocaleIdentifier:@"uk_UA"];
//    XCTAssertEqualObjects([defaultConverter stringFromNumber:2 withLocale:uaLocale], uaNumber);
//
//    //  locale not available or nil
//    NSLocale *frLocale = [NSLocale localeWithLocaleIdentifier:@"fr_FR"];
//    XCTAssertNil([defaultConverter stringFromNumber:2 withLocale:frLocale]);
//    XCTAssertNil([defaultConverter stringFromNumber:2 withLocale:nil]);
//
//}

- (void)testPerformance {
    
#define TEST_
    
#ifdef TEST
    CGFloat appleTime = 0;
    CGFloat converterTime = 0;
    
    NSInteger CYCLE_COUNT = 10*THOUSAND;
    uint32_t limit = INT32_MAX;
    
    //  массив генерируется, что бы проверять конверторы на одном наборе чисел
    NSInteger c_arr[CYCLE_COUNT];
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        c_arr[idx] = arc4random_uniform(limit);// + 1000000;
    }
    
    
    Converter *defaultConverter = [Converter new];
    defaultConverter.localeID = kEN;
    defaultConverter.ordinal = NO;
    
    NSDate *start = [NSDate date];
    
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        NSLog(@"%@", [defaultConverter stringFromNumber:c_arr[idx]]);
    }
    converterTime =  [start timeIntervalSinceNow];
    
    //    NSLog(@"** %f sec", [start timeIntervalSinceNow]);
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    [numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en"]];
    
    start = [NSDate date];
    
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        NSLog(@"%@", [numberFormatter stringFromNumber:@(c_arr[idx])]);
    }
    
    appleTime = [start timeIntervalSinceNow];
    
    converterTime = converterTime / CYCLE_COUNT;
    appleTime = appleTime / CYCLE_COUNT;
    
    long diff = (NSInteger) ((converterTime - appleTime) * (100 / appleTime));
    NSLog(@"*** ENGLISHT RESULT:");
    NSLog(@"*** NSNumberFormatter = %f", appleTime);
    NSLog(@"*** Converter = %f, (%ld%%)",converterTime, diff);
    
/*** deutsch tests ***/
    
    defaultConverter.localeID = kDE;
    defaultConverter.ordinal = NO;
    
    start = [NSDate date];
    
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        NSLog(@"%@", [defaultConverter stringFromNumber:c_arr[idx]]);
    }
    converterTime =  [start timeIntervalSinceNow];
    
    
    
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    [numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"de"]];
    
    start = [NSDate date];
    
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        NSLog(@"%@", [numberFormatter stringFromNumber:@(c_arr[idx])]);
    }
    
    appleTime = [start timeIntervalSinceNow];
    
    diff = (NSInteger) ((converterTime - appleTime) * (100 / appleTime));
    NSLog(@"*** DEUTSCH RESULT:");
    NSLog(@"*** NSNumberFormatter = %f", appleTime);
    NSLog(@"*** Converter = %f, (%ld%%)",converterTime, diff);

    /*** ukrainian tests ***/
    
    defaultConverter.localeID = kUA;
    defaultConverter.ordinal = NO;
    
    start = [NSDate date];
    
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        NSLog(@"%@", [defaultConverter stringFromNumber:c_arr[idx]]);
    }
    converterTime =  [start timeIntervalSinceNow];
    
    
    
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    [numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"de"]];
    
    start = [NSDate date];
    
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        NSLog(@"%@", [numberFormatter stringFromNumber:@(c_arr[idx])]);
    }
    
    appleTime = [start timeIntervalSinceNow];
    //    NSLog(@"** %f sec", [start timeIntervalSinceNow]);
    
    diff = (NSInteger) ((converterTime - appleTime) * (100 / appleTime));
    NSLog(@"*** UKRAINIAN RESULT:");
    NSLog(@"*** NSNumberFormatter = %f", appleTime);
    NSLog(@"*** Converter = %f, (%ld%%)",converterTime, diff);
    

#endif
    
   
}


@end
