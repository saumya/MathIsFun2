//
//  Game.m
//  AppScaffold
//
//  Created by Daniel Sperl on 14.01.10.
//  Copyright 2010 Incognitek. All rights reserved.
//

#import "Game.h" 

@implementation Game

- (id)initWithWidth:(float)width height:(float)height
{
    if (self = [super initWithWidth:width height:height])
    {
		[self beginGame];
        
    }
    return self;
}

-(void) beginGame
{
	/*
	[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(orientationDetected:) 
												 name:@"UIDeviceOrientationDidChangeNotification" 
											   object:nil];
	*/ 
	GameScreen *gs=[[GameScreen alloc] initWithDefaultOrientation];
	[self addChild:gs];
	[gs release];
}
/*
-(void)orientationDetected:(UIEvent *)event
{
	NSLog(@"orientation Change : %i",[UIDevice currentDevice].orientation);
}
*/

@end
