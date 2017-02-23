//
//  MyCollectionViewCell.h
//  InstaKilo
//
//  Created by Dave Augerinos on 2017-02-22.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPhoto.h"

@interface MyCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) MyPhoto *myPhoto;

@end
