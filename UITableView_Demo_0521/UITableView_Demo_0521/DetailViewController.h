//
//  DetailViewController.h
//  UITableView_Demo_0521
//
//  Created by pan dabo on 14-5-25.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDataSource>
{
@private
    UITableView *_tableView;
    //    NSArray *_listArray; 不需要对外公开。
}

@property(nonatomic,retain) NSArray *listArray;

@end
