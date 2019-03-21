#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    [array retain];
    [super dealloc];
    NSInteger sum = 0;
    for (NSNumber *num in array) {
        sum += [num intValue];
    }
    NSNumber* s = [NSNumber numberWithInteger:sum];
    return s;
}

@end
