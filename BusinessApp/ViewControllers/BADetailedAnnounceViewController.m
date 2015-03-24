//
//  BADetailedAnnounceViewController.m
//  BusinessApp
//
//  Created by Extremall on 12.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BADetailedAnnounceViewController.h"

@interface BADetailedAnnounceViewController ()

@end

@implementation BADetailedAnnounceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lblTitle.text = _announce.title;
    [_imgPhoto sd_setImageWithURL:[NSURL URLWithString:_announce.imageURL]];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Загрузка деталей акции";
    [[RequestManager sharedInstance] getDetailedAnnounce:_announce.announceIDValue completion:^(id result, NSError *error) {
        [hud hide:YES];
        [_webView loadHTMLString:_announce.content baseURL:nil];
    }];
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

@end
