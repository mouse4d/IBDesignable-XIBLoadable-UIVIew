//
//  MyCustomView.m
//  TT
//
//  Created by Zubco Pavel on 2/17/15.
//  Copyright (c) 2015 Zubco Pavel. All rights reserved.
//

#import "MyCustomView.h"
#import <Masonry.h>

@interface MyCustomView ()

@property (strong, nonatomic) UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *singleButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomPaddingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;

@end

@implementation MyCustomView

#pragma mark - Lifecycle -

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self loadSubviews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self loadSubviews];
    }
    
    return self;
}

#pragma mark - Custom Accessors -

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    super.backgroundColor = backgroundColor;
    self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setBottom:(CGFloat)bottom
{
    _bottom = bottom;
    self.bottomPaddingConstraint.constant = bottom;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    [self.singleButton setTitle:title forState:UIControlStateNormal];
}

#pragma mark - Private -

- (void)loadSubviews
{
    self.contentView = [[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;
    self.backgroundColor = self.contentView.backgroundColor;
    
    [self addSubview:self.contentView];
    
    // 'pin' self.contentView to self - margins
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
