#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    [array retain];
    
    int sumOfElementsInArray = 0;
    for (NSNumber *elementInArray in array) {
        sumOfElementsInArray += [elementInArray intValue];
    }
    NSNumber* resultOfSumOfArray = [[NSNumber numberWithInt:sumOfElementsInArray] autorelease];
    [resultOfSumOfArray autorelease];
    
    return resultOfSumOfArray;
}

@end
