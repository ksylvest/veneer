//
//  NSManagedObject+KSExtensions.h
//  VeneerDemo
//
//  Created by Kevin Sylvestre on 7/11/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (KSExtensions)

+ (NSManagedObjectContext *)KS_managedObjectContext;

+ (void)KS_save;
+ (void)KS_reset;

@end
