# Veneer

Veneer is a gorgeous grid view for iOS.

## Requirements

The gem is tested with:

* iOS 5.1
* Automatic Reference Counting (ARC)

## Installation

    gem install cocoapods
    pod setup

    platform :ios
    dependency 'AFNetworking', '0.9'

## Usage

    - (void)viewDidLoad
    {
      [super viewDidLoad];
      
      self.mainFetchedResultsController = [...];
      [self.mainFetchedResultsController performFetch:NULL];
      
      
      self.mainVeneerView = [[KSVeneerView alloc] initWithFrame:self.view.frame];
      
      self.mainVeneerView.delegate = self;
      self.mainVeneerView.source = self;
      
      [self.mainVeneerView registerNib:[UINib nibWithNibName:@"KSImageView" bundle:nil] forCellReuseIdentifier:@"KSImageView"];
      
      [self.mainVeneerView reload];
      
      [self.view addSubview:self.mainVeneerView];
    }
    
    - (CGSize)sizeAtIndexPath:(NSIndexPath *)path forVeneerView:(KSVeneerView *)view
    {
        return CGSizeMake(256.0, 256.0);
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


## Copyright

Copyright (c) 2012 - 2012 Kevin Sylvestre. See LICENSE for details.
