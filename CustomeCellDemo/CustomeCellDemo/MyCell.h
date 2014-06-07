//
//  MyCell.h
//  CustomeCellDemo
//
//  Created by pan dabo on 14-6-7.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
{
    @private
    UILabel *_label;
}

@property(nonatomic,retain)NSString *data;

@end
