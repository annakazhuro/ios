#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    [string retain];
    
    NSArray* arr = [string componentsSeparatedByString:@" "];
    NSMutableArray *mutableArr = [[NSMutableArray alloc] initWithArray:arr];
    NSInteger firstObject;
    NSInteger secondObject;
    int indexOfFirstElement = 0;
    int indexOfFSecondElement = 0;
    BOOL reverseFlag = YES;
    BOOL swapFlag = NO;
    int numberOfIteration=0;
    NSString* Details = [NSString new];
    NSString* someElem = [NSString new];
    
    //sorted array
    for (int i = 0; i < mutableArr.count-1; i++) {
        for (int j = ((int)[mutableArr count] - 1); j > i; j--){
            firstObject = [[mutableArr objectAtIndex:i] integerValue];
            secondObject = [[mutableArr objectAtIndex:j] integerValue];
            if (secondObject < firstObject) {
                someElem = [mutableArr objectAtIndex:i];
                mutableArr[i] = [mutableArr objectAtIndex:j];
                mutableArr[j] = someElem;
                if (numberOfIteration == 0) {
                    indexOfFirstElement = i;
                    indexOfFSecondElement = j;
                    swapFlag = YES;
                }
                numberOfIteration++;
            }
        }
    }
    
    // finding first index of mismatched object
    int indexOfFirstMismatch = 0;
    int indexOfSecondMismatch = 0;
    for (int i = 0; i < mutableArr.count; i++) {
        firstObject = [[arr objectAtIndex:i] intValue];
        secondObject = [[mutableArr objectAtIndex:i] intValue];
        if (firstObject != secondObject){
            indexOfFirstMismatch = i;
            break;
        }
    }
    
    // finding last index of mismatched object
    for (int i = ((int)[mutableArr count] - 1); i >= 0; i--) {
        firstObject = [[arr objectAtIndex:i] intValue];
        secondObject = [[mutableArr objectAtIndex:i] intValue];
        if (firstObject != secondObject){
            indexOfSecondMismatch = i;
            break;
        }
    }
    
    // check if elements in range are in ascending order
    int obj1 ,obj2;
    int iterIndex = indexOfFirstMismatch;
    do {
        obj1 = [[arr objectAtIndex:iterIndex] intValue];
        obj2 = [[arr objectAtIndex:iterIndex+1] intValue];
        if (obj1<obj2) {
            reverseFlag = NO;
            break;
        }
        iterIndex++;
    } while (iterIndex != indexOfSecondMismatch);
    
    if (swapFlag && numberOfIteration == 1){
        Details = [NSString stringWithFormat:@"swap %d %d", indexOfFirstElement+1, indexOfFSecondElement+1];
        value.status = YES;
    } else if (reverseFlag) {
        Details = [NSString stringWithFormat:@"reverse %d %d", indexOfFirstMismatch+1, indexOfSecondMismatch+1];
        value.status = YES;
    } else if (reverseFlag && swapFlag && numberOfIteration == 1) {
        Details = [NSString stringWithFormat:@"swap %d %d", indexOfFirstElement+1, indexOfFSecondElement+1];
        value.status = YES;
    } else {
        value.status = NO;
    }
    
    value.detail = Details;
    
    arr = nil;
    mutableArr = nil;
    [Details release];
    [someElem release];
    [value autorelease];
    
    return value;
}

@end
