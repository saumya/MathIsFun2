//
//  SplashAnimationEndEvent.m
//  MathIsFun2
//
//  Created by saumya ray on 10/5/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "SplashAnimationEndEvent.h"


@implementation SplashAnimationEndEvent

@synthesize result=animComplete;
-(id)initWithType:(NSString *)type result:(BOOL)result bubbles:(BOOL)bubbles
{
	if (self=[super initWithType:type bubbles:NO]) {
		animComplete=result;
	}
	return self;
}

@end
