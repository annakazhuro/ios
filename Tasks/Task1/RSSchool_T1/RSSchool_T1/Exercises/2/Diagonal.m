#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    [array retain];
    
    int sumOfMainDiag = 0;
    int sumOfSecondaryDiag = 0;
    int rows = 0;
    NSUInteger indicies = [array count];
    NSArray* arrayOfMatrixLine = [NSArray new];
    NSNumber* elementOfMainDiagonal = [NSNumber new];
    NSNumber* elemOfSecondaryDiagonal = [NSNumber new];
    
    for (int columns = 0; columns<indicies; columns++){
        NSString* str = [[NSString alloc] initWithString:[array objectAtIndex:rows]] ;
        
        arrayOfMatrixLine = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        elementOfMainDiagonal = arrayOfMatrixLine[columns];
        sumOfMainDiag += [elementOfMainDiagonal intValue] ;
        
        elemOfSecondaryDiagonal = arrayOfMatrixLine[indicies-columns-1];
        sumOfSecondaryDiag += [elemOfSecondaryDiagonal intValue] ;
        
        rows++;
    }
    
    int difference = abs(sumOfMainDiag-sumOfSecondaryDiag);
    NSNumber* result = [NSNumber numberWithInt:(difference)];
    
    arrayOfMatrixLine = nil;
    [elementOfMainDiagonal release];
    [elemOfSecondaryDiagonal release];
    
    return result;
}

@end
