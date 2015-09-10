//
//  MTVWebService.m
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import "MTVWebService.h"
#import "MTVNetworking.h"
#import "MTVCat.h"

@interface MTVWebService ()

@property (nonatomic) MTVNetworking *networking;

@end

@implementation MTVWebService

+ (instancetype)sharedService
{
    static MTVWebService *__sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[self alloc] init];
    });

    return __sharedInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.networking = [[MTVNetworking alloc] init];
    }

    return self;
}

- (void)fetchCatsWithSuccess:(void(^)(NSArray *cats))success
                     failure:(void(^)(NSError *))failure
{
    [self.networking GET:@"https://api.flickr.com/services/feeds/photos_public.gne" parameters:@{ @"tags": @"cats" } success:^(id responseObject) {
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSMutableArray *cats = [NSMutableArray array];

        for (NSDictionary *catDict in responseDict[@"entry"]) {
            [cats addObject:[[MTVCat alloc] initWithDictionary:catDict]];
        }

        if (success) { success(cats); }
    } failure:failure];
}

@end
