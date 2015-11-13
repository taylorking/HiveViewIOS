//
//  BeeDayViewController.m
//  bee
//
//  Created by Taylor King on 8/2/15.
//  Copyright (c) 2015 Taylor King. All rights reserved.
//

#import "BeeDayViewController.h"

@interface BeeDayViewController ()

@end

@implementation BeeDayViewController
NSString *user = @"";
NSString *password = @"";
NSString *host = @"";
@synthesize titleLabel;
@synthesize selectedDay;
@synthesize player;
@synthesize creds;
@synthesize space;
NSArray *dayData;
- (void)viewDidLoad {
    [super viewDidLoad];
    FTPManager *manager = [[FTPManager alloc] init];
    FMServer *server = [[FMServer alloc] init];
    [server setDestination:[NSString stringWithFormat:@"%@/%@/video", host, selectedDay]];
    [server setUsername:user];
    [server setPassword:password];
    dayData = [manager contentsOfServer:server];
        // Go get the data.
    [titleLabel setTitle:[self selectedDay]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.

    return [dayData count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell"];
    UILabel *fileLabel = [cell viewWithTag:1];
    [fileLabel setText:[NSString stringWithFormat:@"%@", [(NSDictionary*)[dayData objectAtIndex:[indexPath row]] objectForKey:@"kCFFTPResourceName"]]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FTPManager *ftp = [[FTPManager alloc] init];
    FMServer *server = [[FMServer alloc] init];
    
    UITableViewCell *selectedIndexes = [tableView cellForRowAtIndexPath:indexPath];
    UILabel *videoLabel = (UILabel*)[selectedIndexes viewWithTag:1];
    NSString *videoName = [videoLabel text];
    
    NSString *fullUrl = [NSString stringWithFormat:@"%@/%@/video", host, selectedDay];
    NSURL *url = [NSURL URLWithString:fullUrl];
    [server setDestination:fullUrl];
    [server setUsername:user];
    [server setPassword:password];
    [ftp setDelegate:self];
    
    [ftp downloadFile:videoName toDirectory:[NSURL fileURLWithPath:NSHomeDirectory()] fromServer:server];
    /**
    creds = [[NSURLCredential alloc] initWithUser:user password:password persistence:NSURLCredentialPersistenceForSession];
    
    space = [[NSURLProtectionSpace alloc] initWithHost:@"cs.appstate.edu" port:21 protocol:@"ftp" realm:@"cs.appstate.edu" authenticationMethod:NSURLAuthenticationMethodHTTPBasic];
    [[NSURLCredentialStorage sharedCredentialStorage] setCredential:creds forProtectionSpace:space];
    
    player = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    CGRect copy = [[self view] frame];
    [[player view] setFrame:copy];
    [[player moviePlayer] setMovieSourceType:MPMovieSourceTypeStreaming];
    [self presentMoviePlayerViewControllerAnimated:player];
        [[player moviePlayer] play];
     **/
}
-(void)ftpManagerDownloadProgressDidChange:(NSDictionary *)processInfo {
    
}
/*
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
