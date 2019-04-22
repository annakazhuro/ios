//
//  RootViewController.h
//  RSSchool_T4
//
//  Created by Anna Kazhuro on 4/20/19.
//  Copyright © 2019 iOSLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

- (NSMutableString*)textFieldShouldReturnPhoneFormat:(NSMutableString*)phoneNumber withCharacter:(NSString*)lastCharacter atIndex:(NSUInteger)index;
- (NSMutableString*)textFieldShouldReturnPhoneFormatWhenDeletingCharacters:(NSMutableString*)phoneNumber at:(NSUInteger)index;
- (NSString*)textFieldShouldReturnFormattedNumber:(NSMutableString*)mobilePhone;
- (void)setFlagFor:(NSString*)phoneNumber;
- (NSDictionary*)tableForCodeRecognizing;

@end


