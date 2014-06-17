//
//  RootViewController.h
//  ScrollViewPropertyDemo_0617
//
//  Created by pan dabo on 14-6-17.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UIScrollViewDelegate>
{
    @private
    UIScrollView *scrollView;
    UIImageView *imageView;
}
@end
