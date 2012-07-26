//
//  KSSeed.m
//  VeneerDemo
//
//  Created by Kevin Sylvestre on 7/11/12.
//  Copyright (c) 2012 Pose. All rights reserved.
//

#import "KSSeed.h"

#import "Image.h"

@implementation KSSeed

+ (void)seed
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:[bundle pathForResource:@"Seed" ofType:@"plist"]];
        
    [Image autoCreateOrUpdate:[data objectForKey:@"images"]];
}


@end
