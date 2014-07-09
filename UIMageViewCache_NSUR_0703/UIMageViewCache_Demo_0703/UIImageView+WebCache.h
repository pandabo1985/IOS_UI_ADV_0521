//
//  UIImageView+WebCache.h
//  UIMageViewCache_Demo_0703
//
//  Created by pan dabo on 14-7-3.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebCache)<NSURLConnectionDelegate>
-(void)setImageWithURL:(NSURL *)url;
@end
