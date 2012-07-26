//
//  KSAppDelegate.h
//  Example
//
//  Created by Kevin Sylvestre on 7/26/12.
//  Copyright (c) 2012 Kevin Sylvestre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
