#import "AnotherAssimilationInfo.h"

@implementation AnotherAssimilationInfo

+(instancetype)timeToAssimilationFrom:(NSString*)givenDate {
    AnotherAssimilationInfo *info = [AnotherAssimilationInfo new];
    [givenDate retain];
    
    NSDateFormatter *form= [NSDateFormatter new];
    [form setDateFormat:@"yyyy:MM:dd'@'ss\\mm/HH"];
    NSDate* returnedDate = [form dateFromString:givenDate];
    [returnedDate description];
    [form release];
    
    NSString* assimilation = @"14 August 2208 03:13:37";
    NSDateFormatter *AnotherDateFormatter = [[NSDateFormatter alloc] init];
    [AnotherDateFormatter setDateFormat:@"dd MM yyyy HH:mm:ss"];
    NSDate *dateOfAssimilation = [AnotherDateFormatter dateFromString:assimilation];
    [assimilation release];
    [AnotherDateFormatter release];
    
    NSDateComponents* components = [[NSCalendar currentCalendar] components: NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:returnedDate toDate:dateOfAssimilation  options: 0];
    [returnedDate release];
    [dateOfAssimilation release];
    
    info.years = components.year;
    info.months = components.month;
    info.days = components.day;
    info.hours = components.hour;
    info.minutes = components.minute;
    info.seconds = components.second;
    
    return [info autorelease];
}



@end
