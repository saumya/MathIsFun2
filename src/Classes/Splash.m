//
//  Splash.m
//  MathIsFun2
//
//  Created by saumya ray on 9/18/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "Splash.h"

@implementation Splash

@synthesize count;
@synthesize isIncreasing;
@synthesize bounceSpeed;
@synthesize quadContainer;
@synthesize spOne;
@synthesize spTwo;
@synthesize spThree;
@synthesize spFour;
@synthesize oneS;
@synthesize twoS;
@synthesize threeS;
@synthesize fourS;

-(id)initWithSplash
{
	if (self=[super init]) {
		//any customisation
        [self initTheSplash];
	}
	//add the event listeners
	[self addEventListener:@selector(onEachFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
	
	return self;
}

-(void)initTheSplash
{
	self.isIncreasing=NO;
	self.bounceSpeed=2;
	
	self.quadContainer=[SPSprite sprite];
	[self addChild:[self quadContainer]];
	//NSLog(@"width= %@ ",[[self stage] width]);
	//positioning the container
	[self quadContainer].x=65+40;
	[self quadContainer].y=135+40;
	
	oneS=[SPQuad quadWithWidth:100 height:100];
	[self oneS].color=0xff0000;
	[self oneS].x=-50;
	[self oneS].y=-50;
	//[[self quadContainer] addChild:[self oneS]];
	self.spOne=[SPSprite sprite];
	[self spOne].x=0;
	[self spTwo].y=0;
	[[self spOne] addChild:[self oneS]];
	[[self quadContainer] addChild:[self spOne]];
	
	twoS=[SPQuad quadWithWidth:100 height:100];
	[self twoS].color=0x00ff00;
	[self twoS].x=-50;
	[self twoS].y=-50;
	
	self.spTwo=[SPSprite sprite];
	[self spTwo].x=110;
	[self spTwo].y=0;
	[[self spTwo] addChild:[self twoS]];
	[[self quadContainer] addChild:[self spTwo]];
	
	threeS=[SPQuad quadWithWidth:100 height:100];
	[self threeS].color=0xffff00;
	[self threeS].x=-50;
	[self threeS].y=-50;
	
	self.spThree=[SPSprite sprite];
	[self spThree].x=0;
	[self spThree].y=110;
	[[self spThree] addChild:[self threeS]];
	[[self quadContainer] addChild:[self spThree]];
	
	fourS=[SPQuad quadWithWidth:100 height:100];
	[self fourS].color=0xff00ff;
	[self fourS].x=-50;
	[self fourS].y=-50;
	
	self.spFour=[SPSprite sprite];
	[self spFour].x=110;
	[self spFour].y=110;
	[[self spFour] addChild:[self fourS]];
	[[self quadContainer] addChild:[self spFour]];
}

-(void)onEachFrame:(SPEnterFrameEvent *)event
{
	//NSLog(@"---%i",self.count++);
	[self bounce:[self spOne]];
	[self bounce:[self spTwo]];
	[self bounce:[self spThree]];
	[self bounce:[self spFour]];
}

-(void)bounce:(SPSprite *)squareObject
{
	
	//[self quadContainer].x+=0.1;
	//NSLog(@"---- %i",self.count++);
	if ([self count]>=2) {
		[self removeEventListener:@selector(onEachFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
		[self notifyAnimationEnd];
	}else {
		if ([self isIncreasing]==NO) {
			if ([squareObject width]>=50) {
				squareObject.width-=[self bounceSpeed];
				squareObject.height-=[self bounceSpeed];
			}else {
				self.isIncreasing=YES;
			}
		}else {
			if ([squareObject width]<=100) {
				squareObject.width+=[self bounceSpeed];
				squareObject.height+=[self bounceSpeed];
			}else {
				self.isIncreasing=NO;
				self.count++;
			}
		}	
	}

}

-(void)notifyAnimationEnd
{
	//NSLog(@"TODO: dispatch an event to say splash animation has ended!");
	SplashAnimationEndEvent *event=[[SplashAnimationEndEvent alloc]
									initWithType:EVENT_TYPE_SPLASH_ANIMATION_COMPLETE result:YES bubbles:FALSE];
	[self dispatchEvent:event];
	[event release];
}
	



@end
