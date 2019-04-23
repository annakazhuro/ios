//
//  RootViewController.m
//  RSSchool_T4
//
//  Created by Anna Kazhuro on 4/20/19.
//  Copyright © 2019 iOSLab. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UITextFieldDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rootFrame = CGRectMake(0, 0, 400, 900);
    UIView *rootView = [[UIView alloc] initWithFrame:rootFrame];
    rootView.tag = 1;
    [self.view addSubview:rootView];
    [rootView release];
    
    CGRect frame = CGRectMake(67, 120, 250, 50);
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.tag = 2;
    textField.delegate = self;
    [self.view addSubview:textField];
    [textField release];
}

-(void)viewWillAppear:(BOOL)animated {
    UIView *view = [self.view viewWithTag:1];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UITextField *mainTextField = [self.view viewWithTag:2];
    mainTextField.backgroundColor = [UIColor clearColor];
    mainTextField.textColor = [UIColor blackColor];
    mainTextField.layer.borderWidth = 1.f;
    mainTextField.layer.borderColor = [UIColor blackColor].CGColor;
    mainTextField.layer.cornerRadius = 5;
    mainTextField.allowsEditingTextAttributes = YES;
    mainTextField.keyboardType = UIKeyboardTypePhonePad;
    mainTextField.returnKeyType = UIReturnKeyDone;
    
    UILabel *flagView = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    flagView.backgroundColor = [UIColor clearColor];
    flagView.contentMode = UIViewContentModeScaleAspectFit;
    flagView.tag = 3;
    UIView *test=  [[UIView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    [test addSubview:flagView];
    
    [mainTextField.leftView setFrame:flagView.frame];
    mainTextField.leftView = test;
    mainTextField.leftViewMode = UITextFieldViewModeAlways;
    mainTextField.tag = 4;
    [self.view addSubview:mainTextField];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //MARK: input
    if (range.length == 0) {
        if (![string isEqualToString:@"+"] && range.location == 0) {
            textField.text = [NSString stringWithFormat:@"%@%@", @"+", string];
        [self setFlagFor:textField.text];
            return NO;
        } else if ([string isEqualToString:@"+"]) {
            return YES;
        } else {
            textField.text = [self textFieldShouldReturnPhoneFormat:[textField.text mutableCopy] withCharacter:string atIndex:range.location];
            [self setFlagFor:textField.text];
            return NO;
        }
    }
    
    // MARK: while deleting
    if (range.length == 1) {
        if ([[NSString stringWithFormat:@"%c",[textField.text characterAtIndex:0]] isEqualToString:@"+"] && textField.text.length <= 2){
            textField.text = @"";
         [self setFlagFor:textField.text];
            return NO;
        }
            textField.text = [self textFieldShouldReturnPhoneFormatWhenDeletingCharacters:[textField.text mutableCopy] at:range.location];
            [self setFlagFor:textField.text];
            return NO;
    }
    return YES;
}

- (NSMutableString*)textFieldShouldReturnPhoneFormat:(NSMutableString*)phoneNumber withCharacter:(NSString*)lastCharacter atIndex:(NSUInteger)index {
    [phoneNumber retain];
    [lastCharacter retain];
    
    [phoneNumber insertString:lastCharacter atIndex:index];
    [lastCharacter release];
    phoneNumber = [[self textFieldShouldReturnFormattedNumber:phoneNumber] mutableCopy];
    return [phoneNumber autorelease];
}
- (NSMutableString*)textFieldShouldReturnPhoneFormatWhenDeletingCharacters:(NSMutableString*)phoneNumber at:(NSUInteger)index {
    [phoneNumber retain];
    
    if ([[NSString stringWithFormat:@"%c", [phoneNumber characterAtIndex:index-1]] isEqualToString:@" "]) {
        [phoneNumber deleteCharactersInRange:NSMakeRange(index-3, 4)];
    } else if ([[NSString stringWithFormat:@"%c", [phoneNumber characterAtIndex:index]] isEqualToString:@")"]) {
        [phoneNumber deleteCharactersInRange:NSMakeRange(index-1, 2)];
    } else {
        [phoneNumber deleteCharactersInRange:NSMakeRange(index, 1)];
    }
    phoneNumber = [[self textFieldShouldReturnFormattedNumber:phoneNumber] mutableCopy];
    return [phoneNumber autorelease];
}

- (NSString*)textFieldShouldReturnFormattedNumber:(NSMutableString*)mobilePhone {
    [[mobilePhone retain] autorelease];
    
    mobilePhone = [[mobilePhone stringByReplacingOccurrencesOfString:@"(" withString:@""] mutableCopy];
    mobilePhone = [[mobilePhone stringByReplacingOccurrencesOfString:@")" withString:@""] mutableCopy];
    mobilePhone = [[mobilePhone stringByReplacingOccurrencesOfString:@"-" withString:@""] mutableCopy];
    mobilePhone = [[mobilePhone stringByReplacingOccurrencesOfString:@"+" withString:@""] mutableCopy];
    mobilePhone = [[mobilePhone stringByReplacingOccurrencesOfString:@" " withString:@""] mutableCopy];
    NSInteger length = 0;
    NSString* code = [[NSString new] autorelease];
    
    if ([[NSString stringWithFormat:@"%c", [mobilePhone characterAtIndex:0]] isEqualToString:@"7"]) {
        code = @"+7";
        if (mobilePhone.length == 1) {
            return code;
        }
        length = mobilePhone.length -1;
        mobilePhone = [[mobilePhone substringFromIndex:1] mutableCopy];
    } else {
        if (mobilePhone.length == 1) {
            code = [NSString stringWithFormat:@"%@%@", @"+", mobilePhone];
            return code;
        } else if (mobilePhone.length == 2) {
            code = [NSString stringWithFormat:@"%@%@", @"+", [mobilePhone substringToIndex:2]];
            return code;
        } else {
            if (mobilePhone.length == 3) {
                code = [NSString stringWithFormat:@"%@%@", @"+", [mobilePhone substringToIndex:3]];
                return code;
            }
            code = [NSString stringWithFormat:@"%@%@", @"+", [mobilePhone substringToIndex:3]];
            length = mobilePhone.length - 3;
            mobilePhone = [[mobilePhone substringFromIndex:3] mutableCopy];
        }
    }
    
    if (length == 1) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%c%@", code, @"(", [mobilePhone characterAtIndex:0], @" )"] mutableCopy];
        return mobilePhone;
    }
    if (length == 2) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 2)], @")"] mutableCopy];
        return mobilePhone;
    }
    if (length == 3) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@%c", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 2)], @")", [mobilePhone characterAtIndex:2]] mutableCopy];
        return mobilePhone;
    }
    if (length == 4) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@%@", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 2)], @")", [mobilePhone substringWithRange:NSMakeRange(2, 2)]] mutableCopy];
        return mobilePhone;
    }
    if (length == 5) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@%@", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 2)], @")", [mobilePhone substringWithRange:NSMakeRange(2, 3)]] mutableCopy];
        return mobilePhone;
    }
    if (length == 6) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@%@%@%c", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 2)], @")",[mobilePhone substringWithRange:NSMakeRange(2, 3)], @"-", [mobilePhone characterAtIndex:5]] mutableCopy];
        return mobilePhone;
    }
    if (length == 7) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@%@%@%@", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 2)], @")",[mobilePhone substringWithRange:NSMakeRange(2, 3)], @"-", [mobilePhone substringWithRange:NSMakeRange(5, 2)]] mutableCopy];
        return mobilePhone;
    }
    if (length == 8) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@%@%@%@", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 2)], @")",[mobilePhone substringWithRange:NSMakeRange(2, 3)], @"-", [mobilePhone substringWithRange:NSMakeRange(5, 3)]] mutableCopy];
        return mobilePhone;
    }
    if (length == 9) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 2)], @")",[mobilePhone substringWithRange:NSMakeRange(2, 3)], @"-", [mobilePhone substringWithRange:NSMakeRange(5, 2)], @"-", [mobilePhone substringWithRange:NSMakeRange(7, 2)]] mutableCopy];
        return mobilePhone;
    }
    if (length == 10) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", code, @"(", [mobilePhone substringWithRange:NSMakeRange(0, 3)], @")",[mobilePhone substringWithRange:NSMakeRange(3, 3)], @"-", [mobilePhone substringWithRange:NSMakeRange(6, 2)], @"-", [mobilePhone substringWithRange:NSMakeRange(8, 2)]] mutableCopy];
        return mobilePhone;
    }
    if (length > 10) {
        mobilePhone = [[NSString stringWithFormat:@"%@%@", code, mobilePhone] mutableCopy];
    }
    return mobilePhone;
}

- (void)setFlagFor:(NSString*)phoneNumber {
    
    UILabel *flagLabel = [self.view viewWithTag:3];
    NSDictionary* codes = [self tableForCodeRecognizing];
    if([phoneNumber isEqualToString:@""]) {
        flagLabel.text = @"";
        flagLabel.backgroundColor = [UIColor clearColor];
        flagLabel.frame = [self.view viewWithTag:4].frame;
        [self.view addSubview:flagLabel];
        return;
    }
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSInteger length = phoneNumber.length;
    NSString* code = [NSString new];

    if ([[NSString stringWithFormat:@"%c", [phoneNumber characterAtIndex:0]] isEqualToString:@"7"] && phoneNumber.length > 1) {
        code = [phoneNumber substringToIndex:1];
    } else if (phoneNumber.length > 3) {
        code = [phoneNumber substringToIndex:3];
    } else {
        code = phoneNumber;
    }
    
    int codeNum = [code intValue];
    
    
    switch (codeNum) {
        case 375:
            flagLabel.text = [codes valueForKey:@"375"];
            break;
        case 380:
            flagLabel.text = [codes valueForKey:@"380"];
            break;
        case 992:
            flagLabel.text = [codes valueForKey:@"992"];
            break;
        case 994:
            flagLabel.text = [codes valueForKey:@"994"];
            break;
        case 996:
            flagLabel.text = [codes valueForKey:@"996"];
            break;
        case 998:
            flagLabel.text = [codes valueForKey:@"998"];
            break;
        case 373:
            flagLabel.text = [codes valueForKey:@"373"];
            break;
        case 374:
            flagLabel.text = [codes valueForKey:@"374"];
            break;
        case 993:
            flagLabel.text = [codes valueForKey:@"993"];
            break;
        case 7:
            if (length == 1) {
                flagLabel.text = @"";
                break;
            }
            if ([[NSString stringWithFormat:@"%c", [phoneNumber characterAtIndex:1]] isEqualToString:@"7"]) {
                flagLabel.text = [codes valueForKey:@"77"];
            } else {
                flagLabel.text = [codes valueForKey:@"7"];
            }
            break;
        default:
            flagLabel.text = @"";
            break;
    }
    codes = nil;
    
    flagLabel.backgroundColor = [UIColor clearColor];
    flagLabel.frame = [self.view viewWithTag:4].frame;
    flagLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:flagLabel];

    if (length > 11 && ([code isEqualToString:@"373"] || [code isEqualToString:@"374"] || [code isEqualToString:@"993"])) {
        flagLabel.text = @"";
        flagLabel.backgroundColor = [UIColor clearColor];
        flagLabel.frame = [self.view viewWithTag:4].frame;
        
        [self.view addSubview:flagLabel];
    }
    if (length > 12 && ([code isEqualToString:@"375"] || [code isEqualToString:@"380"] || [code isEqualToString:@"992"] || [code isEqualToString:@"994"] || [code isEqualToString:@"996"] || [code isEqualToString:@"998"])) {
        flagLabel.text = @"";
        flagLabel.backgroundColor = [UIColor clearColor];
        flagLabel.frame = [self.view viewWithTag:4].frame;
        
        [self.view addSubview:flagLabel];
    }
    if (length > 11 && [code isEqualToString:@"7"]) {
        flagLabel.text = @"";
        flagLabel.backgroundColor = [UIColor clearColor];
        flagLabel.frame = [self.view viewWithTag:4].frame;
        
        [self.view addSubview:flagLabel];
    }
}

- (NSDictionary*)tableForCodeRecognizing {
    NSDictionary *countryCodeToCountry = @{
                                           @"7":@"🇷🇺",
                                           @"77":@"🇰🇿",
                                           @"373":@"🇲🇩",
                                           @"374":@"🇦🇲",
                                           @"375":@"🇧🇾",
                                           @"380":@"🇺🇦",
                                           @"992":@"🇹🇯",
                                           @"993":@"🇹🇲",
                                           @"994":@"🇦🇿",
                                           @"996":@"🇰🇬",
                                           @"998":@"🇺🇿"
                                           };
    return countryCodeToCountry;
}

@end
