//
//  NSManagedObject+KSExtensions.m
//  VeneerDemo
//
//  Created by Kevin Sylvestre on 7/11/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import "NSManagedObject+KSExtensions.h"

#import "KSAppDelegate.h"

@implementation NSManagedObject (KSExtensions)

+ (NSManagedObjectContext *)KS_managedObjectContext
{
    KSAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    return [delegate managedObjectContext];
}

+ (void)KS_save
{
	NSManagedObjectContext *context = [self KS_managedObjectContext];
	[context save:NULL];
}

+ (void)KS_reset
{
	NSManagedObjectContext *context = [self KS_managedObjectContext];
    [context reset];
}

@end
