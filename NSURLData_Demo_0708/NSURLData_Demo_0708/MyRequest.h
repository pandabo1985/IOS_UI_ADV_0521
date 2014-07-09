//
//  MyRequest.h
//  NSURLData_Demo_0708
//
//  Created by pan dabo on 14-7-8.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishLoadBlock)(NSData *);

@interface MyRequest : NSMutableURLRequest<NSURLConnectionDataDelegate>

@property(nonatomic,retain)NSMutableData *data;
@property(nonatomic,retain)NSURLConnection *connection;
@property(nonatomic,copy)FinishLoadBlock block;

-(void)startAsync;

-(void)cancel;
@end
