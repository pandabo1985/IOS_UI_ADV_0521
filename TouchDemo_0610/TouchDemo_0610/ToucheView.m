//
//  ToucheView.m
//  TouchDemo_0610
//
//  Created by pan dabo on 14-6-10.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "ToucheView.h"

@implementation ToucheView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.multipleTouchEnabled = YES;
        movieView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        movieView.backgroundColor =[UIColor redColor];
        [self addSubview:movieView];
       
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    
    UITouch *touche = [touches anyObject];
    NSInteger tapCount = touche.tapCount;
    NSLog(@"%d",tapCount);
    if (tapCount == 1) {
        [self performSelector:@selector(singleTap) withObject:nil afterDelay:0.5];
    }else if(tapCount == 2){
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleTap) object:nil];
        [self doubleTap];
    }
    
    CGPoint point = [touche locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(point));
}
-(void)singleTap
{
    NSLog(@"单击");
}
-(void)doubleTap
{
    NSLog(@"双击");
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
    UITouch *touche = [touches anyObject];
    CGPoint point = [touche locationInView:self];
    CGRect frame = movieView.frame;
    frame.origin = point;
    movieView.frame = frame;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled");
}

@end
