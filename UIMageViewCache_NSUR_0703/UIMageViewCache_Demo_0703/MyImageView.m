//
//  MyImageView.m
//  UIMageViewCache_Demo_0703
//
//  Created by pan dabo on 14-7-8.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setMyImageWithURL:(NSURL *)url{
    NSMutableURLRequest *requset = [[NSMutableURLRequest alloc] init];
    [requset setHTTPMethod:@"GET"];
    [requset setURL:url];
    [requset setTimeoutInterval:60];

    self.data = [NSMutableData data];
    [NSURLConnection connectionWithRequest:requset delegate:self];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"data===didReceiveData");
    [self.data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
     NSLog(@"data===connectionDidFinishLoading");
    UIImage *image =[UIImage imageWithData:self.data];
    self.image = image;
}
@end
