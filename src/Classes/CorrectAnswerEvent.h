//
//  CorrectAnswerEvent.h
//  MathIsFun2
//
//  Created by saumya ray on 10/9/10.
//  http://www.saumyaray.com , twit me @saumya
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
