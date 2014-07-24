//
//  ViewController.m
//  MySafari
//
//  Created by Efrén Reyes Torres on 7/23/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *forwardButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self checkStatusForButtons];
//    self.homepageUrlString = @"http://www.google.com";
//    [self loadUrlString:self.homepageUrlString];
}

-(void)loadUrlString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:urlRequest];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self loadUrlString:[self checkUrl:textField.text]];
    [textField resignFirstResponder];
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"Loading...");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Loaded");
    [self checkStatusForButtons];
}

-(IBAction)onBackButtonPressed:(id)sender {
    [self.myWebView goBack];
}

-(IBAction)onForwardButtonPressed:(id)sender {
    [self.myWebView goForward];
}

-(IBAction)onStopLoadingButtonPressed:(id)sender {
    [self.myWebView stopLoading];
}

-(IBAction)onReloadButtonPressed:(id)sender {
    [self.myWebView reload];
}

- (void) checkStatusForButtons {
    if ([self.myWebView canGoBack]) {
        [self.backButton setEnabled:TRUE];
    }else{
        [self.backButton setEnabled:FALSE];
    }
    if ([self.myWebView canGoForward]) {
        [self.forwardButton setEnabled:TRUE];
    }else{
        [self.forwardButton setEnabled:FALSE];
    }
}

-(NSString *) checkUrl:(NSString *)urlString {
    NSString *prefix = @"http://";

    if (![prefix isEqualToString:[urlString substringToIndex:prefix.length]]) {
        return [NSString stringWithFormat:@"%@%@", prefix,urlString];
    } else {
        return urlString;
    }
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
