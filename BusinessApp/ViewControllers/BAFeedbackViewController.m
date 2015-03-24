//
//  BAFeedbackViewController.m
//  BusinessApp
//
//  Created by Extremall on 15.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAFeedbackViewController.h"

@interface BAFeedbackViewController ()

@end

@implementation BAFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)btnSend_Click:(id)sender
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Отправка отзыва";
    [[RequestManager sharedInstance] sendFeedback:_txtName.text
                                             text:_txtFeedback.text
                                       completion:^(id result, NSError *error) {
                                           [hud hide:YES];
                                       }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
