//
//  DetailViewController.h
//  BlogReader
//
//  Created by LiaoWenwen on 12/26/15.
//  Copyright © 2015 LiaoWenwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSURL *postUrl;

@end

