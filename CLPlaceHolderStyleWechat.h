//
//  CLPlaceHolderStyleWechat.h
//  TestDemo1231
//
//  Created by YuanRong on 16/1/6.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLPlaceHolderStyleWechatDelegate <NSObject>

@required

- (void)emptyOverlayClicked:(id)sender;

@end

@interface CLPlaceHolderStyleWechat : UIView

@property (nonatomic, weak) id<CLPlaceHolderStyleWechatDelegate> delegate;

@end
