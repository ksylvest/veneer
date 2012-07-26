//
//  Image.h
//  VeneerDemo
//
//  Created by Kevin Sylvestre on 7/11/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Image : NSManagedObject

@property (nonatomic, retain) NSNumber *identifier;
@property (nonatomic, retain) NSString *path;

+ (void)autoCreateOrUpdate:(NSArray *)data;

+ (NSFetchedResultsController *)fetchedResultsController;

- (UIImage *)image;

@end
