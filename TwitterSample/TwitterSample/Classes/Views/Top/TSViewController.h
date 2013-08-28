//
//  TSViewController.h
//  TwitterSample
//
//  Created by 田畑浩平 on 2013/08/19.
//  Copyright (c) 2013年 Kohei Tabata. All rights reserved.
//

/*
#import <UIKit/UIKit.h>

@interface TSViewController : UIViewController
  <UIApplicationDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate,UITextFieldDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
*/

#import <UIKit/UIKit.h>

#import "SA_OAuthTwitterController.h"

@class TSViewController;//SA_OAuthTwitterEngine;


@interface TSViewController : UIViewController <SA_OAuthTwitterControllerDelegate> {
    SA_OAuthTwitterEngine	*_engine;
    
}

@end
