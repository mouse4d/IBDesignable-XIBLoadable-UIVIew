//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - Lifecycle -

- (instancetype)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    BOOL haveSubviews = [self tt_haveSubviews];
    
    if (!haveSubviews) {
        
        ___FILEBASENAMEASIDENTIFIER___ *view = [___FILEBASENAMEASIDENTIFIER___ tt_loadFromXib];
        
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = self.backgroundColor;
        view.frame = self.frame;
        
        [view tt_applyConstraintsWithTemplateView:self];
        
#ifndef TARGET_INTERFACE_BUILDER
        return view;
#endif
    }
    
    [self privateInitialization];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    ___FILEBASENAMEASIDENTIFIER___ *view = [___FILEBASENAMEASIDENTIFIER___ tt_loadFromXib];
    
    if (view) {
        
        view.frame = frame;
    }
    self = view;
    
    [self privateInitialization];
    
    return self;
}

#pragma mark - Custom Accessors -


#pragma mark - IBActions -


#pragma mark - Public


#pragma mark - Private -

- (void)privateInitialization
{
   
}

@end
