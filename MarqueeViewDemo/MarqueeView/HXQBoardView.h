//
//  HXQBoardView.h
//  hxquan
//
//  Created by Tiny on 2018/3/2.
//  Copyright © 2018年 Tiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HXQMarqueeModel;
@interface HXQBoardView : UIView

-(instancetype)initWithFrame:(CGRect)frame Model:(HXQMarqueeModel *)model;

@property (nonatomic, copy) void (^boardItemClick)(HXQMarqueeModel *model);

@end
