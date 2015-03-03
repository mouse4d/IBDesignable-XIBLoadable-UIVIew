//
//  UIView+TT.h
//  TT
//
//  Created by Zubco Pavel on 2/18/15.
//  Copyright (c) 2015 Zubco Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TT)

- (void)tt_logViewHierarchy;
- (void)tt_applyConstraintsWithTemplateView:(UIView *)view;

- (BOOL)tt_haveSubviews;
+ (instancetype)tt_loadFromXib;

@end
