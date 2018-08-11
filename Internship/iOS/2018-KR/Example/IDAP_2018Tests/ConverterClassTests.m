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
#import "Numerals.h"
#import "NumeralsFormatter.h"
#import "UkrainianFormatter.h"

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:kUA ofType:@"plist"];
    
    Numerals *uaNumerals = [[Numerals alloc] initWithFile:path];
    UkrainianFormatter *formatter = [[UkrainianFormatter alloc] initWithNumerals:uaNumerals];
//    or you can do this faster
//    UkrainianFormatter *formatter = [[UkrainianFormatter alloc] initWithFile:path];
    
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
    XCTAssertEqual(defaultConverter.shortScale, YES);
    XCTAssertEqual(defaultConverter.availableLocaleID.count, 3);  //  en, de, ua

    //  switch locale
    //  try set wrong locale
    NSString *currentLocale = defaultConverter.localeID;
    XCTAssertNoThrow(defaultConverter.localeID = @"XXX");
    XCTAssertEqualObjects(defaultConverter.localeID, currentLocale);
    
    //  try set extended locale
    defaultConverter.localeID = @"en_GB";
    XCTAssertEqualObjects(defaultConverter.localeID, kEN);
    defaultConverter.localeID = @"en_AU";
    XCTAssertEqualObjects(defaultConverter.localeID, kEN);
    defaultConverter.localeID = @"en_US_POSIX";
    XCTAssertEqualObjects(defaultConverter.localeID, kEN);

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

- (void)testConvertWithLocale {
    Converter *defaultConverter = [Converter new];
    
    defaultConverter.localeID = kEN;
    NSString *enNumber = [defaultConverter stringFromNumber:2];
    NSLocale *enLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    XCTAssertEqualObjects([defaultConverter stringFromNumber:2 withLocale:enLocale], enNumber);
    
    defaultConverter.localeID = kDE;
    NSString *deNumber = [defaultConverter stringFromNumber:2];
    NSLocale *deLocale = [NSLocale localeWithLocaleIdentifier:@"de_DE"];
    XCTAssertEqualObjects([defaultConverter stringFromNumber:2 withLocale:deLocale], deNumber);
    
    defaultConverter.localeID = kUA;
    NSString *uaNumber = [defaultConverter stringFromNumber:2];
    NSLocale *uaLocale = [NSLocale localeWithLocaleIdentifier:@"uk_UA"];
    XCTAssertEqualObjects([defaultConverter stringFromNumber:2 withLocale:uaLocale], uaNumber);

    //  locale not available or nil
    NSLocale *frLocale = [NSLocale localeWithLocaleIdentifier:@"fr_FR"];
    XCTAssertNil([defaultConverter stringFromNumber:2 withLocale:frLocale]);
    XCTAssertNil([defaultConverter stringFromNumber:2 withLocale:nil]);

}

- (void)testPerformance {
    
#define TEST
    
#ifdef TEST
    CGFloat appleTime = 0;
    CGFloat converterTime = 0;
    
    NSInteger CYCLE_COUNT = 10*THOUSAND;
    uint32_t limit = 1000;
    
    Converter *defaultConverter = [Converter new];
    defaultConverter.localeID = kEN;
    defaultConverter.ordinal = NO;
    
    NSDate *start = [NSDate date];
    
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        long long number = arc4random_uniform(limit);
        NSLog(@"%@", [defaultConverter convertLongNumber:number]);
    }
    converterTime =  [start timeIntervalSinceNow];
    //    NSLog(@"** %f sec", [start timeIntervalSinceNow]);
    
    
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    [numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en"]];
    
    start = [NSDate date];
    
    for (NSInteger idx = 0; idx < CYCLE_COUNT; idx++) {
        NSNumber *number = [NSNumber numberWithLongLong: arc4random_uniform(limit)];
        NSLog(@"%@", [numberFormatter stringFromNumber:number]);
    }
    
    appleTime = [start timeIntervalSinceNow];
    //    NSLog(@"** %f sec", [start timeIntervalSinceNow]);
    
    NSInteger diff = (NSInteger) ((converterTime - appleTime) * (100 / appleTime));
    NSLog(@"*** RESULT:");
    NSLog(@"*** NSNumber = %f", appleTime);
    NSLog(@"*** Converter = %f, (%ld%%)",converterTime, diff);
#endif
    
   
}


@end
