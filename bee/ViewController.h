//
//  ViewController.h
//  bee
//
//  Created by Taylor King on 8/2/15.
//  Copyright (c) 2015 Taylor King. All rights reserved.
//
#import "BeeDayViewController.h"
#import "FTPManager.h"


@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *videoTableView;


@end

