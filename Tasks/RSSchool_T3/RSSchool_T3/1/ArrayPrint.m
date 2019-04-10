#import "ArrayPrint.h"
#import "ResultStringCreation.h"

@implementation NSArray (RSSchool_Extension_Name)

- (NSMutableString *)result {
    return self.result;
}

- (void)setResult:(NSMutableString *)result {
    self.result = result;
}

- (NSString *)print {
    ResultStringCreation* a = [ResultStringCreation new];
    return [a getResultString:self];
}
@end
