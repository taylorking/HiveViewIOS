//
//  BeeDayViewController.h
//  bee
//
//  Created by Taylor King on 8/2/15.
//  Copyright (c) 2015 Taylor King. All rights reserved.
//
#import "FTPManager.h" 
#import <UIKit/UIKit.h>
@import MediaPlayer;
@interface BeeDayViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate, FTPManagerDelegate>
@property (strong, nonatomic) NSString *selectedDay;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;
@property (strong, nonatomic)  MPMoviePlayerViewController *player;
@property (strong, nonatomic) NSURLCredential *creds;
@property (strong, nonatomic) NSURLProtectionSpace *space;


@end
