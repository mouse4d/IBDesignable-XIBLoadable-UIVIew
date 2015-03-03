//
//  MyCustomView.h
//  TT
//
//  Created by Zubco Pavel on 2/17/15.
//  Copyright (c) 2015 Zubco Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface MyCustomView : UIView

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable CGFloat bottom;

@property (strong, nonatomic) NSString *title;

@end


//  APP running      Debug Selected Views

//============================================

//  initWithCoder:  initWithFrame:
//    ┋                   ┋
//    ┋                   ⬇︎
//    ┋             prepareForInterfaceBuilder
//    ┋                   ┋
//    ┋                   ┋
//    ⬇︎                  ⬇︎
//  drawRect:          drawRect:
