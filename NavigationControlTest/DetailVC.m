//
//  DetailVC.m
//  NavigationControlTest
//
//  Created by SDT1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()

@end

@implementation DetailVC

- (void)viewWillAppear:(BOOL)animated
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", self.urlStr]];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
