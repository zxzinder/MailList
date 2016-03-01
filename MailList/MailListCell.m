//
//  MailListCell.m
//  MailList
//
//  Created by MacMini on 16/2/25.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import "MailListCell.h"
#import "MailListModel.h"
#import "MailListFrame.h"

@interface MailListCell()


@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *telImageView;

@property (nonatomic, strong) UIButton *telBtn;

@property (nonatomic, strong) UIView *middleView;

@property (nonatomic, strong) UIImageView *emailImageView;

@property (nonatomic, strong) UIButton *emailBtn;

@property (nonatomic, strong) UIView *hideView;

@end

@implementation MailListCell


-(UILabel *)nameLabel{
    
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font =[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

-(UIImageView *)telImageView{
    
    if (!_telImageView) {
        _telImageView = [[UIImageView alloc] init];
        [self.hideView addSubview:_telImageView];
    }
    return _telImageView;
    
}

-(UIButton *)telBtn{
    
    if (!_telBtn) {
        _telBtn = [[UIButton alloc] init];
        [self.hideView addSubview:_telBtn];
    }
    
    return _telBtn;
    
}

-(UIView *)middleView{
    
    if (!_middleView) {
        _middleView = [[UIView alloc] init];
        [self.hideView addSubview:_middleView];
    }
    
    return _middleView;
    
}

-(UIImageView *)emailImageView{
    
    if (!_emailImageView) {
        _emailImageView = [[UIImageView alloc] init];
        [self.hideView addSubview:_emailImageView];
    }
    
    return _emailImageView;
    
}

-(UIButton *)emailBtn{
    
    if (!_emailBtn) {
        _emailBtn = [[UIButton alloc] init];
        [self.hideView addSubview:_emailBtn];
    }
    
    return _emailBtn;
    
}

-(UIView *)hideView{
    
    if (!_hideView) {
        _hideView = [[UIView alloc] init];
        [self.contentView addSubview:_hideView];
    }
    return _hideView;
    
}

-(void)setMailframe:(MailListFrame *)mailframe{
    
    _mailframe = mailframe;
    
    [self settingData];
    [self settingFrame];
    
}

-(void)settingData{
    
    MailListModel *mailList = self.mailframe.mailList;
    
    self.nameLabel.text = mailList.name;
    self.telImageView.image = [UIImage imageNamed:@"phone"];
    [self.telBtn setTitle:mailList.phone forState:UIControlStateNormal];
    [self.telBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    self.middleView.backgroundColor = [UIColor grayColor];
    self.emailImageView.image = [UIImage imageNamed:@"Group"];
    
    [self.emailBtn setTitle:mailList.email forState:UIControlStateNormal];
    [self.emailBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
  
    if (self.isSelected) {
        self.hideView.backgroundColor = [UIColor greenColor];
        self.hideView.hidden = NO;
    }else{
        self.hideView.backgroundColor = [UIColor redColor];
        self.hideView.hidden = YES;
    }
}

-(void)settingFrame{
   
    self.nameLabel.frame = self.mailframe.nameF;
    self.telImageView.frame = self.mailframe.phoneIconF;
    self.telBtn.frame = self.mailframe.phoneF;
    self.middleView.frame = self.mailframe.middleViewF;
    self.emailImageView.frame = self.mailframe.emailIconF;
    self.emailBtn.frame = self.mailframe.emailF;
    
    self.hideView.frame = self.mailframe.hideViewF;
}




@end
