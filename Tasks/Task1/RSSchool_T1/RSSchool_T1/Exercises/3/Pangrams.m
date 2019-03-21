#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    [string retain];
    [super dealloc];
    [string release];
    
    NSMutableCharacterSet* set = [NSMutableCharacterSet whitespaceCharacterSet];
    [set formUnionWithCharacterSet:[NSMutableCharacterSet punctuationCharacterSet]];
    
    string = [[string componentsSeparatedByCharactersInSet:set]componentsJoinedByString:@""];
    string = [string lowercaseString];
    
    NSMutableSet<NSString *> *alphabets = [NSMutableSet set];
    for(int i=0;i<string.length;i++){
        if([string characterAtIndex:i] >= 'a' && [string characterAtIndex:i]<='z')
            [alphabets addObject:[NSString stringWithFormat:@"%c",[string characterAtIndex:i]]];
    }
    
    if([alphabets count] < 26){
        return false;
    }
    
    return true;
}




@end
