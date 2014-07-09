//
//  MyImageView.h
//  UIMageViewCache_Demo_0703
//
//  Created by pan dabo on 14-7-8.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyImageView : UIImageView
@property(nonatomic,retain) NSMutableData *data;
-(void)setMyImageWithURL:(NSURL *)url;
@end
