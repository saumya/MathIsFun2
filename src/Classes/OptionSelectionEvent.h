//
//  OptionSelectionEvent.h
//  MathIsFun
//
//  Created by saumya ray on 10/12/10.
//  http://www.saumyaray.com , twit me @saumya
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>

#define EVENT_TYPE_BEGIN_GAME @"beginGameEvent"

@interface OptionSelectionEvent : SPEvent 
{

}

-(id)initWithType:(NSString *)type bubbles:(BOOL)bubbles;

@end
