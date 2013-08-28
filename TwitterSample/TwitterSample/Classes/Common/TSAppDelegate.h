//
//  TSAppDelegate.h
//  TwitterSample
//
//  Created by 田畑浩平 on 2013/08/19.
//  Copyright (c) 2013年 Kohei Tabata. All rights reserved.
//

/*
#import <UIKit/UIKit.h>

@class TSViewController;

@interface TSAppDelegate : UIResponder
  <UIApplicationDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *navigationController;

//@property (strong, nonatomic) TSViewController *viewController;

@end
*/

#import <UIKit/UIKit.h>

@class TSViewController;

@interface TSAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TSViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TSViewController *viewController;

@end
