//
//  CorrectAnswerEvent.h
//  MathIsFun2
//
//  Created by saumya ray on 10/9/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>

#define EVENT_TYPE_CORRECT_ANSWER @"CorrectAnswerEvent"
#define EVENT_TYPE_WRONG_ANSWER @"WrongAnswerEvent"
#define EVENT_TYPE_SHOW_OPTION @"ShowOptionsEvent"

@interface CorrectAnswerEvent : SPEvent
{

}

-(id)initWithType:(NSString *)type bubbles:(BOOL)bubbles;

@end
