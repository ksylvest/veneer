//
//  KSViewController.m
//  Example
//
//  Created by Kevin Sylvestre on 7/26/12.
//  Copyright (c) 2012 Kevin Sylvestre. All rights reserved.
//

#import "KSViewController.h"
#import "KSImageView.h"
#import "Image.h"

@interface KSViewController ()

@end

@implementation KSViewController

@synthesize mainVeneerView;
@synthesize mainFetchedResultsController;

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainFetchedResultsController = [Image fetchedResultsController];
    [self.mainFetchedResultsController performFetch:NULL];
    
    self.mainVeneerView = [[KSVeneerView alloc] initWithFrame:self.view.frame];
    
    self.mainVeneerView.delegate = self;
    self.mainVeneerView.source = self;
    
    [self.mainVeneerView registerNib:[UINib nibWithNibName:@"KSImageView" bundle:nil] forCellReuseIdentifier:@"KSImageView"];
    
    [self.mainVeneerView reload];
    
    [self.view addSubview:self.mainVeneerView];
}

- (void)viewDidUnload
{
    self.mainVeneerView.delegate = nil;
    self.mainVeneerView.source = nil;
    
    self.mainVeneerView = nil;
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return YES;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Veneer

- (CGSize)sizeAtIndexPath:(NSIndexPath *)path forVeneerView:(KSVeneerView *)view
{
    return CGSizeMake(512.0, 512.0);
}

- (UIView *)viewAtIndexPath:(NSIndexPath *)path forVeneerView:(KSVeneerView *)view
{
    Image *image = [self.mainFetchedResultsController objectAtIndexPath:path];
    KSImageView *cell = (KSImageView *)[view dequeueReusableCellWithIdentifier:@"KSImageView"];
    cell.image = image.image;
    
    return cell;
}

- (NSInteger)numberOfSectionsInVeneerView:(KSVeneerView *)view
{
    return [[self.mainFetchedResultsController sections] count];
}

- (NSInteger)numberOfCellsInSection:(NSInteger)section inVeneerView:(KSVeneerView *)view
{
    return [[[self.mainFetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

@end
