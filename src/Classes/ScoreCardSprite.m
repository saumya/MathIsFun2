//
//  ScoreCardSprite.m
//  MathIsFun
//
//  Created by saumya ray on 10/29/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "ScoreCardSprite.h"


@implementation ScoreCardSprite

@synthesize scored;
@synthesize missed;
@synthesize asked;
@synthesize score;
@synthesize miss;
@synthesize ask;

-(id)initWithDefault
{
	if (self=[super init]) {
		//custom code
		[self renderDefault];
	}
	return self;
}

-(void)renderDefault
{
	self.scored=[SPTextField textFieldWithWidth:100 
										 height:20 
										   text:[NSString stringWithString:[NSString stringWithFormat:@"Scored : %i",000]] 
									   fontName:@"Helvetica" 
									   fontSize:15 
										  color:0xAAAAAA];
	self.missed=[SPTextField textFieldWithWidth:100 
										 height:20 
										   text:[NSString stringWithString:[NSString stringWithFormat:@"Missed : %i",000]] 
									   fontName:@"Helvetica" 
									   fontSize:15 
										  color:0xAAAAAA];
	self.asked=[SPTextField textFieldWithWidth:100 
										 height:20 
										   text:[NSString stringWithString:[NSString stringWithFormat:@"Asked : %i",000]] 
									   fontName:@"Helvetica" 
									   fontSize:15 
										  color:0xAAAAAA];
	self.scored.x=0;
	self.missed.x=150;
	self.asked.x=75;
	self.asked.y=25;
	[self addChild:self.scored];
	[self addChild:self.missed];
	[self addChild:self.asked];
	self.score=0;
	self.miss=0;
	self.ask=0;
	//
}

-(void)updateScore:(int)newScore andMiss:(int)missCount andAsked:(int)askCount
{
	self.score=(NSInteger *) newScore;
	self.miss=(NSInteger *)missCount;
	self.ask=(NSInteger *)askCount;
	self.scored.text=[NSString stringWithFormat:@"Scored : %i",self.score];
	self.missed.text=[NSString stringWithFormat:@"Missed : %i",self.miss];
	self.asked.text=[NSString stringWithFormat:@"Asked : %i",self.ask];
}

@end
