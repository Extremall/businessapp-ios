//
//  BAAnouncesViewController.m
//  BusinessApp
//
//  Created by Extremall on 12.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAAnnouncesViewController.h"
#import "BAAnnounceTableViewCell.h"
#import "BADetailedAnnounceViewController.h"

@interface BAAnnouncesViewController ()

@end

@implementation BAAnnouncesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.announces = [NSMutableArray array];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Загрузка акций";
    [[RequestManager sharedInstance] getAnnouncesWithCompletion:^(id result, NSError *error) {
        [hud hide:YES];
        self.announces = result;
        [_tableView reloadData];
    }];
    
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

#pragma mark - Table View Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.announces.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAAnnounceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"announceCellID"];
    BAAnnounce *announce = self.announces[indexPath.row];
    [cell fill:announce];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAAnnounce *announce = self.announces[indexPath.row];
    BADetailedAnnounceViewController *announceVC = [BADetailedAnnounceViewController create];
    announceVC.announce = announce;
    [self.navigationController pushViewController:announceVC animated:YES];
}

@end
