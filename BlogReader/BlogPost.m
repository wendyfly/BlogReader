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
    }
    return self;
}

+(id) blogPostWithTitle:(NSString *)title {
   return [[self alloc] initWithTitle:title];
}

@end
