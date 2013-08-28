//
//  TSTImeLineViewController.m
//  TwitterSample
//
//  Created by 石山麻友美 on 2013/08/21.
//  Copyright (c) 2013年 Kohei Tabata. All rights reserved.
//

#import "TSTImeLineViewController.h"
#import "TSViewController.h"


@interface TSTImeLineViewController ()

@end

@implementation TSTImeLineViewController
{
    //TSViewController *nextViewController;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //NavigationControllerの設定
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"tweet";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
