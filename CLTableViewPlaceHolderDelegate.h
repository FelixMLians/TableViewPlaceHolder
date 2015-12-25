//
//  CLTableViewPlaceHolderDelegate.h
//  CLTableViewPlaceHolder
//
//  Created by YuanRong on 15/12/25.
//  Copyright © 2015年 FelixMLians. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CLTableViewPlaceHolderDelegate <NSObject>

@required
/*!
 @brief  make an empty overlay view when the tableView is empty
 @return an empty overlay view
 */
- (UIView *)makePlaceHolderView;

@end
