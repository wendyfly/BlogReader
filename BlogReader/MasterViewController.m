//
//  MasterViewController.m
//  BlogReader
//
//  Created by LiaoWenwen on 12/26/15.
//  Copyright © 2015 LiaoWenwen. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "BlogPost.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    BlogPost *blogPost = [[BlogPost alloc] initWithTitle:@"some tile"];
//   blogPost.author = @"someone";
//    BlogPost *blogPost2 = [BlogPost blogPostWithTitle:@ "some title"];
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL: blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error: &error];
    self.blogPostArray =[NSMutableArray array];
    
    NSArray *blogArray = [dataDictionary objectForKey:@"posts"];
    for (NSDictionary *dpDictionary in blogArray) {
        BlogPost *blog = [BlogPost blogPostWithTitle:[dpDictionary objectForKey:@"title"]];
        blog.author = [dpDictionary objectForKey:@"author"];
        blog.thumbNailImage = [dpDictionary objectForKey:@"thumbnail"];
        blog.date = [dpDictionary objectForKey:@"date"];
        [self.blogPostArray addObject: blog];
    }
    
    
//   NSLog(@"%@", dataDictionary);
//    NSDictionary *blogPost1 = [[NSDictionary alloc] initWithObjectsAndKeys: @"The Missing widget in Android", @"title", @"Ben", @"author", nil];
//    
//    NSDictionary *blogPost2 = [[NSDictionary alloc] initWithObjectsAndKeys: @"The IOS development", @"title", @"Amit", @"author", nil];
    
//    self.blogPostArray = [dataDictionary objectForKey:@"posts"];

}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        NSDictionary *blogPost = [self.blogPostArray objectAtIndex:indexPath.row];
        [controller setDetailItem:[blogPost valueForKey:@"title"]];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.blogPostArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

//    NSDictionary *blogPost = [self.blogPostArray objectAtIndex:indexPath.row];
    BlogPost *blogPost = [self.blogPostArray objectAtIndex:indexPath.row];
    if([blogPost.thumbNailImage isKindOfClass: [NSString class]]) {
    
    NSData *imageData = [NSData dataWithContentsOfURL: blogPost.thumbnailURL];
    
    UIImage *image = [UIImage imageWithData:imageData];
        
    cell.imageView.image = image;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"cat.png"];
    }
//    cell.textLabel.text = [blogPost valueForKey:@"title"];
    cell.textLabel.text = blogPost.title;
//    cell.detailTextLabel.text = [blogPost valueForKey:@"author"];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"%@ - %@",blogPost.author, [blogPost formattedDate]];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


@end
