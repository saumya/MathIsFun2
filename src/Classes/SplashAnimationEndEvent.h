//
//  SplashAnimationEndEvent.h
//  MathIsFun2
//
//  Created by saumya ray on 10/5/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>

#define EVENT_TYPE_SPLASH_ANIMATION_COMPLETE @"splashAnimationCompleted"


@interface SplashAnimationEndEvent : SPEvent
{
	BOOL animComplete;
}

-(id)initWithType:(NSString *)type result:(BOOL)result bubbles:(BOOL)bubbles;
@property (nonatomic,readonly) BOOL result;

@end
