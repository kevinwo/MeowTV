//
//  MTVCat.m
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import "MTVCat.h"

@implementation MTVCat

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.name = dictionary[@"title"];
        self.imageURL = [self imageURLInDictionary:dictionary];
    }

    return self;
}

#pragma mark - Private interface

- (NSString *)imageURLInDictionary:(NSDictionary *)dictionary
{
    NSArray *links = dictionary[@"link"];

    for (NSDictionary *linkDict in links) {
        if ([linkDict[@"_href"] containsString:@"jpg"] || [linkDict[@"_href"] containsString:@"png"]) {
            return linkDict[@"_href"];
        }
    }

    return nil;
}

@end
