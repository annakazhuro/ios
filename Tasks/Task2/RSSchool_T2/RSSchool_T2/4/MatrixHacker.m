#import "MatrixHacker.h"
// your code here
@interface MatrixHacker()<Character>

@property(nonatomic,assign) NSString* nameOfPerson;
@property(nonatomic,assign) BOOL isHeClone;
@property(nonatomic, copy) id<Character>(^anotherBlock)(NSString *name);
//@property(nonatomic,assign) NSMutableArray* arrayWithInfo;

@end

@implementation MatrixHacker
// your code here
- (void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    _anotherBlock = theBlock;
}

- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    NSArray<id<Character>> *arr = [NSArray new];
    
    self.isHeClone = true;
    for (NSString* name in names) {
        id<Character> value = (id)name;
        self.nameOfPerson = name;
        
        if ([[value class] respondsToSelector:@selector(createWithName:isClone:)]) {
            if ([name isEqualToString:@"Neo"]) {
                [arr arrayByAddingObject:[[value class] createWithName:@"Neo" isClone: NO]];
            }
            [arr arrayByAddingObject:[[value class] createWithName:value.name isClone:value.isClone]];
        }
    }
    
    return arr;
}


//+ (instancetype)createWithName:(NSString *)name isClone:(BOOL)clone {
//    MatrixHacker* obj = [MatrixHacker new];
//    obj.arrayWithInfo = [NSMutableArray arrayWithArray:[obj.arrayWithInfo arrayByAddingObject:name]];
//
//
//    return obj;
//}

- (BOOL)isClone {
    return false;
}

- (NSString *)name {
    return @"Agent Smith";
}

@end
