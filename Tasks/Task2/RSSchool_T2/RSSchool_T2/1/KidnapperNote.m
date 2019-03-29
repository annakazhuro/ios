#import "KidnapperNote.h"

@implementation KidnapperNote
// your code here
- (BOOL)checkMagazine:(NSString *)magazine note:(NSString *)note {
    [magazine retain];
    [note retain];
    
    if ([[NSCountedSet setWithArray:[note.lowercaseString componentsSeparatedByString:@" "]] isSubsetOfSet: [NSCountedSet setWithArray:[magazine.lowercaseString componentsSeparatedByString:@" "]]] ) {
        
        [magazine release];
        [note release];
        
        return YES;
    } else {
        return NO;
    }
}

@end
