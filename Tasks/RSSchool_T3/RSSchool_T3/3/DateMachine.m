#import "DateMachine.h"

@implementation DateMachine

@synthesize label = _label;
@synthesize addButton = _addButton;
@synthesize subButton = _subButton;
@synthesize textField1 = _textField1;
@synthesize textField2 = _textField2;
@synthesize textField3 = _textField3;

- (void)viewDidLoad {
  [super viewDidLoad];
  // have fun
    UIView *view1 = [[UIView alloc] initWithFrame:self.view.bounds];
    view1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view1];
    
    NSDateFormatter *formatter = [self createDateFormatter];
    NSString* str = [[NSString alloc] initWithString:[formatter stringFromDate:[NSDate date]]];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 280, 40)];
    _label.backgroundColor = [UIColor clearColor];
    _label.text = str;
    _label.textColor = [UIColor blackColor];
    _label.tintColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [view1 addSubview:_label];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton addTarget:self action:@selector(addSomeValue)forControlEvents:UIControlEventTouchUpInside];
    [_addButton setTitle:@"Add" forState:UIControlStateNormal];
    _addButton.frame = CGRectMake(50, 500, 120, 48);
    _addButton.backgroundColor = [UIColor blackColor];
    _addButton.layer.cornerRadius = 10;
    _addButton.layer.borderWidth = 2;
    [view1 addSubview:_addButton];
    
    _subButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_subButton addTarget:self action:@selector(subSomeValue)forControlEvents:UIControlEventTouchUpInside];
    [_subButton setTitle:@"Sub" forState:UIControlStateNormal];
    _subButton.frame = CGRectMake(210, 500, 120, 48);
    _subButton.backgroundColor = [UIColor blackColor];
    _subButton.layer.cornerRadius = 10;
    _subButton.layer.borderWidth = 2;
    [view1 addSubview:_subButton];
    
    _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(50, 260, 280, 40)];
    _textField1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Start date" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    _textField1.backgroundColor = [UIColor lightGrayColor];
    _textField1.layer.cornerRadius = 3;
    _textField1.alpha = 0.5;
    [view1 addSubview:_textField1];
    
    _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(50, 320, 280, 40)];
    _textField2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Step" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    _textField2.backgroundColor = [UIColor lightGrayColor];
    _textField2.layer.cornerRadius = 3;
    _textField2.alpha = 0.5;
    [view1 addSubview:_textField2];
    
    _textField3 = [[UITextField alloc] initWithFrame:CGRectMake(50, 380, 280, 40)];
    _textField3.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Date unit" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    _textField3.backgroundColor = [UIColor lightGrayColor];
    _textField3.layer.cornerRadius = 3;
    _textField3.alpha = 0.5;
    [view1 addSubview:_textField3];
    [_textField1 setDelegate:self];
    [_textField2 setDelegate:self];
    [_textField3 setDelegate:self];
}

- (NSDateFormatter*)createDateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+3"]];
    [formatter setLocale:[NSLocale autoupdatingCurrentLocale]];
    return formatter;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self setStartDate];
    [textField resignFirstResponder];
    return YES;
}

- (void)setStartDate {
    NSString* changes = _textField1.text;
    NSDateFormatter *formatter = [self createDateFormatter];
    NSDate* dateFromTextField = [formatter dateFromString:changes];
    if (changes.length > 0 && dateFromTextField) {
        _label.text = _textField1.text;
    }
}

- (BOOL)checkDateUnit:(NSMutableString*)dateUnitFromTextField {
    [dateUnitFromTextField retain];
    dateUnitFromTextField = [[dateUnitFromTextField lowercaseString] mutableCopy];
    if ([dateUnitFromTextField isEqualToString:@"year"]|[dateUnitFromTextField isEqualToString:@"month"]|[dateUnitFromTextField isEqualToString:@"day"]|[dateUnitFromTextField isEqualToString:@"hour"]|[dateUnitFromTextField isEqualToString:@"minute"]) {
        return YES;
    }
    return NO;
}

- (void)addSomeValue {
    [self buttonOnClickMethod:[NSString stringWithFormat:@"%@", _addButton.titleLabel]];
}

- (void)subSomeValue {
    [self buttonOnClickMethod:[NSString stringWithFormat:@"%@", _subButton.titleLabel]];
}

- (void) buttonOnClickMethod:(NSString*) buttonName {
    [buttonName retain];
    
    NSInteger step = [_textField2.text integerValue];
    if ([buttonName isEqualToString:[NSString stringWithFormat:@"%@", _subButton.titleLabel]]){
        step *= -1;
    }
    NSDate *current = [[NSDate alloc] init];
    NSDateFormatter *form = [self createDateFormatter];
    current = [form dateFromString:_label.text];
    
    NSDate* newDate = [self newDateWithComponent:step from:current];
    NSString* newDateWithSomeStep = [NSString new];
    newDateWithSomeStep = [form stringFromDate:newDate];
    _label.text = [NSString stringWithFormat:@"%@", newDateWithSomeStep];
}

- (NSDate*)newDateWithComponent: (NSInteger)component from: (NSDate*)currentDate {
    [currentDate retain];
    
    NSString* dateUnit = _textField3.text.lowercaseString;
    NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
    if ([dateUnit isEqualToString:@"year"]) {
        dateComponent.year = component;
    }
    if ([dateUnit isEqualToString:@"month"]) {
        dateComponent.month = component;
    }
    if ([dateUnit isEqualToString:@"day"]) {
        dateComponent.day = component;
        
    }
    if ([dateUnit isEqualToString:@"hour"]) {
        dateComponent.hour = component;
    }
    if ([dateUnit isEqualToString:@"minute"]) {
        dateComponent.minute = component;
    }
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *newDate = [theCalendar dateByAddingComponents:dateComponent toDate:currentDate options:0];
    return newDate;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
    if (textField == _textField1) {
        NSCharacterSet *allowedCharacters = [NSCharacterSet characterSetWithCharactersInString:@" 0123456789/:"];
        if ([allowedCharacters isSupersetOfSet:characterSetFromTextField]) {
            return YES;
        }
    }

    if (textField == _textField2) {
        NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        if ([numbersOnly isSupersetOfSet:characterSetFromTextField]) {
            return YES;
        }
    }
    

    if (textField == _textField3)
    {
        NSMutableCharacterSet *lettersOnly = [NSMutableCharacterSet letterCharacterSet];
        [lettersOnly formUnionWithCharacterSet:[NSCharacterSet uppercaseLetterCharacterSet]];
        
        if ([lettersOnly isSupersetOfSet:characterSetFromTextField])
        {
            [self checkDateUnit:(NSMutableString*)_textField3.text];
            return YES;
        }
    }

    
    return NO;
}

@end


