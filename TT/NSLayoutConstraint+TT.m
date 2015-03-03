//
//  NSLayoutConstraint+TT.m
//  TT
//
//  Created by Zubco Pavel on 2/26/15.
//  Copyright (c) 2015 Zubco Pavel. All rights reserved.
//

#import "NSLayoutConstraint+TT.h"

@implementation NSLayoutConstraint (TT)

- (NSLayoutConstraint *)tt_constraintWithFirstView:(id)firstView secondView:(id)secondView
{
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:self.firstAttribute
                                        relatedBy:self.relation
                                           toItem:secondView
                                        attribute:self.secondAttribute
                                       multiplier:self.multiplier
                                         constant:self.constant];
}

@end
