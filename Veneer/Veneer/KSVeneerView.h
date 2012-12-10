//
//  KSVeneerView.h
//  Veneer
//
//  Created by Kevin Sylvestre on 7/10/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSVeneerViewDelegate.h"
#import "KSVeneerViewDataSource.h"

typedef enum {
    KSVeneerViewAnimationFade,
    KSVeneerViewAnimationSwap,
    KSVeneerViewAnimationNone
} KSVeneerViewAnimation;

typedef enum {
    KSVeneerViewAxisY,
    KSVeneerViewAxisX,
    KSVeneerViewAxisNone
} KSVeneerViewAxis;

@interface KSVeneerView : UIView <UIScrollViewDelegate>

@property (nonatomic, weak) id <KSVeneerViewDelegate> delegate;
@property (nonatomic, weak) id <KSVeneerViewDataSource> source;

@property (nonatomic, assign) BOOL editing;
@property (nonatomic, assign) KSVeneerViewAxis axis;

- (UIView *)dequeueReusableCellWithIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(Class)klass forCellReuseIdentifier:(NSString *)identifier;

- (void)insertViewAtIndexPath:(NSIndexPath *)path withAnimation:(KSVeneerViewAnimation)animation;
- (void)deleteViewAtIndexPath:(NSIndexPath *)path withAnimation:(KSVeneerViewAnimation)animation;

- (void)insertViewsAtIndexPaths:(NSArray *)paths withAnimation:(KSVeneerViewAnimation)animation;
- (void)deleteViewsAtIndexPaths:(NSArray *)paths withAnimation:(KSVeneerViewAnimation)animation;

- (void)insertSections:(NSIndexSet *)sections withAnimation:(KSVeneerViewAnimation)animation;
- (void)deleteSections:(NSIndexSet *)sections withAnimation:(KSVeneerViewAnimation)animation;

- (void)insertSection:(NSInteger)section withAnimation:(KSVeneerViewAnimation)animation;
- (void)deleteSection:(NSInteger)section withAnimation:(KSVeneerViewAnimation)animation;

- (NSInteger)numberOfCellsInSection:(NSInteger)section;
- (NSInteger)numberOfSections;

- (void)reload;

@end
