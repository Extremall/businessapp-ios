//
//  BANewsViewController.h
//  BusinessApp
//
//  Created by Extremall on 11.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BABaseViewController.h"

@interface BANewsViewController : BABaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *news;

@end
