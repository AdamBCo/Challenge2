//
//  WebViewController.m
//  CodeChallenge2
//
//  Created by Adam Cooper on 10/10/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *cityWebView;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.websiteURL];
    NSLog(@"%@",self.websiteURL);
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.cityWebView loadRequest:urlRequest];
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
