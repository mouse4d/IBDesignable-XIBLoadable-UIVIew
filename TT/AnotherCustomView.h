//
//  AnotherCustomView.h
//  TT
//
//  Created by Zubco Pavel on 2/18/15.
//  Copyright (c) 2015 Zubco Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface AnotherCustomView : UIView

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable CGFloat titleTopPadding;
@property (strong, nonatomic) IBInspectable NSString *title;

@end