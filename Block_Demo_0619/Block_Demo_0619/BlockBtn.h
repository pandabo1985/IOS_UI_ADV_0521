//
//  BlockBtn.h
//  Block_Demo_0619
//
//  Created by pan dabo on 14-6-21.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlockBtn;

typedef void(^TouchBlock) (BlockBtn *);

@interface BlockBtn : UIButton

@property(nonatomic,copy)TouchBlock block;

@end
