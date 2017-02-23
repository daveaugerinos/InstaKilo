//
//  MyCollectionViewCell.m
//  InstaKilo
//
//  Created by Dave Augerinos on 2017-02-22.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

// Override setter method
- (void)setMyPhoto:(MyPhoto *)photo {

    _myPhoto = photo;
    [self configure];
}

- (void)configure {
    
    self.myImageView.image = self.myPhoto.image;
}

@end
