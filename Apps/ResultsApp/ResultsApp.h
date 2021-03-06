//
//  ResultsApp.h
//  FlowerForAll
//
//  Created by Pierre-Mikael Legris (Perki) on 28.09.11.
//  Copyright 2011 fondation Defitech. All rights reserved.
//

#import "FlowerApp.h"
#import "ResultsApp_Nav.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ResultsApp : FlowerApp <MFMailComposeViewControllerDelegate,UINavigationControllerDelegate>  {
    IBOutlet UIView* controllerView; 
    IBOutlet UIToolbar* toolbar; 
    ResultsApp_Nav* statViewController;
    IBOutlet UIBarButtonItem *sendButton;
}

@property (nonatomic, retain)  IBOutlet UIView* controllerView;  
@property (nonatomic, retain)  IBOutlet UIToolbar* toolbar; 

@property (nonatomic, retain) UIBarButtonItem *sendButton;

- (IBAction)sendButtonPressed:(id)sender;

- (void)refreshSendButton;


@end
