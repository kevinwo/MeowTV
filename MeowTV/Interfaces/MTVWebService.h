//
//  MTVWebService.h
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTVWebService : NSObject

+ (instancetype)sharedService;
- (void)fetchCatsWithSuccess:(void(^)(NSArray *cats))success
                     failure:(void(^)(NSError *))failure;

@end
