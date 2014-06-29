//
//  GraphicView.m
//  Graphic_Demo_0629
//
//  Created by pan dabo on 14-6-29.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "GraphicView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GraphicView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        _subView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_subView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
 - (void)drawRect:(CGRect)rect
 {
     CGContextRef cgcr= UIGraphicsGetCurrentContext();
     //设置画笔
     CGContextSetStrokeColorWithColor(cgcr, [UIColor redColor].CGColor);
     CGContextSetFillColorWithColor(cgcr, [UIColor greenColor].CGColor);
     CGContextSetLineWidth(cgcr, 2);
     CGContextMoveToPoint(cgcr, 10, 20);
     CGContextAddLineToPoint(cgcr, 200, 20);
    
     
     CGContextAddRect(cgcr, CGRectMake(10, 40, 60, 60));
     
//     CGContextDrawPath(cgcr, kCGPathFillStroke);
     
//      CGContextDrawPath(cgcr, kCGPathFill);
     
     CGContextAddCurveToPoint(cgcr, 50, 100, 100, 100, 100, 50);
     
      CGContextDrawPath(cgcr, kCGPathStroke);
     
     
     
//     self.layer.position
    CGMutablePathRef path =  CGPathCreateMutable();
     CGPathAddRect(path, NULL, CGRectMake(10, 40, 60, 60));
//     CGPathAddCurveToPoint(paht, <#const CGAffineTransform *m#>, <#CGFloat cp1x#>, <#CGFloat cp1y#>, <#CGFloat cp2x#>, <#CGFloat cp2y#>, <#CGFloat x#>, <#CGFloat y#>)
     CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
     animation.duration = 3;
     animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
     animation.repeatCount = 2;
     animation.path = path;
     
     [_subView.layer addAnimation:animation forKey:@"test"];
}


@end
