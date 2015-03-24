//
//  UIView+FrameHelper.m
//  Swipecast
//
//  Created by Dmitry Korolchenko on 21/01/14.
//  Copyright (c) 2014 Clothia. All rights reserved.
//

#import "UIView+FrameHelper.h"

#define SPINNER_TAG 27642372

@implementation UIView (FrameHelper)

- (void)updateFrame:(void (^)(CGRect *frame))code  {
	CGRect rect = self.frame;
	code(&rect);
	self.frame = rect;
}

- (void)setPosition:(CGPoint)position {
	CGRect frame = self.frame;
	frame.origin = position;
	self.frame   = frame;
}

- (void)setSize:(CGSize)size {
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

- (void)setLeft:(CGFloat)value {
	CGRect frame = self.frame;
	frame.origin.x = value;
	self.frame     = frame;
}

- (CGFloat)left {
	return self.frame.origin.x;
}

- (void)setTop:(CGFloat)value {
	CGRect frame = self.frame;
	frame.origin.y = value;
	self.frame     = frame;
}

- (CGFloat)top {
	return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)value {
	CGRect frame = self.frame;
	frame.size.width = value;
	self.frame       = frame;
}

- (CGFloat)width {
	return self.frame.size.width;
}

- (void)setHeight:(CGFloat)value {
	CGRect frame = self.frame;
	frame.size.height = value;
	self.frame        = frame;
}

- (CGFloat)height {
	return self.frame.size.height;
}

- (CGFloat)right {
	return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom {
	return self.frame.origin.y + self.frame.size.height;
}

- (void)removeAllSubviews {
    NSArray *subviews = self.subviews;
    for(UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

- (CGPoint)originRelativeToView: (UIView *)view {
    CGPoint point = view == self.superview ? CGPointZero : [self.superview originRelativeToView:view];
    CGPoint contentOffset = [self.superview isKindOfClass:[UIScrollView class]] ? ((UIScrollView *)self.superview).contentOffset : CGPointZero;
    return CGPointMake(self.left + point.x + contentOffset.x, self.top + point.y - contentOffset.y);
}

#pragma mark - Activity Indicators Methods

- (void)startLoadingSpinner {
    [self startLoadingSpinnerWithStyle:UIActivityIndicatorViewStyleWhite];
}

- (void)startLoadingSpinnerWithStyle:(UIActivityIndicatorViewStyle)style {
    UIActivityIndicatorView *spinner = (UIActivityIndicatorView *)[self viewWithTag:SPINNER_TAG];
    if(spinner == nil || spinner.activityIndicatorViewStyle != style) {
        [spinner removeFromSuperview];
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
        spinner.hidesWhenStopped = YES;
        spinner.tag = SPINNER_TAG;
        [self addSubview:spinner];
    }
    
    CGRect activityIndicatorBounds = spinner.bounds;
    float x = (self.frame.size.width - activityIndicatorBounds.size.width) / 2.0;
    float y = (self.frame.size.height - activityIndicatorBounds.size.height) / 2.0;
    spinner.frame = CGRectMake(x, y, activityIndicatorBounds.size.width, activityIndicatorBounds.size.height);
    
    [spinner startAnimating];
}

- (void)stopLoadingSpinner {
    UIActivityIndicatorView *spinner = (UIActivityIndicatorView *)[self viewWithTag:SPINNER_TAG];
    [spinner stopAnimating];
}

@end
