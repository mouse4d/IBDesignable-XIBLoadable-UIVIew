//
//  UIView+TT.m
//  TT
//
//  Created by Zubco Pavel on 2/18/15.
//  Copyright (c) 2015 Zubco Pavel. All rights reserved.
//

#import "UIView+TT.h"
#import "NSLayoutConstraint+TT.h"

@implementation UIView (TT)

- (void)tt_logViewHierarchy
{
    NSLog(@"%@ -> %@ (%@)\n", NSStringFromClass([self.superview class]), NSStringFromClass([self class]), NSStringFromCGRect(self.frame));
    
    for (UIView *subview in self.subviews) {
        [subview tt_logViewHierarchy];
    }
}

- (void)tt_applyConstraintsWithTemplateView:(UIView *)view
{
    if (self == nil || view == nil) {
        return;
    }
    
    for (NSLayoutConstraint *constraint in view.constraints) {
        
        id firstItem = constraint.firstItem;
        id secondItem = constraint.secondItem;
        
        if (firstItem == view) {
            firstItem = self;
        }
        
        if (secondItem == view) {
            secondItem = self;
        }
        
        // in case is invalid constraint, probably is a bug in xcode
        // when you had a IBOutlet attached to the constraint
        if (firstItem == nil && secondItem == nil) {
            continue;
        }
        
        NSLayoutConstraint *newConstraint = [constraint tt_constraintWithFirstView:firstItem secondView:secondItem];
        
        [self addConstraint:newConstraint];
    }
}

- (BOOL)tt_haveSubviews
{
    return (self.subviews.count == 0) ? NO : YES;
}

+ (instancetype)tt_loadFromXib
{
    UIView *customView = [[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;
    
    // make sure customView is not nil or the wrong class!
    if ([customView isKindOfClass:[self class]]) {
        return customView;
    } else {
        return nil;
    }
}

@end
