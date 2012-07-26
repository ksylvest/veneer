//
//  KSViewController.h
//  Example
//
//  Created by Kevin Sylvestre on 7/26/12.
//  Copyright (c) 2012 Kevin Sylvestre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Veneer.h"

@interface KSViewController : UIViewController <KSVeneerViewDelegate, KSVeneerViewDataSource>

@property (strong, nonatomic) KSVeneerView *mainVeneerView;

@property (strong, nonatomic) NSFetchedResultsController *mainFetchedResultsController;

@end
