//
//  Image.m
//  VeneerDemo
//
//  Created by Kevin Sylvestre on 7/11/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import "Image.h"
#import "KSExtensions.h"

@implementation Image

@dynamic identifier;
@dynamic path;

+ (id)findByIdentifier:(NSNumber *)identifier
{
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass(self) inManagedObjectContext:[self KS_managedObjectContext]];
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", identifier];
	
	[request setEntity:entity];
	[request setPredicate:predicate];

	NSArray *results = [[self KS_managedObjectContext] executeFetchRequest:request error:NULL];
	
	return [results lastObject];
}

+ (void)autoCreateOrUpdate:(NSArray *)objects
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass(self) inManagedObjectContext:[self KS_managedObjectContext]];
        
    for (NSDictionary *dictionary in objects)
    {
        id object = [self findByIdentifier:[dictionary objectForKey:@"identifier"]];
        if (!object) object = [[self alloc] initWithEntity:entity insertIntoManagedObjectContext:[self KS_managedObjectContext]];
        [object deserialize:dictionary];
    }
    
    [self KS_save];
}

+ (NSFetchedResultsController *)fetchedResultsController
{    
	NSArray *descriptors = [NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"identifier" ascending:NO]];
    
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass(self) inManagedObjectContext:[self KS_managedObjectContext]];
    
    [request setSortDescriptors:descriptors];
	[request setEntity:entity];
    
    return [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self KS_managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
}

- (void)deserialize:(NSDictionary *)dictionary
{
    self.identifier = [dictionary objectForKey:@"identifier"];
    self.path = [dictionary objectForKey:@"path"];
}

- (UIImage *)image
{
    return [UIImage imageNamed:self.path];
}

@end
