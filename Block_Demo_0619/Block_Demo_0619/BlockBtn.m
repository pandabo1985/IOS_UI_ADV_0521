//
//  BlockBtn.m
//  Block_Demo_0619
//
//  Created by pan dabo on 14-6-21.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "BlockBtn.h"

@implementation BlockBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)clickAction{
//    self.block(self);
    _block(self);
}

-(void)dealloc{
    [super dealloc];
    [self.block release];
    
}
@end
