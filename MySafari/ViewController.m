//
//  ViewController.m
//  MySafari
//
//  Created by Efrén Reyes Torres on 7/23/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 
@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.homepageUrlString = @"http://www.google.com";
    [self loadUrlString:self.homepageUrlString];
}

-(void)loadUrlString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:urlRequest];
}

-(BOOL)textFieldShouldReturn:(UITextField *)myURLTextField {
    NSString *urlString = myURLTextField.text;
    [self loadUrlString:urlString];
    [myURLTextField resignFirstResponder];
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"Loading...");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Loaded");
}

//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
//    UIAlertView *alertView = [[UIAlertView alloc] init];
//    alertView.title = @"ERROR";
//    alertView.message = error.localizedDescription;
//    alertView.delegate = self;
//    [alertView addButtonWithTitle:@"That stinks"];
//    [alertView show];
//}

@end
