//
//  BAMenuViewController.m
//  BusinessApp
//
//  Created by Extremall on 14.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAMenuViewController.h"
#import <MBProgressHUD.h>
#import "RequestManager.h"
#import "BAMenuTableViewCell.h"
#import "BADetailDishViewController.h"

@interface BAMenuViewController ()


@end

@implementation BAMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadItems];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

- (void)loadItems
{
    if (self.items == nil) // we need to download items
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Загрузка...";
        if (self.parentItem != nil) // we need to download children
        {
            [[RequestManager sharedInstance] getAllItemsWithCompletion:^(id result, NSError *error) {
                [hud hide:YES];
                self.items = result;
                [self.tableView reloadData];
            }];
        }
        else // we need to download root elements
        {
            [[RequestManager sharedInstance] getAllItemsWithCompletion:^(id result, NSError *error) {
                [hud hide:YES];
                self.items = result;
                [self.tableView reloadData];
            }];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAItem *item = self.items[indexPath.row];
    
    BAMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuCellID"];
    [cell fill:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAItem *item = self.items[indexPath.row];
    
    if (item.isFolderValue)
    {
        BAMenuViewController *menuVC = [BAMenuViewController create];
        menuVC.items = [item.children allObjects];
        [self.navigationController pushViewController:menuVC animated:YES];
    }
    else
    {
        BADetailDishViewController *detailVC = [BADetailDishViewController create];
        detailVC.item = item;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

@end
