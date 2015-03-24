//
//  BAAnouncesViewController.h
//  BusinessApp
//
//  Created by Extremall on 12.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BABaseViewController.h"

@interface BAAnnouncesViewController : BABaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *announces;

@end
