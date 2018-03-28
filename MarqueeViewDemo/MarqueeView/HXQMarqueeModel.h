//
//  HXQMarqueeModel.h
//  hxquan
//
//  Created by Tiny on 2018/3/15.
//  Copyright © 2018年 Tiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HXQMarqueeModel : NSObject

@property (nonatomic, copy) NSString *title;  //文字内容

@property (nonatomic , copy)NSString *userImg;  //头像

@property (nonatomic, assign) CGFloat titleWidth; //文字宽度

@property (nonatomic, assign) CGFloat width;  //视图总宽度

- (instancetype)initWithDictionary:(NSDictionary *)dict;


@end
