//
//  BlogPost.h
//  BlogReader
//
//  Created by LiaoWenwen on 12/27/15.
//  Copyright © 2015 LiaoWenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *author;
@property(nonatomic, strong) NSString *thumbNailImage;
@property(nonatomic, strong) NSString *date;

- (id) initWithTitle:(NSString *) title;

+ (id) blogPostWithTitle:(NSString *) title;

- (NSURL *) thumbnailURL;

- (NSString *) formattedDate;

@end
