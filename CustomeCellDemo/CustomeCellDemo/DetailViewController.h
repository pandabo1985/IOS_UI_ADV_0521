//
//  DetailViewController.h
//  CustomeCellDemo
//
//  Created by pan dabo on 14-6-7.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController
{
    @private
    NSArray *_listArray;
}
@property(nonatomic,assign)  kTableViewCellType type;
@end
