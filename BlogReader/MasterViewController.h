//
//  MasterViewController.h
//  BlogReader
//
//  Created by LiaoWenwen on 12/26/15.
//  Copyright © 2015 LiaoWenwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property(strong, nonatomic) NSMutableArray *blogPostArray;




@end

