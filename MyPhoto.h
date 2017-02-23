//
//  MyPhoto.h
//  InstaKilo
//
//  Created by Dave Augerinos on 2017-02-22.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface MyPhoto : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) NSString *location;

- (instancetype)initWithImage:(UIImage *)image andSubject:(NSString *)subject andLocation:(NSString *)location;


@end
