#import "FullBinaryTrees.h"

// good luck
@implementation FullBinaryTrees : NSObject

- (NSString *)stringForNodeCount:(NSInteger)count {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    NSArray* resultArray = [NSArray arrayWithArray:[self arrayOfFullBinaryTrees:count with:dictionary]];
    NSString* resultString = [resultArray componentsJoinedByString:@","];
    
    return resultString;
}

- (NSArray*)arrayOfFullBinaryTrees:(NSInteger)count with:(NSMutableDictionary*)dict {
    if (![dict objectForKey:@(count)]) {
        NSMutableArray<NSString*> *arr = [[NSMutableArray alloc] init];
        if (count == 1) {
            [arr addObject:@"0"];
        } else if (count % 2 == 1) {
            for (int x = 0; x < count; ++x) {
                int y = (int)count - 1 - x;
                for (FullBinaryTrees *left in [self arrayOfFullBinaryTrees:x with:dict])
                    for (FullBinaryTrees *right in [self arrayOfFullBinaryTrees:y with:dict]) {
                        FullBinaryTrees* bns = [[FullBinaryTrees alloc] init];
                        bns.leftNode = left;
                        bns.rightNode = right;
                        [arr addObject:[NSString stringWithFormat:@"%@%@%@",@"0", bns.leftNode,bns.rightNode]];
                    }
            }
        }
        if(arr.count == 0) {
            [arr addObject:@"null"];
        }
        [dict setObject:(NSArray*)arr forKey:@(count)];
    }
    return [dict objectForKey:@(count)];
}

@end
