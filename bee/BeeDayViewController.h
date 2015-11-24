//
//  BeeDayViewController.h
//  bee
//
//  Created by Taylor King on 8/2/15.
//  Copyright (c) 2015 Taylor King. All rights reserved.
//
#import "FTPManager.h" 
#import <UIKit/UIKit.h>
#import "FFMpegWrapper.h"

@import MediaPlayer;
@interface BeeDayViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, FTPManagerDelegate>
@property (strong, nonatomic) NSString *selectedDay;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;
@property (strong, nonatomic)  MPMoviePlayerViewController *player;
@property (strong, nonatomic) NSURLCredential *creds;
@property (strong, nonatomic) NSURLProtectionSpace *space;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *progressView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end
