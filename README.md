Delegation
==========

Delegation is a simple and powerful pattern in which one object in a program acts on behalf of, or in coordination with, another object. The delegating object keeps a reference to the other object—the delegate—and at the appropriate time sends a message to it. The message informs the delegate of an event that the delegating object is about to handle or has just handled.


MySafari
========


As a user, I want to view a website
2 points

    Create a new project, call it “MySafari”
    Add this project to your Github account
    Add a UIWebView to the Storyboard using the Interface Builder
    Connect the UIWebView to an IBOutlet in the ViewController.m file and name the IBOutlet variable myWebView
    The variable you create should @interface section of the ViewController.m file:

@interface ViewController ()
@property IBOutlet UIWebView *myWebView;
@end

    Add the UIWebViewDelegate protocol to your @interface
    Set the delegate for the the webView to the ViewController
        hint: use the Storyboard’s Connections Inspector

As a user, I want to enter a website URL so that I can view the web page
3 points

    Add a UITextField to your storyboard
    Connect the textField to an outlet in your ViewController.m and name it: myURLTextField

As a user, I want to use a URL friendly keyboard
1 point

No engineering tasks for this story
As a user, I want to use a Go button on the keyboard to navigate to that URL in the webView
3 points

    In your storyboard, set the keyboard to display a Go button
    Add <UITextFieldDelegate> after your @interface, thus stating your intention to implement the UITexttFieldDelegate protocol 
    Implement the textFieldShouldReturn: UITextFieldDelegate protocol method in the ViewController.m file. In the body of this method, retrieve the value of myURLTextField and create an NSURL using that value.
    In the textFieldShouldReturn: method body in the ViewController.m file, add code to load the NSURL into the webView

As a user, I want to navigate back to a previous web page I visited
3 points

    Add a UIView to ViewController’s view using the Storyboard (we will refer to this as the "Button View").
    Resize the UIWebView, making room for the new UIView beneath the UIWebView.
    The new UIView should take up the width of the UIWebView (this UIView does NOT need to be hooked up to an IBOutlet variable).
    Add a UIButton to the Button View and set the text of the buttont to be “<” (without the quotation marks)
    Hook up the UIButton to an IBAction in the ViewController.m file.
    Name the IBAction method onBackButtonPressed:
    In the onBackButtonPressed: method body in the ViewController.m file, add code to call the goBack method on myWebView.

As a user, I want to navigate forward to a previous web page I visited
2 points

    Add a UIButton to the button-view
    Hook up the UIButton to an IBAction in the ViewController.m file
    Name the IBAction method onForwardButtonPressed:
    In the onForwardButtonPressed: method body in the ViewController.m file, add code to call the goForward method on myWebView.

As a user, I want to stop a web page from loading
2 points

    Add a UIButton to the Button View
    Hook up the UIButton to an IBAction in the ViewController.m file
    Name the IBAction method onStopLoadingButtonPressed:
    In the onStopLoadingButtonPressed: method body in the ViewController.m file, add code to stop the webView from loading

As a user, I want to reload a web page
2 points

    Add a UIButton to the Button View.
    Hook up the UIButton to an IBAction in the ViewController.m file 
    Name the IBAction method onReloadButtonPressed:
    In the onReloadButtonPressed: method body in the ViewController.m file, add code to reload the contents of the webView

As a user, I want to manage the state of the back and forward buttons
2 points

    If the user is in a state such that the back button will take the user back a page, enable it, else, disable it.
    If the user is in a state such that the forward button will take the user forward a page, enable it, else disable it.
    Pay Ryan a compliment.


Stretches
=========


As a user, I want to be able to type in urls without the “http://“ prefix
2 points

    If the value of my myURLTextField does not begin with “http://”, use stringWithFormat to create a new NSString*



As a user, I want to see a teaser for new features
2 points

    Add a UIButton to the Button View and make it’s label ‘+’
    When the ‘+’ button is pressed, display a UIAlertView displaying the string: “Coming soon!”



As a user, I want to concentrate on my web content
2 points

    Detect when the UIWebView scrolls
    When scrolling down, alter the location and opacity of the UITextField to hide it or show it based on scroll direction



As a user, I want to have the address bar set to the current URL
2 points

    The UITextField should update to display the current URL every time the user goes to a new web page
    The UITextField should have a clear button associated with it to quickly clear out an existing url instead of having to repeatedly hit the delete button.
    Add some placeholder text to the UITextField when it's empty.  This should indicate, when there is no webpage or URL in the UITextField, that a URL can be typed there.



As a user, I want to see the current web site’s title in the navigation bar
3 points

    The NavigationItem title should display the current web page's title (not the URL)



Currently the spinner flickers while it’s loading
3 points

    Hiding and showing of the spinner happens multiple times during a single page load
    Implement the networkActivityIndicator to show general network activity.


