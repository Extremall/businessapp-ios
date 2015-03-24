//
//  UIView+FrameHelper.h
//  Swipecast
//
//  Created by Dmitry Korolchenko on 21/01/14.
//  Copyright (c) 2014 Clothia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameHelper)

- (void) updateFrame:(void (^)(CGRect *frame))code;

- (void)setPosition:(CGPoint)position;
- (void)setSize:(CGSize)size;

- (void)setLeft:(CGFloat)value;
- (CGFloat)left;

- (void)setTop:(CGFloat)value;
- (CGFloat)top;

- (void)setWidth:(CGFloat)value;
- (CGFloat)width;

- (void)setHeight:(CGFloat)value;
- (CGFloat)height;

- (CGFloat)right;
- (CGFloat)bottom;

- (CGPoint)originRelativeToView: (UIView *)view;

- (void)startLoadingSpinner;
- (void)startLoadingSpinnerWithStyle: (UIActivityIndicatorViewStyle)style;
- (void)stopLoadingSpinner;

@end
