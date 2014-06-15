//
//  ToucheWindow.m
//  ToucheEvent_0615
//
//  Created by pan dabo on 14-6-15.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "ToucheWindow.h"

@implementation ToucheWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)sendEvent:(UIEvent *)event{
    [super sendEvent:event];
    NSLog(@"==sendEvent=ToucheWindow.h==");
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"=touchesBegan==ToucheWindow==");
    [self.nextResponder touchesBegan:touches withEvent:event];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
