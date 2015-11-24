//
//  ViewController.m
//  bee
//
//  Created by Taylor King on 8/2/15.
//  Copyright (c) 2015 Taylor King. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSString *hostname = @"cs.appstate.edu/beemon/pit1";
NSString *username = @"bee";
NSString *pass=@"cs.13,bee";

NSArray* data;
UITableViewCell *selectedCell;
@synthesize videoTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    FMServer *server = [[FMServer alloc]init];
    [server setDestination:hostname];
    [server setUsername:username];
    [server setPassword:pass];
    FTPManager *manager = [[FTPManager alloc] init];
    data = [manager contentsOfServer:server];
    [videoTableView setDataSource:self];
    [videoTableView reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    UILabel *nameLabel = [cell viewWithTag:1];
    if(data) {
        [nameLabel setText:[(NSDictionary*)[data objectAtIndex:[indexPath row]]objectForKey:@"kCFFTPResourceName"]];
        NSString *videoName = [nameLabel text];
        FMServer *server = [[FMServer alloc] init];
        [server setUsername:username];
        [server setPassword:pass];
        NSString *destinationString = [NSString stringWithFormat:@"%@/%@/video", hostname, videoName];
        [server setDestination:destinationString];
        FTPManager *manager = [[FTPManager alloc] init];
        NSArray *ftpData = [manager contentsOfServer:server];
        UILabel *videoCountLabel = (UILabel*)[cell viewWithTag:2];
        [videoCountLabel setText:[NSString stringWithFormat:@"%lu videos", [ftpData count]]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // segue to video view.
    selectedCell = [videoTableView cellForRowAtIndexPath:indexPath];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(data) {
        return [data count];
    }
    return 0;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSArray *paths= [videoTableView indexPathsForSelectedRows];
    NSIndexPath *selectedPath = [paths objectAtIndex:0];
    UITableViewCell *tableCell = [videoTableView cellForRowAtIndexPath:selectedPath];
    NSString *videoName = [(UILabel*)[tableCell viewWithTag:1] text];
   [(BeeDayViewController*)[segue destinationViewController] setSelectedDay:videoName];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
