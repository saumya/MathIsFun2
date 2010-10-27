//
//  CorrectAnswerEvent.m
//  MathIsFun2
//
//  Created by saumya ray on 10/9/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "CorrectAnswerEvent.h"


@implementation CorrectAnswerEvent

-(id)initWithType:(NSString *)type bubbles:(BOOL)bubbles
{
	if (self=[super initWithType:type bubbles:NO]) {
		//animComplete=result;
	}
	return self;
}

@end
