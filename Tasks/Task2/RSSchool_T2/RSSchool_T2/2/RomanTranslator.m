#import "RomanTranslator.h"

@implementation RomanTranslator
// your code here
- (NSString *)romanFromArabic:(NSString *)arabicString {
    [arabicString retain];
    
    id objects[] = { @"I", @"II", @"III", @"IV",  @"V", @"VI", @"VII", @"VIII", @"IX", @"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX", @"LXXX", @"XC", @"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC", @"DCCC", @"CM", @"M"};
    id keys[] = { @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"20", @"30", @"40", @"50", @"60", @"70", @"80", @"90", @"100", @"200", @"300", @"400", @"500", @"600", @"700", @"800", @"900", @"1000"};
    NSUInteger count = sizeof(objects) / sizeof(id);
    NSDictionary *combinations = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:count];
    NSString *result = [[NSString alloc] init];
    NSMutableString* totalResult = [NSMutableString new];
    int d= 0;
    int num = [arabicString intValue];
    int iteration = 0;
    int multiplier = 0;
    
    do {
        d = num%10;
        multiplier = d*(int)pow(10, (double)iteration);
        result = [combinations valueForKey:[NSString stringWithFormat:@"%d", multiplier]];
        totalResult = [[result stringByAppendingString: totalResult] mutableCopy];
        num = num/10;
        iteration++;
    } while (num>0);
    
    [arabicString release];
    combinations = nil;
    [result release];
    
    return [totalResult autorelease];
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
    
    roman = nil;
    arr = nil;
    [romanString release];

    return ([NSString stringWithFormat:@"%d", sum]);
}
@end
