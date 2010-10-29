//
//  OptionSelectionEvent.h
//  MathIsFun
//
//  Created by saumya ray on 10/12/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>

#define EVENT_TYPE_BEGIN_GAME @"beginGameEvent"

@interface OptionSelectionEvent : SPEvent 
{

}

-(id)initWithType:(NSString *)type bubbles:(BOOL)bubbles;

@end
