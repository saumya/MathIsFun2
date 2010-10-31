//
//  GameScreen.m
//  MathIsFun2
//
//  Created by saumya ray on 10/6/10.
//  http://www.saumyaray.com , twit me @saumya
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
	[gameAddition showInfo];
	[self addChild:gameAddition];
	[gameAddition release];
}

@end
