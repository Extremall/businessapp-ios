//
//  BAPhotosViewController.m
//  BusinessApp
//
//  Created by Extremall on 24.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAPhotosViewController.h"
#import "BAPhotoTableViewCell.h"

@interface BAPhotosViewController ()

@property (nonatomic, strong) NSArray *photos;

@end

@implementation BAPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[RequestManager sharedInstance] getPhotosWithCompletion:^(id result, NSError *error) {
        [hud hide:YES];
        self.photos = result;
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
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"photoCellID"];
    BAPhoto *photo = _photos[indexPath.row];
    [cell fill:photo];
    return cell;
}

@end
