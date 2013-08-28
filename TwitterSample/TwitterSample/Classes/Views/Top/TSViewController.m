//
//  TSViewController.m
//  TwitterSample
//
//  Created by 田畑浩平 on 2013/08/19.
//  Copyright (c) 2013年 Kohei Tabata. All rights reserved.
//
/*
#import "TSViewController.h"
#import "TSTimeLineViewController.h"
#import "TSPRofileViewController.h"

@interface TSViewController ()

@end

@implementation TSViewController
{
    TSTImeLineViewController *nextViewController;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //NavigationControllerの設定
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"Twitter";
        UIBarButtonItem *bt = [[UIBarButtonItem alloc] initWithTitle:@"ログイン"
                                                               style:UIBarButtonItemStylePlain
                                                              target:self action:@selector(bt_down:)];
        self.navigationItem.rightBarButtonItem = bt;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITextField *user;
	UITextField *password;
    UILabel *userLabel;
    UILabel *passwordLabel;
    
    userLabel = [[UILabel alloc] init];
    userLabel.text = @"■ユーザー名またはアドレス";
    userLabel.frame = CGRectMake(0, 40, 100, 100);
    [userLabel sizeToFit];
    
    passwordLabel = [[UILabel alloc] init];
    passwordLabel.text = @"■パスワード";
    passwordLabel.frame = CGRectMake(0, 130, 100, 100);
    [passwordLabel sizeToFit];
    
    //ユーザー名またはアドレスを入力する場所
    user = [[UITextField alloc] init];
    user.borderStyle = UITextBorderStyleRoundedRect;
    user.frame = CGRectMake(0, 70, self.view.bounds.size.width, 30);
    user.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    user.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //パスワードを入力する場所
    password = [[UITextField alloc] init];
    password.borderStyle = UITextBorderStyleRoundedRect;
    password.frame = CGRectMake(0, 160, self.view.bounds.size.width, 30);
    password.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    password.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:userLabel];
    [self.view addSubview:passwordLabel];
    [self.view addSubview:user];
    [self.view addSubview:password];
    
}

-(IBAction)bt_down:(UIBarButtonItem *)sender
{
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    UIViewController *viewController1, *viewController2;;
    viewController1 = [[TSTImeLineViewController alloc] initWithNibName:nil bundle:nil];
    viewController2 = [[TSProfileViewController alloc] initWithNibName:nil bundle:nil];
    
    //NavigationControllerを表示させる
    UINavigationController *navFirstViewController = [[UINavigationController alloc] initWithRootViewController:viewController1];
    UINavigationController *navSecondViewController = [[UINavigationController alloc] initWithRootViewController:viewController2];
    
    //TabBarの設定
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navFirstViewController, navSecondViewController, nil];
    self.window.rootViewController = self.tabBarController;
    
    [self.window addSubview:self.tabBarController.view];
    [self.window makeKeyAndVisible];
    
    nextViewController = [[TSTImeLineViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:nextViewController animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    //[super didReceiveMemoryWarning];
    
}

@end
*/

#import "TSViewController.h"
#import "SA_OAuthTwitterEngine.h"


#define kOAuthConsumerKey				@"ZS8R6tKVgHYXFE1nsSysg"		//REPLACE ME
#define kOAuthConsumerSecret			@"h169nkFcAHc3So9z8HKYK8X2gwqzxl5HZw2kfIGmRog"		//REPLACE ME

@implementation TSViewController



//=============================================================================================================================
#pragma mark SA_OAuthTwitterEngineDelegate
- (void) storeCachedTwitterOAuthData: (NSString *) data forUsername: (NSString *) username {
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
    
	[defaults setObject: data forKey: @"authData"];
	[defaults synchronize];
}

- (NSString *) cachedTwitterOAuthDataForUsername: (NSString *) username {
	return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData"];
}

//=============================================================================================================================
#pragma mark SA_OAuthTwitterControllerDelegate
- (void) OAuthTwitterController: (SA_OAuthTwitterController *) controller authenticatedWithUsername: (NSString *) username {
	NSLog(@"Authenicated for %@", username);
}

- (void) OAuthTwitterControllerFailed: (SA_OAuthTwitterController *) controller {
	NSLog(@"Authentication Failed!");
}

- (void) OAuthTwitterControllerCanceled: (SA_OAuthTwitterController *) controller {
	NSLog(@"Authentication Canceled.");
}

//=============================================================================================================================
#pragma mark TwitterEngineDelegate
- (void) requestSucceeded: (NSString *) requestIdentifier {
	NSLog(@"Request %@ succeeded", requestIdentifier);
}

- (void) requestFailed: (NSString *) requestIdentifier withError: (NSError *) error {
	NSLog(@"Request %@ failed with error: %@", requestIdentifier, error);
}



//=============================================================================================================================

#pragma mark ViewController Stuff
- (void)dealloc {
	[_engine release];
    [super dealloc];
}
- (void) viewDidAppear: (BOOL)animated {
	if (_engine) return;
	_engine = [[SA_OAuthTwitterEngine alloc] initOAuthWithDelegate: self];
	_engine.consumerKey = kOAuthConsumerKey;
	_engine.consumerSecret = kOAuthConsumerSecret;
	
	UIViewController			*controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: _engine delegate: self];
	
	if (controller)
		[self presentModalViewController: controller animated: YES];
	else {
		[_engine sendUpdate: [NSString stringWithFormat: @"Already Updated. %@", [NSDate date]]];
	}
    
}


@end





