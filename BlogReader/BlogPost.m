//
//  BlogPost.m
//  BlogReader
//
//  Created by LiaoWenwen on 12/27/15.
//  Copyright © 2015 LiaoWenwen. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *) title {
    self = [super init];
    if(self) {
        self.title = title;
        self.thumbNailImage = nil;
    }
    return self;
}

+(id) blogPostWithTitle:(NSString *)title {
   return [[self alloc] initWithTitle:title];
}


- (NSURL *) thumbnailURL {
    
    return [NSURL URLWithString:self.thumbNailImage];
}


- (NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:self.date];
    [dateFormatter setDateFormat:@"EE MMM,dd"];
    return [dateFormatter stringFromDate:tempDate];
}

@end
