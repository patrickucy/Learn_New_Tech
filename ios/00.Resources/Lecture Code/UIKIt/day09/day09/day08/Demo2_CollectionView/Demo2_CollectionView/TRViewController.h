//
//  TRViewController.h
//  Demo2_CollectionView
//
//  Created by apple on 13-6-14.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;

@end
