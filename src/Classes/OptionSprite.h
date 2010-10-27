//
//  OptionSprite.h
//  MathIsFun
//
//  Created by saumya ray on 10/11/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>
#import <OptionSelectionEvent.h>


@interface OptionSprite : SPSprite 
{
	SPQuad *background;
	
	SPSprite *optionAddition;
	SPSprite *optionSubtraction;
	SPSprite *optionMultiplication;
	SPSprite *optionDivision;
	
	SPQuad *bgAddition;
	SPQuad *bgSubtraction;
	SPQuad *bgMultiplication;
	SPQuad *bgDivision;
	
	SPTextField *add;
	SPTextField *addShadow;
	SPTextField *subtract;
	SPTextField *subtractShadow;
	SPTextField *multiply;
	SPTextField *multiplyShadow;
	SPTextField *divide;
	SPTextField *divideShadow;
	
	SPSprite *titleSprite;
	SPSprite *footerSprite;
}

-(id)initWithDefault;
-(void) renderDefault;

-(SPTextField *)makeSymbol:(NSString *)type withColor:(int)colorValue;
-(SPTextField *)makeText:(NSString *)text withColor:(int)colorValue andSize:(int)size;
-(SPSprite *)makeText:(NSString *)text withColor:(int)colorValue andSize:(int)size withShadowColor:(int)shadow;
-(SPQuad *)makeSquareWithColor:(int)colorValue andWidth:(int)widthValue andHeight:(int)heightValue;

-(void)onAddOptionSelect:(SPTouchEvent *)event;
-(void)onSubtractSelect:(SPTouchEvent *)event;


@property (assign) SPQuad *background;
@property (assign) SPSprite *optionAddition;
@property (assign) SPSprite *optionSubtraction;
@property (assign) SPSprite *optionMultiplication;
@property (assign) SPSprite *optionDivision;
@property (assign) SPQuad *bgAddition;
@property (assign) SPQuad *bgSubtraction;
@property (assign) SPQuad *bgMultiplication;
@property (assign) SPQuad *bgDivision;
@property (assign) SPTextField *add;
@property (assign) SPTextField *addShadow;
@property (assign) SPTextField *subtract;
@property (assign) SPTextField *subtractShadow;
@property (assign) SPTextField *multiply;
@property (assign) SPTextField *multiplyShadow;
@property (assign) SPTextField *divide;
@property (assign) SPTextField *divideShadow;

@property (assign) SPSprite *titleSprite;
@property (assign) SPSprite *footerSprite;

@end
