//
//  MyRequest.m
//  NSURLData_Demo_0708
//
//  Created by pan dabo on 14-7-8.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MyRequest.h"

@implementation MyRequest

-(void)startAsync{
    self.connection = [NSURLConnection connectionWithRequest:self delegate:self];
}

-(void)cancel
{
    [self.connection cancel];
}

#pragma mark NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    self.block(_data);
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"请求网络出错：%@",error);
}
@end
