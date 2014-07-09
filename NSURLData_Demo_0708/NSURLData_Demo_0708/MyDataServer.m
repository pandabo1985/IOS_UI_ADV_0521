//
//  MyDataServer.m
//  NSURLData_Demo_0708
//
//  Created by pan dabo on 14-7-8.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MyDataServer.h"
#import "MyRequest.h"
#import "NSString+URLEncoding.h"
//"www.weather.com.cn/data/sk/101010300.html
//#define BASE_URL  @"www.weather.com.cn/data/sk/"
#define BASE_URL @"http://pic26.nipic.com/20121221/7447430_105636426000_2.jpg"
@implementation MyDataServer

+(void)getWetheaData:(NSDictionary *)params block:(Completion)block
{
    NSString *cityCode = [params objectForKey:@"code"];
//    NSString *urlString = [BASE_URL stringByAppendingFormat:@"%@.html",cityCode];
    
//    NSLog(@"urlString == %@",urlString);
//    urlString = [urlString URLDecodedString];
    MyRequest *request = [MyRequest requestWithURL:[NSURL URLWithString:BASE_URL]];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:60];
    request.block = ^(NSData *data){
//        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"dataString == %@",dataString);
//        id ret = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        block(data);
    };
    [request startAsync];
}

@end
