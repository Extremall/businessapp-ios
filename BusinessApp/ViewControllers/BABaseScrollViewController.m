//
//  BABaseScrollViewController.m
//  BusinessApp
//
//  Created by Extremall on 18.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BABaseScrollViewController.h"

@interface BABaseScrollViewController ()

@end

@implementation BABaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.scrollView.contentSize = self.scrollView.frame.size;
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notif
{
    [super keyboardWillShow:notif];
    
    NSDictionary* info = [notif userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, kbSize.height, 0);
    
    CGRect visibleRect = CGRectMake(0,
                                    self.scrollView.contentOffset.y,
                                    self.view.frame.size.width,
                                    self.scrollView.frame.size.height - kbSize.height);
    
    UIView *activeView = [self findFirstResponderUnder:self.view.window];
    
    CGRect activeRect = [activeView convertRect:activeView.bounds toView:self.scrollView];
    
    if (!CGRectContainsRect(visibleRect, activeRect))
    {
        if (activeRect.origin.y < visibleRect.origin.y)
            [self.scrollView setContentOffset:CGPointMake(0, activeRect.origin.y)
                                     animated:YES];
        else if (activeRect.size.height > visibleRect.size.height)
            [self.scrollView setContentOffset:CGPointMake(0, activeRect.origin.y)
                                     animated:YES];
        else
        {
            CGFloat Y = CGRectGetMaxY(activeRect) - visibleRect.size.height;
            if (Y < 0)
                Y = 0;
            [self.scrollView setContentOffset:CGPointMake(0, Y)
                                     animated:YES];
        }
    }
}

- (void)keyboardDidShow:(NSNotification*)notif
{
    [super keyboardDidShow:notif];
}

- (void)keyboardWillHide
{
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)keyboardDidHide
{
    
}

@end
