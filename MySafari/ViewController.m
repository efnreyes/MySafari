//
//  ViewController.m
//  MySafari
//
//  Created by Efrén Reyes Torres on 7/23/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *forwardButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (nonatomic, assign) CGFloat lastContentOffset;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self checkStatusForButtons];
    self.lastContentOffset = 0.0f;
    self.myWebView.scrollView.delegate = self;
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

-(IBAction)onClearButtonPressed:(id)sender {
    self.myURLTextField.text = @"";
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

-(IBAction)showNewFeatures:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.title = @"New Features";
    alertView.message = @"Coming soon!";
    alertView.delegate = self;
    [alertView show];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.lastContentOffset > scrollView.contentOffset.y) {
        NSLog(@"Scrolling up");
        self.myURLTextField.alpha = 1.0f;
        self.clearButton.alpha = 1.0f;
    } else if (self.lastContentOffset < scrollView.contentOffset.y) {
        NSLog(@"Scrolling down");
        self.myURLTextField.alpha = 0.0f;
        self.clearButton.alpha = 0.0f;
    }
    self.lastContentOffset = scrollView.contentOffset.y;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Loaded");
    self.myURLTextField.text = [NSString stringWithFormat:@"%@",webView.request.URL];
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
