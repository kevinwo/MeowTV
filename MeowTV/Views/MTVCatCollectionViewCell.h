//
//  MTVCatCollectionViewCell.h
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTVCat;

@interface MTVCatCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (void)setCat:(MTVCat *)cat;

@end
