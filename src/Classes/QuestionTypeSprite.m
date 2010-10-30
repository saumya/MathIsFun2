//
//  QuestionTypeSprite.m
//  MathIsFun2
//
//  Created by saumya ray on 10/6/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "QuestionTypeSprite.h"


@implementation QuestionTypeSprite

@synthesize border;
@synthesize background;
@synthesize questionSymbol;
@synthesize questionShadow;
@synthesize userDefinedX;
@synthesize userDefinedY;
@synthesize question;
@synthesize isCorrectAnswer;
@synthesize rightImage;
@synthesize wrongImage;
@synthesize isOptionButton;
@synthesize mode;

-(id)initWithType:(NSString *)type
{
	if (self=[super init]) {
		//custom code
		[self renderThisType:type];
	}
	return self;
}

-(id)initWithOperand:(NSString *)operand havingPosX:(int)xPos andPosY:(int)yPos
{
	if (self=[super init]) {
		self.border=[SPQuad quadWithWidth:74 height:74];
		self.border.color=0x6B380C;
		self.background=[SPQuad quadWithWidth:70 height:70];
		self.background.color=0xDB6600;
		
		[self addChild:[self border]];
		[self addChild:[self background]];
		
		//makes the symbol
		self.questionSymbol=[SPTextField textFieldWithWidth:80 
													 height:94 
													   text:operand 
												   fontName:@"Helvetica" 
												   fontSize:60.0f 
													  color:0x6B380C];
		questionSymbol.hAlign=SPHAlignLeft;
		questionSymbol.vAlign=SPVAlignBottom;
		questionSymbol.border=NO;
		
		//makes the question shadow
		self.questionShadow=[SPTextField textFieldWithWidth:80
													 height:94
													   text:operand 
												   fontName:@"Helvetica" 
												   fontSize:60.0f 
													  color:0xff7700];
		
		questionShadow.hAlign=SPHAlignLeft;
		questionShadow.vAlign=SPVAlignBottom;
		questionShadow.border=NO;
		//adds both the things
		[self addChild:questionShadow];
		[self addChild:questionSymbol];
		
		//position elements
		self.border.x=xPos-2;//2 pixel border
		self.border.y=yPos-2;
		self.background.x=xPos;
		self.background.y=yPos;
		self.questionSymbol.x=xPos;
		self.questionSymbol.y=yPos-25;
		self.questionShadow.x=xPos+1;
		self.questionShadow.y=yPos-24;
		
	}
	return self;
}

-(id)initWithOption:(int)option havingPosX:(int)xPos andPosY:(int)yPos
{
	if (self=[super init]) {
		self.border=[SPQuad quadWithWidth:74 height:74];
		self.border.color=0x324200;
		
		self.background=[SPQuad quadWithWidth:70 height:70];
		self.background.color=0xafb502;
		
		[self addChild:[self border]];
		[self addChild:[self background]];
		
		//makes the symbol
		self.questionSymbol=[SPTextField textFieldWithWidth:80 
													 height:94 
													   text:[NSString stringWithFormat:@"%i",option] 
												   fontName:@"Helvetica" 
												   fontSize:60.0f 
													  color:0x324200];
		questionSymbol.hAlign=SPHAlignLeft;
		questionSymbol.vAlign=SPVAlignBottom;
		questionSymbol.border=NO;
		//makes the question shadow
		self.questionShadow=[SPTextField textFieldWithWidth:80
													 height:94
													   text:[NSString stringWithFormat:@"%i",option] 
												   fontName:@"Helvetica" 
												   fontSize:60.0f 
													  color:0xF2FA05];
		
		questionShadow.hAlign=SPHAlignLeft;
		questionShadow.vAlign=SPVAlignBottom;
		questionShadow.border=NO;
		[self addChild:questionShadow];
		[self addChild:questionSymbol];
		
		//position elements
		self.border.x=xPos-2;//2 pixel border
		self.border.y=yPos-2;
		self.background.x=xPos;
		self.background.y=yPos;
		self.questionSymbol.x=xPos;
		self.questionSymbol.y=yPos-25;
		self.questionShadow.x=xPos+1;
		self.questionShadow.y=yPos-24;
		
		//finally initialising the other properties
		self.isCorrectAnswer=NO;
		//adds event listeners for these
		[self addEventListener:@selector(onOptionSelect:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
		
	}
	return self;
}

-(void)renderThisType:(NSString *)type
{
	self.border=[SPQuad quadWithWidth:80 height:80];
	self.border.x=108;
	self.border.y=188;
	self.border.color=0xffffff;
	self.background=[SPQuad quadWithWidth:70 height:70];
	self.background.x=110;
	self.background.y=190;
	//
	[self addChild:[self border]];
	[self addChild:[self background]];
	
	//checks for the type and puts the color accordingly
	if (type==@"+") {
		self.background.color=0xff0000;
	}else if (type==@"-") {
		self.background.color=0x00ff00;
	}else if (type==@"x") {
		self.background.color=0xffff00;
	}else if (type==@"/") {
		self.background.color=0xff00ff;
	}else {
		self.background.color=0xffffff;
	}
	//makes the symbol
	self.questionSymbol=[SPTextField textFieldWithWidth:80 
												 height:94 
												   text:type 
											   fontName:@"Helvetica" 
											   fontSize:120.0f 
												  color:0xffffff];
	questionSymbol.hAlign=SPHAlignLeft;
	questionSymbol.vAlign=SPVAlignBottom;
	questionSymbol.border=NO;
	//makes the question shadow
	self.questionShadow=[SPTextField textFieldWithWidth:80
												 height:94
												   text:type 
											   fontName:@"Helvetica" 
											   fontSize:120.0f 
												  color:0x000000];
	
	questionShadow.hAlign=SPHAlignLeft;
	questionShadow.vAlign=SPVAlignBottom;
	questionShadow.border=NO;
	
	//add to the display list
	[self addChild:questionShadow];
	[self addChild:questionSymbol];
	//position elements
	self.questionSymbol.x=125;
	self.questionSymbol.y=200;
	self.questionShadow.x=126;
	self.questionShadow.y=201;
	
	//adds event listeners for these
	[self addEventListener:@selector(onOptionSelect:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
}

-(void)setTypeOfOperation:(NSString *)type
{
	NSString *s=[NSString stringWithString:type];
	self.questionSymbol.text=s;
	self.questionShadow.text=s;
	
	//checks for the type and puts the color accordingly
	if (type==@"+") {
		self.mode=[NSString stringWithString:@"add"];
		self.background.color=0xff0000;
		//position elements
		self.questionSymbol.x=self.userDefinedX+4;
		self.questionSymbol.y=self.userDefinedY+4;
		self.questionShadow.x=self.userDefinedX+5;
		self.questionShadow.y=self.userDefinedY+5;
	}else if (type==@"-") {
		self.mode=[NSString stringWithString:@"subtract"];
		self.background.color=0x00ff00;
		//position elements
		self.questionSymbol.x=self.userDefinedX+19;
		self.questionSymbol.y=self.userDefinedY+9;
		self.questionShadow.x=self.userDefinedX+20;
		self.questionShadow.y=self.userDefinedY+10;
	}else if (type==@"x") {
		self.mode=[NSString stringWithString:@"multiply"];
		self.background.color=0xffff00;
		//position elements
		self.questionSymbol.x=self.userDefinedX+9;
		self.questionSymbol.y=self.userDefinedY+6;
		self.questionShadow.x=self.userDefinedX+10;
		self.questionShadow.y=self.userDefinedY+7;
	}else if (type==@"/") {
		self.mode=[NSString stringWithString:@"divide"];
		self.background.color=0xff00ff;
		//position elements
		self.questionSymbol.x=self.userDefinedX+26;
		self.questionSymbol.y=self.userDefinedY+7;
		self.questionShadow.x=self.userDefinedX+27;
		self.questionShadow.y=self.userDefinedY+8;
	}else {
		self.background.color=0xffffff;
	}
}

-(void)setQuestionValue:(int)value
{
	NSString *s=[NSString stringWithFormat:@"%i",value];
	//positioning in right place
	if (value<=9) {
		s=[NSString stringWithFormat:@" %i",value];
	}
	self.questionSymbol.text=s;
	self.questionShadow.text=s;
	self.question=value;
}

-(void)moveToPosX:(float)xPos andPosY:(float)yPos
{	
	self.userDefinedX=xPos;
	self.userDefinedY=yPos;
	
	self.border.x=xPos;
	self.border.y=yPos;
	self.background.x=xPos+5;
	self.background.y=yPos+5;
}

-(void)resetResponseImage
{
	self.border.color=0x324200;
}

-(void)onOptionSelect:(SPTouchEvent *)event
{
	SPTouch *touch = [[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] anyObject];
    if (touch)
    {
		if (self.isOptionButton==TRUE) {
			//Do not need as the option is now by rotation of the device
		}else {
			if (self.isCorrectAnswer) {
				self.border.color=0x00ff00;
				//Will dispatch an event
				CorrectAnswerEvent *caEvt=[[CorrectAnswerEvent alloc] initWithType:EVENT_TYPE_CORRECT_ANSWER bubbles:true];
				[self dispatchEvent:caEvt];
				[caEvt release];
			}else if(self.isCorrectAnswer==FALSE){
				self.border.color=0xff0000;
				CorrectAnswerEvent *waEvt=[[CorrectAnswerEvent alloc] initWithType:EVENT_TYPE_WRONG_ANSWER bubbles:true];
				[self dispatchEvent:waEvt];
				[waEvt release];
			}
		}
    }	
}
	

@end
