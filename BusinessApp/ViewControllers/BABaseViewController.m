//
//  BABaseViewController.m
//  BusinessApp
//
//  Created by Extremall on 14.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BABaseViewController.h"

@interface BABaseViewController ()

@end

@implementation BABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
}

+ (instancetype)create
{
    NSString *className = NSStringFromClass([self class]);
    
    NSRange range = [className rangeOfString:@"View"];
    if(range.location == NSNotFound) {
        NSLog(@"Wrong name of class!");
        return nil;
    }
    
    NSString *prefix = [className substringToIndex:range.location];
    NSString *identificator = [NSString stringWithFormat:@"%@ID", prefix.lowercaseString];
    
    id controller = [mainStoryboard instantiateViewControllerWithIdentifier:identificator];
    return controller;
}

#pragma mark - First responder

- (UIView *)findFirstResponderUnder:(UIView *)root {
    if (root.isFirstResponder)
        return root;
    for (UIView *subView in root.subviews) {
        UIView *firstResponder = [self findFirstResponderUnder:subView];
        if (firstResponder != nil)
            return firstResponder;
    }
    return nil;
}

- (UITextField *)findFirstResponderTextField {
    UIResponder *firstResponder = [self findFirstResponderUnder:[self.view window]];
    if (![firstResponder isKindOfClass:[UITextField class]])
        return nil;
    return (UITextField *)firstResponder;
}

#pragma mark - Actions

- (IBAction)didEndOnExit:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark - Keyboard

- (void)keyboardWillShow:(NSNotification *)note
{
    UITextField *textField = [self findFirstResponderTextField];
    if (textField.keyboardType != UIKeyboardTypeNumberPad)
    {
        [self removeButton];
        return;
    }
    
    // if clause is just an additional precaution, you could also dismiss it
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 3.2) {
        [self addButton];
    }
}

- (void)keyboardDidShow:(NSNotification *)note {
    UITextField *textField = [self findFirstResponderTextField];
    if (textField.keyboardType != UIKeyboardTypeNumberPad)
    {
        [self removeButton];
        return;
    }
    
    // if clause is just an additional precaution, you could also dismiss it
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
        [self addButton];
    }
}
#pragma mark - Remove button

- (void)addButton
{
    if ([[UIApplication sharedApplication] windows].count < 2)
        return;
    
    // create custom button
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.tag = 121212;
    //doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(0, 163, 106, 53);
    doneButton.adjustsImageWhenHighlighted = YES;
    [doneButton setImage:[UIImage imageNamed:@"btn_hide_keyboard.png"] forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(didEndOnExit:) forControlEvents:UIControlEventTouchUpInside];
    
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView* keyboard;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        // keyboard view found; add the custom button to it
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            if([[keyboard description] hasPrefix:@"<UIInputSetContainerView"] == YES)
            {
                for(int i = 0 ; i < [keyboard.subviews count] ; i++)
                {
                    UIView* hostkeyboard = [keyboard.subviews objectAtIndex:i];
                    
                    if([[hostkeyboard description] hasPrefix:@"<UIInputSetHost"] == YES){
                        UIView *old = [hostkeyboard viewWithTag:121212];
                        [old removeFromSuperview];
                        [hostkeyboard addSubview:doneButton];
                    }
                }
            }
        }
        else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
            {
                UIView *old = [keyboard viewWithTag:121212];
                [old removeFromSuperview];
                [keyboard addSubview:doneButton];
            }
        } else {
            if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
            {
                UIView *old = [keyboard viewWithTag:121212];
                [old removeFromSuperview];
                [keyboard addSubview:doneButton];
            }
        }
    }
}

- (void)removeButton
{
    if ([[UIApplication sharedApplication] windows].count < 2)
        return;
    
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView* keyboard;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        // keyboard view found; add the custom button to it
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            if([[keyboard description] hasPrefix:@"<UIInputSetContainerView"] == YES)
            {
                for(int i = 0 ; i < [keyboard.subviews count] ; i++)
                {
                    UIView* hostkeyboard = [keyboard.subviews objectAtIndex:i];
                    
                    if([[hostkeyboard description] hasPrefix:@"<UIInputSetHost"] == YES){
                        UIView *old = [hostkeyboard viewWithTag:121212];
                        [old removeFromSuperview];
                    }
                }
            }
        }
        else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
            {
                UIView *old = [keyboard viewWithTag:121212];
                [old removeFromSuperview];
            }
        } else {
            if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
            {
                UIView *old = [keyboard viewWithTag:121212];
                [old removeFromSuperview];
            }
        }
    }
}

- (void)refreshButton:(id)sender
{
    [self removeButton];
    if ([sender isKindOfClass:[UITextField class]])
    {
        [self keyboardWillShow:nil];
        [self keyboardDidShow:nil];
    }
}


@end
