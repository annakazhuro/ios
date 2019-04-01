#import "MatrixHacker.h"
// your code here
@interface MatrixHacker()<Character>

@property(nonatomic,assign) NSString* nameOfPerson;
@property(nonatomic,assign) BOOL isHeClone;
@property(nonatomic, copy) id<Character>(^anotherBlock)(NSString *name);

@end

@implementation MatrixHacker
// your code here
- (void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    _anotherBlock=theBlock;
}

- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    MatrixHacker* a = [MatrixHacker new];
    NSArray<id<Character>> *arr = [NSArray new];
    
    for (NSString* name in names) {
        id<Character> value = (id)name;
        a.nameOfPerson = name;
    
        if ([[value class] respondsToSelector:@selector(createWithName:isClone:)]) {
            [arr arrayByAddingObject:[[value class] createWithName:value.name isClone:value.isClone]];
        }
    }
    return arr;
}


//+ (instancetype)createWithName:(NSString *)name isClone:(BOOL)clone {
//    return [(void)(@""), @""];
//}

- (BOOL)isClone {
    MatrixHacker* c = [MatrixHacker new];
    if ([[c nameOfPerson] isEqualToString:@"Neo"]) {
        return NO;
    } else {
        return YES;
    }
}

- (NSString *)name {
    MatrixHacker* b = [MatrixHacker new];
    if ([[b nameOfPerson] isEqualToString:@"Neo"]) {
        return @"Neo";
    } else {
        return @"AgentSmith";
    }
}

@end
