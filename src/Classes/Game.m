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
	GameScreen *gs=[[GameScreen alloc] initWithDefaultOrientation];
	[self addChild:gs];
	[gs release];
}
@end
