//
//  UIImageView+WebCache.m
//  UIMageViewCache_Demo_0703
//
//  Created by pan dabo on 14-7-3.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "UIImageView+WebCache.h"

@implementation UIImageView (WebCache)

-(void)setImageWithURL:(NSURL *)url{
   dispatch_queue_t queue=  dispatch_queue_create("loadingImage", NULL);
    
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.image = image;
        });
    });
}

@end
