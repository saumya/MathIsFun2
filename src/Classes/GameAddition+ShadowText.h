//
//  ShadowText.h
//  MathIsFun
//
//  Created by saumya ray on 10/29/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <GameAddition.h>


@interface GameAddition (ShadowText) 

-(SPSprite *)makeText:(NSString *)text 
			withColor:(int)colorValue 
			  andSize:(int)size 
	  withShadowColor:(int)shadowColor;

@end
