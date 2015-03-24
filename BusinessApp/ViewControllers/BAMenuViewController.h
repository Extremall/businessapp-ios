//
//  BAMenuViewController.h
//  BusinessApp
//
//  Created by Extremall on 14.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAItem.h"
#import "BABaseViewController.h"

@interface BAMenuViewController : BABaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) BAItem *parentItem;

@end
