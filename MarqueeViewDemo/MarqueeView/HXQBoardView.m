//
//  HXQBoardView.m
//  hxquan
//
//  Created by Tiny on 2018/3/2.
//  Copyright © 2018年 Tiny. All rights reserved.
//

#import "HXQBoardView.h"
#import "HXQMarqueeModel.h"
#import "UIImageView+WebCache.h"

@interface HXQBoardView ()

@property (nonatomic, strong) HXQMarqueeModel *model;

@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UILabel *titleLb;

@end
@implementation HXQBoardView

-(instancetype)initWithFrame:(CGRect)frame Model:(HXQMarqueeModel *)model{
    if (self = [super initWithFrame:frame]) {
        self.model = model;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 30, 30)];
    self.headImgView.layer.masksToBounds = YES;
    self.headImgView.layer.cornerRadius = 15;
    [self addSubview:self.headImgView];
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:self.model.userImg] placeholderImage: [UIImage imageNamed:@"UserBitmap"]];
    
    self.titleLb = [[UILabel alloc] initWithFrame:CGRectMake(45, 7, self.model.titleWidth, 30)];
    self.titleLb.font = [UIFont systemFontOfSize:14];
    self.titleLb.textColor = [UIColor blackColor];
    self.titleLb.text = self.model.title;
    [self addSubview:self.titleLb];
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClickAction)]];
}

-(void)itemClickAction{
    if (self.boardItemClick) {
        self.boardItemClick(self.model);
    }
}
@end
