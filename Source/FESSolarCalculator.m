//
//  FESSolarCalculator.m
//  SolarCalculatorExample
//
//  Created by Dan Weeks on 2012-02-11.
//  Copyright © 2012 Daniel Weeks.
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the “Software”), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC.
#endif

#import "FESSolarCalculator.h"

@interface FESSolarCalculator ( )

@property (nonatomic, readwrite, strong) NSDate *sunrise;
@property (nonatomic, readwrite, strong) NSDate *sunset;
@property (nonatomic, readwrite, strong) NSDate *civilSunrise;
@property (nonatomic, readwrite, strong) NSDate *civilSunset;
@property (nonatomic, readwrite, strong) NSDate *nauticalSunrise;
@property (nonatomic, readwrite, strong) NSDate *nauticalSunset;
@property (nonatomic, readwrite, strong) NSDate *astronomicalSunrise;
@property (nonatomic, readwrite, strong) NSDate *astronomicalSunset;

- (void)invalidateResults;

@end

@implementation FESSolarCalculator

@synthesize operationsMask=_operationsMask;
@synthesize startDate=_startDate;
@synthesize location=_location;
@synthesize sunrise=_sunrise;
@synthesize sunset=_sunset;
@synthesize civilSunrise=_civilSunrise;
@synthesize civilSunset=_civilSunset;
@synthesize nauticalSunrise=_nauticalSunrise;
@synthesize nauticalSunset=_nauticalSunset;
@synthesize astronomicalSunrise=_astronomicalSunrise;
@synthesize astronomicalSunset=_astronomicalSunset;

#pragma mark -
#pragma mark Initializers


- (id)init
{
    self = [super init];
    if (self) {
        // set our default operations mask
        _operationsMask = FESSolarCalculationAll;
        [self invalidateResults];
    }
    return self;
}

- (id)initWithDate:(NSDate *)inDate andLocation:(CLLocation *)inLocation
{
    self = [self init];
    if (self) {
        [self setStartDate:inDate];
        [self setLocation:inLocation];
    }
    return self;
}

#pragma mark -
#pragma mark Property Ops

- (void)setStartDate:(NSDate *)inDate
{
    // override the default setter for startDate so that we can invalidate previous results
    [self invalidateResults];
    _startDate = inDate;
}

- (void)setLocation:(CLLocation *)inLocation
{
    // override the default setter for location so that we can invalidate previous results
    [self invalidateResults];
    _location = inLocation;
}

- (void)invalidateResults
{
    // when users set new inputs the output values need to be invalidated
    _sunrise = nil;
    _sunset = nil;
    _civilSunrise = nil;
    _civilSunset = nil;
    _nauticalSunrise = nil;
    _nauticalSunset = nil;
    _astronomicalSunrise = nil;
    _astronomicalSunset = nil;
}

#pragma mark -
#pragma mark User Facing Methods

- (void)calculate
{
    // run the calculations based on the users criteria
}

#pragma mark -
#pragma mark Calculation Ops

@end
