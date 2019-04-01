#import <Foundation/Foundation.h>
#import "DoomsdayMachine.h"

@interface AnotherAssimilationInfo : NSObject<AssimilationInfo>

@property (nonatomic, assign) NSInteger years;
@property (nonatomic, assign) NSInteger months;
@property (nonatomic, assign) NSInteger weeks;
@property (nonatomic, assign) NSInteger days;
@property (nonatomic, assign) NSInteger hours;
@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;

+(instancetype)timeToAssimilationFrom:(NSString*)givenDate;

@end
