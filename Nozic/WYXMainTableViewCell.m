//
//  WYXMainTableViewCell.m
//  Nozic
//
//  Created by Troy-Wu on 23/03/2017.
//  Copyright © 2017 com.LittleTroy. All rights reserved.
//

#import "WYXMainTableViewCell.h"

@interface WYXMainTableViewCell ()

/** Cell的图标 */
@property (nonatomic,strong) UIButton *btnView;
/** 声音的Label */
@property (nonatomic,strong)  UILabel *nameLabel;
/** 声音大小的滑块 */
@property (nonatomic,strong)  UISlider *volumeSlider;



@end

@implementation WYXMainTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
//    static NSString *identifier = NSStringFromClass([self class]);
//    self =
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建自己的自定义界面
        
        //创建可以点击的按钮
        UIButton *btn = [[UIButton alloc] init];
        [self.contentView addSubview:btn];
        self.btnView = btn;
        
        //创建一个Label
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        self.nameLabel = label;
        
        //创建一个控制音量的滑块
        UISlider *slider = [[UISlider alloc] init];
        [self.contentView addSubview:slider];
        self.volumeSlider = slider;
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
