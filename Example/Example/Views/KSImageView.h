//
//  KSImageView.h
//  VeneerDemo
//
//  Created by Kevin Sylvestre on 7/10/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Veneer.h"

@interface KSImageView : UIView <KSVeneerCell>

@property (weak, nonatomic) IBOutlet UIImageView *shadowImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@property (nonatomic, weak) UIImage *image;

@property (nonatomic, strong) NSString *identifier;

@end
