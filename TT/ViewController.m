//
//  ViewController.m
//  TT
//
//  Created by Zubco Pavel on 2/11/15.
//  Copyright (c) 2015 Zubco Pavel. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomView.h"
#import <Masonry.h>
#import "AnotherCustomView.h"
#import "UIView+TT.h"

static const CGSize kSmallSize           = {150, 70};
static const CGRect kTestFrame           = {50, 550, 300, 150};
static const UIEdgeInsets kContentInsets = {50, 0, 50, 0};

@interface ViewController ()

@property (weak, nonatomic) IBOutlet AnotherCustomView *storyBoardCustomView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraintCustomView;

@property (strong, nonatomic) AnotherCustomView *viewWithFrame;

@end

@implementation ViewController

#pragma mark - Lifecycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // view loaded from storyboard
    
    [self.storyBoardCustomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kContentInsets.top);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(kTestFrame.size);
    }];
    
    [self.storyBoardCustomView setNeedsDisplay];
    
    // view initialized with frame
    
    self.viewWithFrame = [[AnotherCustomView alloc] initWithFrame:kTestFrame];
    self.viewWithFrame.backgroundColor = [UIColor redColor];
    self.viewWithFrame.title = @"You aren't !";
    self.viewWithFrame.cornerRadius = 50;
    
    [self.view addSubview:self.viewWithFrame];
    
    [self.viewWithFrame mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(-kContentInsets.bottom);
        make.size.equalTo(self.storyBoardCustomView);
    }];
    
    // view initialized with CGRectZero frame
    
    AnotherCustomView *thirdView = [[AnotherCustomView alloc] init];
    thirdView.cornerRadius = 10;
    thirdView.title = @"Guys ?";
    thirdView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:thirdView];
    
    [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.size.mas_equalTo(kSmallSize);
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    CGRect bottomFrame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 70, CGRectGetWidth(self.view.frame), 70);
    AnotherCustomView *noConstraintsView = [[AnotherCustomView alloc] initWithFrame:bottomFrame];
    noConstraintsView.title = @"To be, or not to be...";
    
    [self.view addSubview:noConstraintsView];
    
    [self startCustomViewAnimation];
}

#pragma mark - Private -

- (void)startCustomViewAnimation
{
    CGFloat delta = 50;
    
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionAutoreverse animations:^{
        
        CGFloat newWidth  = kTestFrame.size.width - delta;
        CGFloat newHeight = kTestFrame.size.height + delta * 1.5;
        
        [self.storyBoardCustomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(newWidth, newHeight));
        }];
        
        [self.storyBoardCustomView layoutIfNeeded];
        [self.viewWithFrame layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [self.storyBoardCustomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(kTestFrame.size);
        }];

        [self.storyBoardCustomView layoutIfNeeded];
        [self.viewWithFrame layoutIfNeeded];
    }];
}

@end
