//
//  BAAboutViewController.m
//  BusinessApp
//
//  Created by Extremall on 13.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAAboutViewController.h"
#import "BAMapViewController.h"
#import "BAYandexMapViewController.h"
#import "BAFeedbackViewController.h"
#import "BAPhotosViewController.h"

@interface BAAboutViewController ()

@end

@implementation BAAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)btnMap_Click:(id)sender
{
    //BAMapViewController *mapVC = [BAMapViewController create];
    BAYandexMapViewController *mapVC = [BAYandexMapViewController create];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (IBAction)btnFeedback_Click:(id)sender
{
    BAFeedbackViewController *feedbackVC = [BAFeedbackViewController create];
    [self.navigationController pushViewController:feedbackVC animated:YES];
}

- (IBAction)btnPhotos_Click:(id)sender;
{
    BAPhotosViewController *photosVC = [BAPhotosViewController create];
    [self.navigationController pushViewController:photosVC animated:YES];
}

- (IBAction)btnCall_Click:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", kPhoneNumber]]];
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
