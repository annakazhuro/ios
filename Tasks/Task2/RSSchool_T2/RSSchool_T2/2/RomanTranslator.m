#import "RomanTranslator.h"

@implementation RomanTranslator
// your code here
- (NSString *)romanFromArabic:(NSString *)arabicString {
    [arabicString retain];
    
    return @"";
}

- (NSString *)arabicFromRoman:(NSString *)romanString{
    [romanString retain];
    
    id keys[] = { @"I", @"V", @"X", @"L", @"C", @"D", @"M"};
    id objects[] = { @"1", @"5", @"10", @"50", @"100", @"500", @"1000"};
    NSUInteger count = sizeof(objects) / sizeof(id);
    NSDictionary *roman = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:count];
    NSMutableArray* arr=[[NSMutableArray alloc] init];
    
    for (int i=0; i<romanString.length; i++) {
        [arr addObject:[NSString stringWithFormat:@"%C", [romanString characterAtIndex:i]]];
    }
    
    int i = 0;
    int j = 0;
    int sum = 0;
    int z = 0;
    
    for (int k=0; k<[arr count]; k++) {
        z=k+1;
        if (z != [arr count]) {
            j=[[roman valueForKey:[arr objectAtIndex:z]] intValue];
        }
        i = [[roman valueForKey:[arr objectAtIndex:k]] intValue];
        if (i<j) {
            i=-i;
        }
        sum += i;
        j=abs(i);
    }
    
    return ([NSString stringWithFormat:@"%d", sum]);
}
@end
