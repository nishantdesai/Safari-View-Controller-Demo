//
//  ViewController.m
//  Safari View Controller Demo
//
//  Created by Nishant Desai on 12/06/15.
//  Copyright © 2015 Nishant Desai. All rights reserved.
//

#import "ViewController.h"
#import <SafariServices/SafariServices.h>

@interface ViewController () <SFSafariViewControllerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *urlTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)openLink:(NSString *)url {
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@", url]];
    if (URL) {
        SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:URL];
        sfvc.delegate = self;
        [self presentViewController:sfvc animated:YES completion:nil];
    } else {
        // will have a nice alert displaying soon.
    }
}

#pragma Safari View Controller Delegate

- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma UITextField Delegate

- (BOOL)textFieldShouldReturn:(nonnull UITextField *)textField {
    [self openLink:textField.text];
    return YES;
}

@end
