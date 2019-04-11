#import "ResultStringCreation.h"

@implementation ResultStringCreation

- (NSString *)getResultString:(NSArray *)someArray {
    [someArray retain];
    
    NSMutableString* totalResult = [NSMutableString new];
    totalResult = [[totalResult stringByAppendingString:@"["] mutableCopy];
    for (NSObject* object in someArray) {
        if ([object isKindOfClass:[NSArray class]]) {
            totalResult = [[totalResult stringByAppendingString:[self getResultString:(NSArray*)object]] mutableCopy];
            totalResult = [[totalResult stringByAppendingString:@","] mutableCopy];
        }
        else if ([object isKindOfClass:[NSNull class]]) {
            totalResult = [[totalResult stringByAppendingString:@"null"] mutableCopy];
            totalResult = [[totalResult stringByAppendingString:@","] mutableCopy];
        }
        else if ([object isKindOfClass:[NSNumber class]]) {
            totalResult = [[totalResult stringByAppendingString:[NSString stringWithFormat:@"%@", object]] mutableCopy];
            totalResult = [[totalResult stringByAppendingString:@","] mutableCopy];
            
        }
        else if ([object isKindOfClass:[NSString class]]) {
            totalResult = [[totalResult stringByAppendingString:[NSString stringWithFormat:@"\"%@\"", object]] mutableCopy];
            totalResult = [[totalResult stringByAppendingString:@","] mutableCopy];
        }
        else {
            totalResult = [[totalResult stringByAppendingString:@"unsupported"] mutableCopy];
            totalResult = [[totalResult stringByAppendingString:@","] mutableCopy];
        }
    }
    totalResult = [[totalResult stringByAppendingString:@","] mutableCopy];
    totalResult = [[totalResult stringByAppendingString:@"]"] mutableCopy];
    totalResult = [[totalResult stringByReplacingOccurrencesOfString:@",," withString:@","] mutableCopy];
    totalResult = [[totalResult stringByReplacingOccurrencesOfString:@",]" withString:@"]"] mutableCopy];
    
    return [totalResult autorelease];
}
@end
