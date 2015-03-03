//
//  AnotherCustomView.m
//  TT
//
//  Created by Zubco Pavel on 2/18/15.
//  Copyright (c) 2015 Zubco Pavel. All rights reserved.
//

#import "AnotherCustomView.h"
#import "UIView+TT.h"

@interface AnotherCustomView ()

@property (weak, nonatomic) IBOutlet UIButton *singleButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraintTitleLabel;

@end

@implementation AnotherCustomView

#pragma mark - Lifecycle -

- (instancetype)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    BOOL haveSubviews = [self tt_haveSubviews];
    
    if (!haveSubviews) {
        
        // 1
        AnotherCustomView *view = [AnotherCustomView tt_loadFromXib];
        
        // 2
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = self.backgroundColor;
        view.frame = self.frame;
        
        // 3
        [view tt_applyConstraintsWithTemplateView:self];
        
        // 4
        self = view;
        
        // 5
        [self privateInitialization];
        
#ifndef TARGET_INTERFACE_BUILDER
        return view;
#endif
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    // 1
    AnotherCustomView *view = [AnotherCustomView tt_loadFromXib];
    
    if (view) {
         // 2
        view.frame = frame;
    }
    // 3
    self = view;
    
    // 4
    [self privateInitialization];
    
    return self;
}

#pragma mark - Custom Accessors -

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

- (void)setTitleTopPadding:(CGFloat)titleTopPadding
{
    _titleTopPadding = titleTopPadding;
    
    self.topConstraintTitleLabel.constant = titleTopPadding;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    [self.singleButton setTitle:title forState:UIControlStateNormal];
}

#pragma mark - Private -

- (void)privateInitialization
{
    /**
     here you are doing common, view customization stuff
     THAT you CAN'T do in .xib
     by using default controls & constraints
    **/
    
    /**
     If work here is too expensive, interface builder can throw an error like this:
    
     IB Designables: Failed to render instance of AnotherCustomView: 
     Rendering the view took longer than 200 ms.
     Your drawing code may suffer from slow performance.
    **/
}

@end

