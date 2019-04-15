#import "FullBinaryTrees.h"

// good luck
@implementation FullBinaryTrees : NSObject

- (NSString *)stringForNodeCount:(NSInteger)count {
//    NSInteger height = ceil(count/2);
//    NSMutableArray* binaryTreeArray = [NSMutableArray new];
//    FullBinaryTreeArray* obj = [FullBinaryTreeArray new];
//    for (int i = 0; i < height; i++) {
//        if (i == 0) {
//            [binaryTreeArray insertObject:@"0" atIndex:i];
//        }
//        [binaryTreeArray insertObject:[obj arayForCurrentHeight:i] atIndex:i];
//    }
   // NSMapTable *hashMap = [[NSMapTable alloc] init];
    NSHashTable *table = [NSHashTable new];
    
    table = [self arrayOfFullBinaryTrees:count];
    
    NSArray* resultArray = [NSArray new];
    resultArray = [NSArray arrayWithObjects:[table allObjects], nil];
    NSString* resultString = [resultArray componentsJoinedByString:@","];
    
    return resultString;
}

- (NSHashTable*)arrayOfFullBinaryTrees:(NSInteger)count {
    NSHashTable* table = [NSHashTable new];
    NSMutableArray* arr = [NSMutableArray new];
    
        if (count == 0) {
            [arr addObject:@"0"];
        } else if (count % 2 == 1) {
            for (int x = 0; x < count; ++x) {
                int y = (int)count - 1 - x;
                for (FullBinaryTrees *left in [self arrayOfFullBinaryTrees:x]) {
                    for (FullBinaryTrees *right in [self arrayOfFullBinaryTrees:y]) {
                        FullBinaryTrees* bns = [[FullBinaryTrees alloc] init];
                        bns.leftNode = left;
                        bns.rightNode = right;
                        [arr addObject:bns];
                    }
                }
            }
           [table addObject:arr];
        }
    return table;
}

@end
