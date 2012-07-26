//
//  KSImageView.m
//  VeneerDemo
//
//  Created by Kevin Sylvestre on 7/10/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import "KSImageView.h"

#define kEdgeInsets (UIEdgeInsetsMake(80.0f, 80.0f, 80.0f, 80.0f))

@implementation KSImageView

@synthesize shadowImageView;
@synthesize mainImageView;

@synthesize image = _image;

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Properties

- (void)setImage:(UIImage *)image
{
    if (_image != image)
    {
        self.mainImageView.image = image;
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.shadowImageView.image = [self.shadowImageView.image resizableImageWithCapInsets:kEdgeInsets];
}


@end
