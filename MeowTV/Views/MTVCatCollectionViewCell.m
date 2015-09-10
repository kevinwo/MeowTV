//
//  MTVCatCollectionViewCell.m
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import "MTVCatCollectionViewCell.h"
#import "MTVCat.h"

@implementation MTVCatCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.label.alpha = 0;
}

- (void)setCat:(MTVCat *)cat
{
    self.label.text = cat.name;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:cat.imageURL]];

        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageWithData:imageData];
        });
    });
}

- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    [coordinator addCoordinatedAnimations:^{
        if (self.focused) {
            self.label.alpha = 1;
        } else {
            self.label.alpha = 0;
        }
    } completion:nil];
}

@end
