//
//  OptionSelectionEvent.h
//  MathIsFun
//
//  Created by saumya ray on 10/12/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>

#define EVENT_TYPE_OPTION_ADD @"AdditionOptionEvent"
#define EVENT_TYPE_OPTION_SUBTRACT @"SubtractOptionEvent"
#define EVENT_TYPE_OPTION_MULTIPLY @"MultiplyOptionEvent"
#define EVENT_TYPE_OPTION_DEVIDE @"DevideOptionEvent"

@interface OptionSelectionEvent : SPEvent 
{

}

-(id)initWithType:(NSString *)type bubbles:(BOOL)bubbles;

@end
