//
//  MTVNetworking.m
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import "OMGHTTPURLRQ.h"
#import "MTVNetworking.h"
#import "XMLDictionary.h"

@interface MTVNetworking ()

@property (nonatomic) NSURLSession *session;

@end

@implementation MTVNetworking

- (instancetype)init
{
    if (self = [super init]) {
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    
    return self;
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    success:(void(^)(id responseObject))success
    failure:(void(^)(NSError *))failure
{
    NSURLRequest *request = [OMGHTTPURLRQ GET:URLString :parameters error:nil];

    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (failure) { failure(error); }
        } else {
            id responseObject = [NSDictionary dictionaryWithXMLData:data];
            if (success) { success(responseObject); }
        }
    }];
    [task resume];
}

@end
