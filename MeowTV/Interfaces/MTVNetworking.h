//
//  MTVNetworking.h
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTVNetworking : NSObject

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    success:(void(^)(id responseObject))success
    failure:(void(^)(NSError *))failure;

@end
