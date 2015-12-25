//
//  UITableView+CLTableViewPlaceHolder.m
//  CLTableViewPlaceHolder
//
//  Created by YuanRong on 15/12/25.
//  Copyright © 2015年 FelixMLians. All rights reserved.
//

#import "UITableView+CLTableViewPlaceHolder.h"

#import "CLTableViewPlaceHolderDelegate.h"

#import <objc/runtime.h>

@interface UITableView ()

@property (nonatomic, strong) UIView *placeHolderView;

@end

@implementation UITableView (CLTableViewPlaceHolder)

- (void)cl_reloadData {
    [self reloadData];
    [self cl_checkEmpty];
}

- (void)cl_checkEmpty {
    BOOL isEmpty = YES;
    self.scrollEnabled = YES;
    
    id<UITableViewDataSource> src = self.dataSource;
    NSInteger sections = 1;
    if ([src respondsToSelector: @selector(numberOfSectionsInTableView:)]) {
        sections = [src numberOfSectionsInTableView:self];
    }
    for (int i = 0; i<sections; ++i) {
        NSInteger rows = [src tableView:self numberOfRowsInSection:i];
        if (rows) {
            isEmpty = NO;
        }
    }
    if (!isEmpty != !self.placeHolderView) {
        if (isEmpty) {
            
            if ([self respondsToSelector:@selector(makePlaceHolderView)]) {
                self.placeHolderView = [self performSelector:@selector(makePlaceHolderView)];
            } else if ( [self.delegate respondsToSelector:@selector(makePlaceHolderView)]) {
                self.placeHolderView = [self.delegate performSelector:@selector(makePlaceHolderView)];
            } else {
                NSString *selectorName = NSStringFromSelector(_cmd);
                NSString *reason = [NSString stringWithFormat:@"You must implement makePlaceHolderView method in your custom tableView or its delegate class if you want to use %@", selectorName];
                @throw [NSException exceptionWithName:NSGenericException
                                               reason:reason
                                             userInfo:nil];
            }
            self.placeHolderView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            [self addSubview:self.placeHolderView];
        } else {
            [self.placeHolderView removeFromSuperview];
            [[self.placeHolderView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            self.placeHolderView = nil;
        }
    } else if (isEmpty) {
        // Make sure it is still above all siblings.
        [self.placeHolderView removeFromSuperview];
        [[self.placeHolderView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self addSubview:self.placeHolderView];
    }
}

#pragma mark - Accessor

- (UIView *)placeHolderView {
    return objc_getAssociatedObject(self, @selector(placeHolderView));
}

- (void)setPlaceHolderView:(UIView *)placeHolderView {
    objc_setAssociatedObject(self, @selector(placeHolderView), placeHolderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
