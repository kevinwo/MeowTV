//
//  MTVCat.h
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTVCat : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
