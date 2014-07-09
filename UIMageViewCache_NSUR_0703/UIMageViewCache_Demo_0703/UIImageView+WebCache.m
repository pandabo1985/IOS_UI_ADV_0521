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
//   dispatch_queue_t queue=  dispatch_queue_create("loadingImage", NULL);
//    
//    dispatch_async(queue, ^{
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:data];
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            self.image = image;
//        });
//    });
    
    //同步请求
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setHTTPMethod:@"GET"];
//    [request setURL:url];
//    [request setTimeoutInterval:60];
//    NSURLResponse *response;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
//    UIImage *image = [UIImage imageWithData:data];
//    self.image = image;
    NSMutableURLRequest *requset = [[NSMutableURLRequest alloc] init];
    [requset setHTTPMethod:@"GET"];
    [requset setURL:url];
    [requset setTimeoutInterval:60];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:requset queue:queue completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError){
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
              self.image = image;
        });
      
    }];
//    [NSURLConnection connectionWithRequest:requset delegate:self];
}

@end
