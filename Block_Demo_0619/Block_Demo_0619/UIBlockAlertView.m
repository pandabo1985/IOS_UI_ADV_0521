//
//  BlockAlertView.m
//  Block_Demo_0619
//
//  Created by pan dabo on 14-6-21.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "UIBlockAlertView.h"



@implementation UIBlockAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles  buttonBlock:(AlertBlock)block{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if(self!=nil){
        self.block = block;

    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    self.block(buttonIndex);
}
-(void)dealloc{
    [super dealloc];
   
    NSLog(@"UIBlockAlertView == dealloc");
}

@end
