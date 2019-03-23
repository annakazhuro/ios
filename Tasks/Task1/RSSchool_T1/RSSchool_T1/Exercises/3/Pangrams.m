#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    [string retain];
    
    NSMutableCharacterSet* setOfWhiteSpaceToFindPangram = [NSMutableCharacterSet whitespaceCharacterSet];
    [setOfWhiteSpaceToFindPangram formUnionWithCharacterSet:[NSMutableCharacterSet punctuationCharacterSet]];
    
    string = [[string componentsSeparatedByCharactersInSet:setOfWhiteSpaceToFindPangram]componentsJoinedByString:@""];
    string = [string lowercaseString];
    
    NSMutableSet<NSString *> *alphabets = [NSMutableSet set];
    for(int i=0; i<string.length; i++) {
        if([string characterAtIndex:i] >= 'a' && [string characterAtIndex:i]<='z')
            [alphabets addObject:[NSString stringWithFormat:@"%c",[string characterAtIndex:i]]];
    }
    
    if([alphabets count] < 26){
        return false;
    }
    
    setOfWhiteSpaceToFindPangram = nil;
    alphabets = nil;
    
    
    
    return true;
}
@end
