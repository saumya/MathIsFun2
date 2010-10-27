//
//  OptionSprite.m
//  MathIsFun
//
//  Created by saumya ray on 10/11/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "OptionSprite.h"


@implementation OptionSprite

@synthesize background;
@synthesize optionAddition;
@synthesize optionSubtraction;
@synthesize optionMultiplication;
@synthesize optionDivision;
@synthesize bgAddition;
@synthesize bgSubtraction;
@synthesize bgMultiplication;
@synthesize bgDivision;
@synthesize add;
@synthesize addShadow;
@synthesize subtract;
@synthesize subtractShadow;
@synthesize multiply;
@synthesize multiplyShadow;
@synthesize divide;
@synthesize divideShadow;

@synthesize titleSprite;
@synthesize footerSprite;

-(id)initWithDefault
{
	if (self=[super init]) {
		//custom code
		[self renderDefault];
	}
	return self;
}

-(void) renderDefault
{
	NSLog(@"renderDefaut : ");
	
	self.background=[self makeSquareWithColor:0x2F2D37 andWidth:320 andHeight:480];
	[self addChild:background];
	
	self.titleSprite=[self makeText:@"Choose a type to play. Then finish up as many as you can. Feedback is almost immediate and it will not go forward unless you give the correct feedback." 
						  withColor:0x655F81 
							andSize:20 
					withShadowColor:0x000000];
	self.titleSprite.x=10;
	self.titleSprite.y=5;
	
	self.footerSprite=[self makeText:@"When correct answer is provided, it waits for sometime, just to make you aware about the questions and your answers. What are you waiting for?" 
						   withColor:0x655F81 
							 andSize:20 
					 withShadowColor:0x000000];
	self.footerSprite.x=10;
	self.footerSprite.y=350;
	
	[self addChild:titleSprite];
	[self addChild:footerSprite];
	
	self.optionAddition=[SPSprite sprite];
	self.optionSubtraction=[SPSprite sprite];
	self.optionMultiplication=[SPSprite sprite];
	self.optionDivision=[SPSprite sprite];
	
	self.bgAddition=[self makeSquareWithColor:0xFF0000 andWidth:100 andHeight:100];
	self.bgSubtraction=[self makeSquareWithColor:0x00FF00 andWidth:100 andHeight:100];
	self.bgMultiplication=[self makeSquareWithColor:0xFFFF00 andWidth:100 andHeight:100];
	self.bgDivision=[self makeSquareWithColor:0xFF00FF andWidth:100 andHeight:100];
	
	self.add=[self makeSymbol:@"+" withColor:0x8C0000];//8C0000
	self.addShadow=[self makeSymbol:@"+" withColor:0xF86F14];
	self.addShadow.x=self.add.x+1;
	self.addShadow.y=self.add.y+1;
	self.subtract=[self makeSymbol:@"-" withColor:0x064C1B]; //0x324200
	self.subtractShadow=[self makeSymbol:@"-" withColor:0xB3FB77];
	self.subtractShadow.x=self.subtract.x+2;
	self.subtractShadow.y=self.subtract.y+2;
	self.multiply=[self makeSymbol:@"x" withColor:0x3F3F23];
	self.multiplyShadow=[self makeSymbol:@"x" withColor:0xCE6622];
	self.multiplyShadow.x=self.multiply.x+1;
	self.multiplyShadow.y=self.multiply.y+1;
	self.divide=[self makeSymbol:@"/" withColor:0x331935];
	self.divideShadow=[self makeSymbol:@"/" withColor:0xD4AAD6];
	self.divideShadow.x=self.divide.x+1;
	self.divideShadow.y=self.divide.y+1;
	
	
	//placing them in position
	[self.optionAddition addChild:self.bgAddition];
	[self.optionAddition addChild:self.addShadow];
	[self.optionAddition addChild:self.add];
	
	[self.optionSubtraction addChild:self.bgSubtraction];
	[self.optionSubtraction addChild:self.subtractShadow];
	[self.optionSubtraction addChild:self.subtract];
	
	[self.optionMultiplication addChild:self.bgMultiplication];
	[self.optionMultiplication addChild:self.multiplyShadow];
	[self.optionMultiplication addChild:self.multiply];
	
	[self.optionDivision addChild:self.bgDivision];
	[self.optionDivision addChild:self.divideShadow];
	[self.optionDivision addChild:self.divide];
	
	self.optionAddition.x=55;
	self.optionAddition.y=135;//165
	self.optionSubtraction.x=165;
	self.optionSubtraction.y=135;
	self.optionMultiplication.x=55;
	self.optionMultiplication.y=245;
	self.optionDivision.x=165;
	self.optionDivision.y=245;
	
	//
	[self addChild:[self optionAddition]];
	[self addChild:[self optionSubtraction]];
	[self addChild:[self optionMultiplication]];
	[self addChild:[self optionDivision]];
	//adds the event handlers
	[[self optionAddition] addEventListener:@selector(onAddOptionSelect:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
	[[self optionSubtraction] addEventListener:@selector(onSubtractSelect:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
	[[self optionMultiplication] addEventListener:@selector(onMultiplySelect:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
	[[self optionDivision] addEventListener:@selector(onDivideSelect:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
}

-(SPTextField *)makeSymbol:(NSString *)type withColor:(int)colorValue
{
	SPTextField *questionSymbol;
	questionSymbol=[SPTextField textFieldWithWidth:80 
												 height:94 
												   text:[NSString stringWithString:type] 
											   fontName:@"Helvetica" 
											   fontSize:100.0f 
												  color:colorValue];
	questionSymbol.x=10;
	questionSymbol.y=-5;
	if (type==@"/") {
		questionSymbol.y=+5;
	}
	
	return questionSymbol;
}

-(SPQuad *)makeSquareWithColor:(int)colorValue andWidth:(int)widthValue andHeight:(int)heightValue
{
	SPQuad *newQuad;
	newQuad=[SPQuad quadWithWidth:widthValue height:heightValue];
	newQuad.color=colorValue;
	return newQuad;
}

-(SPTextField *)makeText:(NSString *)text withColor:(int)colorValue andSize:(int)size
{
	SPTextField *questionSymbol;
	questionSymbol=[SPTextField textFieldWithWidth:320 
											height:100 
											  text:[NSString stringWithString:text] 
										  fontName:@"Helvetica" 
										  fontSize:size 
											 color:colorValue];
	
	return questionSymbol;
}

-(SPSprite *)makeText:(NSString *)text withColor:(int)colorValue andSize:(int)size withShadowColor:(int)shadowColor
{
	SPSprite *shadowdedContent;
	SPTextField *content;
	SPTextField *contentShadow;
	
	shadowdedContent=[SPSprite sprite];
	
	content=[SPTextField textFieldWithWidth:300 
									 height:120 
									   text:[NSString stringWithString:text] 
								   fontName:@"Helvetica" 
								   fontSize:size 
									  color:colorValue];
	contentShadow=[SPTextField textFieldWithWidth:300 
										   height:120 
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

-(void)onAddOptionSelect:(SPTouchEvent *)event
{
	//NSLog(@"OptionSprite : onAddOptionSelect : ");
	SPTouch *touch = [[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] anyObject];
	if (touch) {
		//NSLog(@"---------ADD option---selected-------");
		OptionSelectionEvent *opEvt=[[OptionSelectionEvent alloc] initWithType:EVENT_TYPE_OPTION_ADD bubbles:TRUE];
		[self dispatchEvent:opEvt];
		[opEvt release];
	}
}
-(void)onSubtractSelect:(SPTouchEvent *)event
{
	//NSLog(@"OptionSprite : onSubtractSelect : ");
	SPTouch *touch=[[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] anyObject];
	if (touch) {
		//NSLog(@"--------SUBTRACT option---selected----");
		OptionSelectionEvent *opEvt=[[OptionSelectionEvent alloc] initWithType:EVENT_TYPE_OPTION_SUBTRACT bubbles:TRUE];
		[self dispatchEvent:opEvt];
		[opEvt release];
	}
}

-(void)onMultiplySelect:(SPTouchEvent *)event
{
	//NSLog(@"TODO: Multiply selection ");
	SPTouch *touch=[[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] anyObject];
	if (touch) {
		//NSLog(@"--------SUBTRACT option---selected----");
		OptionSelectionEvent *opEvt=[[OptionSelectionEvent alloc] initWithType:EVENT_TYPE_OPTION_MULTIPLY bubbles:TRUE];
		[self dispatchEvent:opEvt];
		[opEvt release];
	}
}

-(void)onDivideSelect:(SPTouchEvent *)event
{
	//NSLog(@"TODO: Divide selection ");
	SPTouch *touch=[[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] anyObject];
	if (touch) {
		//NSLog(@"--------SUBTRACT option---selected----");
		OptionSelectionEvent *opEvt=[[OptionSelectionEvent alloc] initWithType:EVENT_TYPE_OPTION_DEVIDE bubbles:TRUE];
		[self dispatchEvent:opEvt];
		[opEvt release];
	}
}

@end
