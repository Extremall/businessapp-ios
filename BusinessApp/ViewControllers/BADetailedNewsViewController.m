//
//  BADetailedNewsViewController.m
//  BusinessApp
//
//  Created by Extremall on 11.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BADetailedNewsViewController.h"


@interface BADetailedNewsViewController ()

@end

@implementation BADetailedNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    
    _lblTitle.text = _news.title;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Загрузка новости";
    [[RequestManager sharedInstance] getDetailedNews:_news.newsIDValue completion:^(id result, NSError *error) {
        [hud hide:YES];
        [_webView loadHTMLString:_news.content baseURL:nil];
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
