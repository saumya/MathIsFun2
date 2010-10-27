//
//  Splash.h
//  MathIsFun2
//
//  Created by saumya ray on 9/18/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>
#import <SplashAnimationEndEvent.h>


@interface Splash : SPSprite 
{
	NSInteger count;
	Boolean isIncreasing;
	NSInteger bounceSpeed;
	
	SPSprite *quadContainer;
	
	SPSprite *spOne;
	SPSprite *spTwo;
	SPSprite *spThree;
	SPSprite *spFour;
	
	SPQuad *oneS;
	SPQuad *twoS;
	SPQuad *threeS;
	SPQuad *fourS;
	
}

@property (assign) NSInteger count;
@property (assign) Boolean isIncreasing;
@property (assign) NSInteger bounceSpeed;
@property (assign) SPSprite *quadContainer;

@property (assign) SPSprite *spOne;
@property (assign) SPSprite *spTwo;
@property (assign) SPSprite *spThree;
@property (assign) SPSprite *spFour;

@property (assign) SPQuad *oneS;
@property (assign) SPQuad *twoS;
@property (assign) SPQuad *threeS;
@property (assign) SPQuad *fourS;


-(id)initWithSplash;
-(void)initTheSplash;
-(void)bounce:(SPSprite *)squareObject;
-(void)notifyAnimationEnd;

@end
