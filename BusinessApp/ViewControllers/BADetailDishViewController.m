//
//  BADetailDishViewController.m
//  BusinessApp
//
//  Created by Extremall on 28.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BADetailDishViewController.h"

@interface BADetailDishViewController ()

@end

@implementation BADetailDishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lblTitle.text = _item.name;
    [_imgDish sd_setImageWithURL:[NSURL URLWithString:_item.imageURL] placeholderImage:nil];
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
