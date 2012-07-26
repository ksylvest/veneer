//
//  KSVeneerViewDelegate.h
//  Veneer
//
//  Created by Kevin Sylvestre on 7/10/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KSVeneerView;

@protocol KSVeneerViewDelegate <NSObject>

@optional

- (void)veneerView:(KSVeneerView *)view beganEditingAtIndexPath:(NSIndexSet *)path;
- (void)veneerView:(KSVeneerView *)view finishedEditingAtIndexPath:(NSIndexSet *)path;

@end
