//
//  MyDataServer.h
//  NSURLData_Demo_0708
//
//  Created by pan dabo on 14-7-8.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^Completion)(id);

@interface MyDataServer : NSObject

+(void)getWetheaData:(NSDictionary *)params block:(Completion)block;

@end
