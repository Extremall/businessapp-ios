//
//  BAPhotosViewController.h
//  BusinessApp
//
//  Created by Extremall on 24.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BABaseViewController.h"

@interface BAPhotosViewController : BABaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
