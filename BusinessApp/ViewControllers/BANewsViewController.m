//
//  BANewsViewController.m
//  BusinessApp
//
//  Created by Extremall on 11.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BANewsViewController.h"
#import "BANewsTableViewCell.h"
#import "BANews.h"
#import "BADetailedNewsViewController.h"

@interface BANewsViewController ()

@end

@implementation BANewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.news = [NSMutableArray array];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Загрузка новостей";
    [[RequestManager sharedInstance] getNewsWithCompletion:^(id result, NSError *error) {
        [hud hide:YES];
        self.news = result;
        [_tableView reloadData];
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

#pragma mark - Table View Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BANewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCellID"];
    BANews *news = self.news[indexPath.row];
    [cell fill:news];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BANews *news = self.news[indexPath.row];
    BADetailedNewsViewController *newsVC = [BADetailedNewsViewController create];
    newsVC.news = news;
    [self.navigationController pushViewController:newsVC animated:YES];
}

@end
