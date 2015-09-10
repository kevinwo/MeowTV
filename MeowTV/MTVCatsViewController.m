//
//  MTVCatsViewController.m
//  MeowTV
//
//  Created by Kevin Wolkober on 9/10/15.
//  Copyright © 2015 Kevin Wolkober. All rights reserved.
//

#import "MTVCatsViewController.h"
#import "MTVCatCollectionViewCell.h"
#import "MTVWebService.h"
#import "MTVCat.h"

@interface MTVCatsViewController ()

@property (nonatomic) NSArray *cats;

@end

@implementation MTVCatsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[MTVWebService sharedService] fetchCatsWithSuccess:^(NSArray *cats) {
        self.cats = cats;

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"It seems we were unable to find your cats." message:@"好像找不到貓咪耶" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertController animated:YES completion:nil];
        });
    }];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cats.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MTVCatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MTVCatCollectionViewCell class]) forIndexPath:indexPath];
    MTVCat *cat = self.cats[indexPath.row];
    [cell setCat:cat];

    return cell;
}

@end
