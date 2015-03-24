//
//  BAFeedbackViewController.h
//  BusinessApp
//
//  Created by Extremall on 15.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BABaseScrollViewController.h"

@interface BAFeedbackViewController : BABaseScrollViewController

@property (nonatomic, weak) IBOutlet UITextField *txtName;
@property (nonatomic, weak) IBOutlet UITextView *txtFeedback;

- (IBAction)btnSend_Click:(id)sender;

@end
