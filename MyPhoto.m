//
//  MyPhoto.m
//  InstaKilo
//
//  Created by Dave Augerinos on 2017-02-22.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "MyPhoto.h"

@implementation MyPhoto

- (instancetype)initWithImage:(UIImage *)image andSubject:(NSString *)subject andLocation:(NSString *)location {
    
    self = [super init];
    
    if (self) {
        self.image = image;
        self.subject = subject;
        self.location = location;
    }
    
    return self;
}

@end
