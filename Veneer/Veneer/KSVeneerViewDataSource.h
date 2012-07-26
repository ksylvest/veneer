//
//  KSVeneerViewDataSource.h
//  Veneer
//
//  Created by Kevin Sylvestre on 7/10/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KSVeneerView;

@protocol KSVeneerViewDataSource <NSObject>

@required

- (CGSize)sizeAtIndexPath:(NSIndexPath *)path forVeneerView:(KSVeneerView *)view;
- (UIView *)viewAtIndexPath:(NSIndexPath *)path forVeneerView:(KSVeneerView *)view;

- (NSInteger)numberOfCellsInSection:(NSInteger)section inVeneerView:(KSVeneerView *)view;

@optional

- (NSInteger)numberOfSectionsInVeneerView:(KSVeneerView *)view;

@end
