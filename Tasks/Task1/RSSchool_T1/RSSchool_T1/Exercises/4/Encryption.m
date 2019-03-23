#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    [string retain];
    
    
    NSString* mainString = [[NSString alloc] initWithString:string];
    NSUInteger sizeOfMainString = [mainString length];
    NSString* resultString = [NSString new];
    NSString* elementOfWordsInMainString = [[NSString alloc] init];
    NSString* charOfElementOfWords = [NSString new];
    
    if (sizeOfMainString < 82 && sizeOfMainString > 0) {
        if (sizeOfMainString == 1) {
            [mainString release];
            return mainString;
        }
        
        NSMutableCharacterSet *setOfWhiteSpaceForEncryption = [NSMutableCharacterSet whitespaceCharacterSet];
        mainString = [[mainString componentsSeparatedByCharactersInSet:setOfWhiteSpaceForEncryption] componentsJoinedByString:@""];
        NSString* helpString = [[NSString alloc] init];
        NSMutableArray* words = [[NSMutableArray alloc] init];
        
        double root=sqrt(sizeOfMainString);
        int row = (int)floor(root);
        int column = (int)ceil(root);
        if (row*column < sizeOfMainString) {
            row += 1;
        }
        
        //creating Mutable array of words size row x column
        for (int i = 0; i < column; i++) {
            if (mainString.length <= column ) {
                [words addObject:mainString];
                break;
            } else {
                helpString = [mainString substringToIndex:column];
                [words addObject:helpString];
                mainString=[mainString substringFromIndex:column];
            }
        }
        [helpString release];
        
        //creating string concatinating all words made from characters in each columns
        int j;
        for (int i = 0; i < column; i++) {
            for ( j = 0; j < words.count; j++) {
                elementOfWordsInMainString =[words objectAtIndex:j];
                if (i > elementOfWordsInMainString.length - 1) {
                    break;
                }
                charOfElementOfWords = [NSString stringWithFormat:@"%c", [elementOfWordsInMainString characterAtIndex:i]];
                resultString = [resultString stringByAppendingString:charOfElementOfWords];
            }
            if (i != [words count] - 1 || i > elementOfWordsInMainString.length - 1 || j == [words count]) {
                resultString = [resultString stringByAppendingString:@" "];
            }
        }
        char lastCharacterInResultString = [resultString characterAtIndex:[resultString length]-1];
        
        if(lastCharacterInResultString == ' ') {
            int lengthOfSubstring = (int)[resultString length] - 1;
            resultString = [resultString substringToIndex:lengthOfSubstring];
        }
        
        setOfWhiteSpaceForEncryption = nil;
        words = nil;
    }
    
    [mainString release];
    [elementOfWordsInMainString release];
    [charOfElementOfWords release];

    return resultString;
}
@end

