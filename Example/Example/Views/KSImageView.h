//
//  KSImageView.h
//  VeneerDemo
//
//  Created by Kevin Sylvestre on 7/10/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSImageView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *shadowImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@property (nonatomic, weak) UIImage *image;

@end
