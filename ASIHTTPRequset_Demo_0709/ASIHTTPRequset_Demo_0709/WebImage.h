//
//  WebImage.h
//  ASIHTTPRequset_Demo_0709
//
//  Created by pan dabo on 14-7-9.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequestDelegate.h"

@interface WebImage : UIImageView<ASIHTTPRequestDelegate>

-(void)setImageURL:(NSURL *)url;

@end
