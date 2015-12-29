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
@property(nonatomic, strong)NSString *author;

- (id) initWithTitle:(NSString *) title;

+ (id) blogPostWithTitle:(NSString *) title;

@end
