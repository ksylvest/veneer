//
//  KSAppDelegate.m
//  Example
//
//  Created by Kevin Sylvestre on 7/26/12.
//  Copyright (c) 2012 Kevin Sylvestre. All rights reserved.
//

#import "KSAppDelegate.h"

#import "KSSeed.h"

@implementation KSAppDelegate

@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)options
{
    [KSSeed seed];
    
    return YES;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Data

- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext == nil)
    {
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        if (coordinator != nil)
        {
            __managedObjectContext = [[NSManagedObjectContext alloc] init];
            [__managedObjectContext setPersistentStoreCoordinator:coordinator];
        }
    }
    
    return __managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel == nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Example" withExtension:@"momd"];
        __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    
    return __managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator == nil)
    {
        NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Example.sqlite"];
        
        NSError *error = nil;
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:NSMigratePersistentStoresAutomaticallyOption];
        
        __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        [__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    }
    
    return __persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *urls = [manager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *url = [urls lastObject];
    
    return url;
}

@end
