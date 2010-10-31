//
//  ShadowText.h
//  MathIsFun
//
//  Created by saumya ray on 10/29/10.
//  http://www.saumyaray.com , twit me @saumya
//

#import <GameAddition.h>


@interface GameAddition (ShadowText) 

-(SPSprite *)makeText:(NSString *)text 
			withColor:(int)colorValue 
			  andSize:(int)size 
	  withShadowColor:(int)shadowColor;
-(void)showInfo;

@end
