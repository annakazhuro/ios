//
//  ResultStringCreation.m
//  RSSchool_T3
//
//  Created by Anna Kazhuro on 4/10/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import "ResultStringCreation.h"

@implementation ResultStringCreation

- (NSString *)getResultString:(NSArray *)someArray {
    NSMutableString* result = [NSMutableString new];
//    NSMutableString* reallyTotalResult = [NSMutableString new];
   // NSMutableString* totalResult = [NSMutableString new];
    
    for (NSObject* object in someArray) {
        result = [[result stringByAppendingString:[self getString:object]] mutableCopy];
    }
    return result;
}

- (NSString *)getString:(NSObject *)object {
    NSMutableString* string = [NSMutableString new];
   // NSMutableString* reallyTotalResult = [NSMutableString new];
    NSMutableString* totalResult = [NSMutableString new];
    if ([object isKindOfClass:[NSArray class]]) {
        totalResult = [[totalResult stringByAppendingString:[self getResultString:(NSArray*)object]] mutableCopy];
    }
    else if ([object isKindOfClass:[NSNull class]]) {
        string = [[string stringByAppendingString:@"null"] mutableCopy];
    }
    else if ([object isKindOfClass:[NSNumber class]]) {
        string = [[string stringByAppendingString:[NSString stringWithFormat:@"%@", object]] mutableCopy];
        string = [[string stringByAppendingString:@","] mutableCopy];
        
    }
    else if ([object isKindOfClass:[NSString class]]) {
        string = [[string stringByAppendingString:[NSString stringWithFormat:@"\"%@\"", object]] mutableCopy];
    }
    else {
        string = [[string stringByAppendingString:@"unsupported"] mutableCopy];
    }
    return string;
}

@end
