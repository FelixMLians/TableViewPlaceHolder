//
//  UITableView+CLTableViewPlaceHolder.h
//  CLTableViewPlaceHolder
//
//  Created by YuanRong on 15/12/25.
//  Copyright © 2015年 FelixMLians. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CLTableViewPlaceHolder)

/*!
 @brief just use this method to replace `reloadData` ,and it can help you to add or remove place holder view automatically
 @attention this method has already reload the tableView,so do not reload tableView any more.
 */
- (void)cl_reloadData;

@end
