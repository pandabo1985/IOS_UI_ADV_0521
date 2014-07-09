//
//  WebImage.m
//  ASIHTTPRequset_Demo_0709
//
//  Created by pan dabo on 14-7-9.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "WebImage.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"

@implementation WebImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setImageURL:(NSURL *)url
{
//    [self syncImage:url];
//    [self asyncImage:url];
//    [self asyncImageBlock:url];
    [self asyncImageData:url];
}

-(void)asyncImageData:(NSURL *)url{
    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    
    //异步
    request.delegate = self;
    [request setCompletionBlock:^{
        NSData *data = request.responseData;
        UIImage *image = [UIImage imageWithData:data];
        self.image = image;
    }];
    
    [request setFailedBlock:^{
        NSLog(@"请求网络出错：%@",request.error);
    }];
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    ASIDownloadCache *cache = [[ASIDownloadCache alloc] init];
    [cache setStoragePath:cachePath];
    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
//    request.cacheStoragePolicy = ASICachePermanentlyCacheStoragePolicy;
     request.cacheStoragePolicy = ASICacheForSessionDurationCacheStoragePolicy;
    request.downloadCache = cache;
    
    [request startAsynchronous];
}

-(void)asyncImageBlock:(NSURL *)url{
    ASIHTTPRequest *request =[ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    
    //异步
    request.delegate = self;
    [request setCompletionBlock:^{
        NSData *data = request.responseData;
        UIImage *image = [UIImage imageWithData:data];
        self.image = image;
    }];
    
    [request setFailedBlock:^{
       NSLog(@"请求网络出错：%@",request.error);
    }];
    
    [request startAsynchronous];
}

-(void)asyncImage:(NSURL *)url{
    ASIHTTPRequest *request =[ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    
    //异步
    request.delegate = self;
    [request startAsynchronous];
}

#pragma mark ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSData *data = request.responseData;
    self.image = [UIImage imageWithData:data];
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
      NSLog(@"请求网络出错：%@",request.error);
}
-(void)syncImage:(NSURL *)url{
    ASIHTTPRequest *request =[ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    
    //同步请求
    [request startSynchronous];
    NSError *error = request.error;
    if (error==nil) {
        NSData *data = request.responseData;
        UIImage *image = [UIImage imageWithData:data];
        self.image = image;
    }else {
        NSLog(@"请求网络出错：%@",error);
    }
}

@end
