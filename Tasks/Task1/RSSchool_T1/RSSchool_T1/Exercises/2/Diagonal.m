#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    [array retain];
    [super dealloc];
    
    int sumOfMainDiag = 0;
    int sumOfSecondaryDiag = 0;
    NSUInteger indicies = [array count];
    int rows = 0;
    
    for (int columns = 0; columns<indicies; columns++){
        NSString* str = [[NSString alloc] initWithString:[array objectAtIndex:rows]] ;
        NSArray* arr=[str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSNumber* elem1 = arr[columns];
        sumOfMainDiag += [elem1 intValue] ;
        
        NSNumber* elem2 = arr[indicies-columns-1];
        sumOfSecondaryDiag += [elem2 intValue] ;
        
        rows++;
    }
    
    int difference = abs(sumOfMainDiag-sumOfSecondaryDiag);
    NSNumber* result = [NSNumber numberWithInt:(difference)];
    
    return result;
}

@end
