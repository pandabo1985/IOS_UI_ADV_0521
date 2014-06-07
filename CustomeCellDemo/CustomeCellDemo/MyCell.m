//
//  MyCell.m
//  CustomeCellDemo
//
//  Created by pan dabo on 14-6-7.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MyCell.h"


@interface MyCell ()
-(void)initSubViews;
@end

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

-(void)initSubViews
{
    _label =[[UILabel alloc] initWithFrame:CGRectZero];
    _label.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_label];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _label.frame = CGRectMake( 80, 0,160, 80);
    _label.text = self.data;
    NSLog(@"textlable >>>>>%@",NSStringFromCGRect(self.textLabel.frame));

}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
