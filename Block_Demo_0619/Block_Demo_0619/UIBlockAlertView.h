//
//  BlockAlertView.h
//  Block_Demo_0619
//
//  Created by pan dabo on 14-6-21.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ AlertBlock)(NSInteger index);

@interface UIBlockAlertView : UIAlertView

@property(nonatomic,copy)AlertBlock block;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles  buttonBlock:(AlertBlock)block;



@end
