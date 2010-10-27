//
//  GameScreen.m
//  MathIsFun2
//
//  Created by saumya ray on 10/6/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "GameScreen.h"


@implementation GameScreen

-(id)initWithDefaultOrientation
{
	if (self=[super init]) {
		[self initThis];
	}
	return self;
}

-(void)initThis
{
	GameAddition *gameAddition=[[GameAddition alloc] initGame]; 
	[self addChild:gameAddition];
	[gameAddition release];
}

@end
