//
//  ShadowText.m
//  MathIsFun
//
//  Created by saumya ray on 10/29/10.
//  http://www.saumyaray.com , twit me @saumya
//

#import "GameAddition+ShadowText.h"


@implementation GameAddition(ShadowText)

-(SPSprite *)makeText:(NSString *)text withColor:(int)colorValue andSize:(int)size withShadowColor:(int)shadowColor
{
	SPSprite *shadowdedContent;
	SPTextField *content;
	SPTextField *contentShadow;
	
	shadowdedContent=[SPSprite sprite];
	
	content=[SPTextField textFieldWithWidth:300 
									 height:60 
									   text:[NSString stringWithString:text] 
								   fontName:@"Helvetica" 
								   fontSize:size 
									  color:colorValue];
	contentShadow=[SPTextField textFieldWithWidth:300 
										   height:60 
											 text:[NSString stringWithString:text] 
										 fontName:@"Helvetica" 
										 fontSize:size 
											color:shadowColor];
	
	contentShadow.x=content.x+1;
	contentShadow.y=content.y+1;
	[shadowdedContent addChild:contentShadow];
	[shadowdedContent addChild:content];
	
	return shadowdedContent;
}

@end
