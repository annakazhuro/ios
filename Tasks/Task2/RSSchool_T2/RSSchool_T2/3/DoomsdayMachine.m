#import "DoomsdayMachine.h"
#import "AnotherAssimilationInfo.h"


@implementation DoomsdayMachine
// your code here
-(id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    [dateString retain];
    
    return [AnotherAssimilationInfo timeToAssimilationFrom:[dateString autorelease]];
    
}

- (NSString *)doomsdayString {
    NSString* settedDateOfAssimilation = @"14 August 2208 03:13:37";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MM yyyy HH:mm:ss"];
    NSDate *dateOfAssimilation = [dateFormatter dateFromString:settedDateOfAssimilation];
    [dateFormatter release];
    [settedDateOfAssimilation release];
    
    NSDateFormatter *humanDateFormatter = [[NSDateFormatter alloc] init];
    [humanDateFormatter setDateFormat:@"EEEE, MMMM dd, yyyy"];
    NSString* str = [humanDateFormatter stringFromDate:dateOfAssimilation];
    [humanDateFormatter release];
    [dateOfAssimilation release];
  
    return str;
}
@end
