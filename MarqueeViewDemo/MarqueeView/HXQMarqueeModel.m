//
//  HXQMarqueeModel.m
//  hxquan
//
//  Created by Tiny on 2018/3/15.
//  Copyright © 2018年 Tiny. All rights reserved.
//

#import "HXQMarqueeModel.h"

@implementation HXQMarqueeModel

-(void)setTitle:(NSString *)title{
    
    _title = title;
    
    //拿到title 计算宽度
    self.titleWidth = [self widthForTitle];
    self.width = 10 + 30 + 5 + self.titleWidth + 10;
}

-(CGFloat)widthForTitle{
    return [self.title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width;
}

-(BOOL)isEqual:(id)object{
    if (self == object) {
        return YES;
    }
    if ([object isKindOfClass:[self class]]) {
        HXQMarqueeModel *obj = (HXQMarqueeModel *)object;
        
        return self.width == obj.width &&
        [self.userImg isEqualToString:obj.userImg]&&
        [self.title isEqualToString:obj.title]&&
        self.titleWidth == obj.titleWidth ;
    }else{
        return NO;
    }
}

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
