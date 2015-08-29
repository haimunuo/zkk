//
//  newsTableViewCell.m
//  Green
//
//  Created by qianfeng on 15/8/14.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import "newsTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation newsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)newsShowWithModel:(zkkBaseModel *)model{
    self.titlelable.text=model.title;
     self.contentlable.text=model.content;
    self.pubtimelable.text=model.pubtime;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.img]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
