//
//  ViodeCell.m
//  Green
//
//  Created by qianfeng on 15/8/21.
//  Copyright (c) 2015年 张凯凯. All rights reserved.
//

#import "ViodeCell.h"
#import "UIImageView+WebCache.h"

@implementation ViodeCell

- (void)awakeFromNib {
    // Initialization code
    self.Viodeimage.layer.masksToBounds = YES;
    self.Viodeimage.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showVoideWithModel:(zkkBaseModel *)model{
    
    self.titlelable.text=model.text;
    [self.Viodeimage sd_setImageWithURL:[NSURL URLWithString:model.bimageuri] placeholderImage:[UIImage imageNamed:@"barck"]];
    
}
@end
