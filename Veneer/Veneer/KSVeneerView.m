//
//  KSVeneerView.m
//  Veneer
//
//  Created by Kevin Sylvestre on 7/10/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import "KSVeneerView.h"
#import "KSVeneerData.h"

@interface KSVeneerView ()

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, strong) NSMutableDictionary *cells;
@property (nonatomic, strong) NSMutableDictionary *pools;
@property (nonatomic, strong) NSMutableDictionary *nibs;
@property (nonatomic, strong) NSMutableDictionary *klasses;

@property (nonatomic, strong) NSMutableArray *sections;

- (void)queueReusableCell:(UIView *)cell withIdentifier:(NSString *)identifier;

@end

@implementation KSVeneerView

@synthesize delegate = _delegate;
@synthesize source = _source;
@synthesize editing = _editing;
@synthesize axis = _axis;
@synthesize cells = _cells;
@synthesize pools = _pools;
@synthesize nibs = _nibs;
@synthesize klasses = _klasses;

@synthesize mainScrollView;


////////////////////////////////////////////////////////////////////////////////

#pragma mark - Properties


- (NSMutableDictionary *)klasses
{
    if (!_klasses) _klasses = [NSMutableDictionary dictionary];
    return _klasses;
}


- (NSMutableDictionary *)nibs
{
    if (!_nibs) _nibs = [NSMutableDictionary dictionary];
    return _nibs;
}


- (NSMutableDictionary *)cells
{
    if (!_cells) _cells = [NSMutableDictionary dictionary];
    return _cells;
}


- (NSMutableDictionary *)pools
{
    if (!_pools) _pools = [NSMutableDictionary dictionary];
    return _pools;
}


////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (void)initWithGlobal
{
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    
    UIViewAutoresizing mask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    [self.mainScrollView setDelegate:self];
    [self.mainScrollView setShowsVerticalScrollIndicator:NO];
    [self.mainScrollView setShowsHorizontalScrollIndicator:NO];
    [self.mainScrollView setAutoresizingMask:mask];
    
    [self addSubview:self.mainScrollView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        [self initWithGlobal];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    if (self)
    {     
        [self initWithGlobal];
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Queueing

- (NSMutableSet *)setOfReusableCellsForIdentifier:(NSString *)identifier
{
    NSMutableSet *set = [self.cells objectForKey:identifier];
    
    if (!set) 
    {
        set = [NSMutableSet set];
        [self.cells setObject:set forKey:identifier];
    }
    
    return set;
}

- (void)queueReusableCell:(UIView *)cell withIdentifier:(NSString *)identifier
{
    [[self setOfReusableCellsForIdentifier:identifier] addObject:cell];
}

- (UIView *)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    Class class = NSClassFromString(identifier);
    
    UIView *view = [[self setOfReusableCellsForIdentifier:identifier] anyObject];
    UINib *nib = [self.nibs objectForKey:identifier];
    
    if (!view && nib)
    {
        NSArray *views = [nib instantiateWithOwner:nil options:nil];
        
        for (view in views) if ([view isKindOfClass:class]) break;
    }
    
    return view;
}

- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier
{
    [self.nibs setObject:nib forKey:identifier];
}

- (void)registerClass:(Class)klass forCellReuseIdentifier:(NSString *)identifier
{
    [self.klasses setObject:klass forKey:identifier];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Modifications
     

- (void)insertViewAtIndexPath:(NSIndexPath *)path withAnimation:(KSVeneerViewAnimation)animation
{
    
}

- (void)deleteViewAtIndexPath:(NSIndexPath *)path withAnimation:(KSVeneerViewAnimation)animation
{
    
}

- (void)insertViewsAtIndexPaths:(NSArray *)paths withAnimation:(KSVeneerViewAnimation)animation
{
    
}

- (void)deleteViewsAtIndexPaths:(NSArray *)paths withAnimation:(KSVeneerViewAnimation)animation
{
    
}

- (void)insertSections:(NSIndexSet *)sections withAnimation:(KSVeneerViewAnimation)animation
{
    
}

- (void)deleteSections:(NSIndexSet *)sections withAnimation:(KSVeneerViewAnimation)animation
{
    
}

- (void)insertSection:(NSInteger)section withAnimation:(KSVeneerViewAnimation)animation
{
    
}

- (void)deleteSection:(NSInteger)section withAnimation:(KSVeneerViewAnimation)animation
{
    
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Accessors

- (NSInteger)numberOfCellsInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSections
{
    return 0;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Actions

- (void)reload
{
    self.sections = [NSMutableArray array];
    
    for (NSInteger i = 0; i < [self.source numberOfSectionsInVeneerView:self]; i++)
    {
        NSMutableArray *row = [NSMutableArray array];
        [self.sections addObject:row];
        
        for (NSInteger j = 0; j < [self.source numberOfCellsInSection:i inVeneerView:self]; j++)
        {
            KSVeneerData *data = [[KSVeneerData alloc] init];
            
            data.path = [NSIndexPath indexPathForRow:i inSection:j];
            data.size = [self.source sizeAtIndexPath:data.path forVeneerView:self];
            
            [row addObject:data];
        }
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (CGRect)frameForIndexPath:(NSIndexPath *)path
{
	// Default parent frame.
	CGRect frame = CGRectZero;
    
    frame.size = [self.source sizeAtIndexPath:path forVeneerView:self];
    frame.origin.x = 0.0f;
    frame.origin.y = 0.0f;
	
	if (self.axis == KSVeneerViewAxisX) frame.origin.x = frame.size.width * path.row;
    if (self.axis == KSVeneerViewAxisY) frame.origin.y = frame.size.height * path.row;
    
	return frame;
}

- (NSSet *)indicies
{
    NSMutableSet *indicies = [NSMutableSet set];
    
    NSInteger section = 0;
    for (NSInteger row = 0; row < [self.source numberOfCellsInSection:section inVeneerView:self]; row++)
    {
        [indicies addObject:[NSIndexPath indexPathForRow:row inSection:section]];
    }
    
    return indicies;
}

- (void)retile
{
    for (NSIndexPath *path in [self indicies])
    {
        if (![self.cells objectForKey:path])
        {
            UIView *cell = [self.source viewAtIndexPath:path forVeneerView:self];
            [self.cells setObject:cell forKey:path];
            [self.mainScrollView addSubview:cell];
            cell.frame = [self frameForIndexPath:path];
        }
    }
}

- (void)recycle
{
    
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Scrolling

- (void)scrollViewDidScroll:(UIScrollView *)view
{
    [self retile];
    [self recycle];
}

@end
