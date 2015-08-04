//
//  ViewController.m
//  SocialMedia_integration
//
//  Created by Akash Rastogi on 04/08/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnShareFacebookClicked:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fbSheet setInitialText:@"shared by iOS app.\nIt's been a while since you've updated sections of your profile. Take a few moments to make sure your info is still correct."];
        [fbSheet addImage:[UIImage imageNamed:@"Share.jpg"]];
        NSURL *shareUrl = [NSURL URLWithString:@"https://www.facebook.com"];
        [fbSheet addURL:shareUrl];
        [self presentViewController:fbSheet animated:YES completion:nil];
    }
}

- (IBAction)btnTwitterShareClicked:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Shared by iOS app"];
        [tweetSheet addImage:[UIImage imageNamed:@"Share.jpg"]];
        NSURL *shareUrl = [NSURL URLWithString:@"https://www.twitter.com"];
        [tweetSheet addURL:shareUrl];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
}

- (IBAction)btnShareClicked:(id)sender {
    UIImage *postImage = [UIImage imageNamed:@"Share.jpg"];
    NSString *postText = @"shared by iOS app UIActivityViewController.";
    NSURL *shareUrl = [NSURL URLWithString:@"https://www.google.co.in"];
    NSArray *activityItems = [NSArray arrayWithObjects:postText, postImage, shareUrl, nil];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    NSArray *excludedActivities = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
                                    UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll];
    activityViewController.excludedActivityTypes = excludedActivities;
    [self presentViewController:activityViewController animated:YES completion:nil];
}

@end
