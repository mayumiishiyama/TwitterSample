//
//  TSProfileViewController.m
//  TwitterSample
//
//  Created by 石山麻友美 on 2013/08/23.
//  Copyright (c) 2013年 Kohei Tabata. All rights reserved.
//

#import "TSProfileViewController.h"
#import "TSViewController.h"

@interface TSProfileViewController ()

@end

@implementation TSProfileViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //NavigationControllerの設定
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"profile";
        
    }
    return self;
}

- (void)viewDidLoad
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
