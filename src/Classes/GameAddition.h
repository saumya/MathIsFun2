//
//  GameAddition.h
//  MathIsFun2
//
//  Created by saumya ray on 10/6/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>
#import <QuestionTypeSprite.h>
#import <OptionSprite.h>
#import <OptionSelectionEvent.h>

@interface GameAddition : SPSprite
{
	SPQuad *background;
	SPSprite *questionType;
	
	QuestionTypeSprite *qType;
	
	NSInteger *operandOne;
	NSInteger *operandTwo;
	
	QuestionTypeSprite *operandA;
	QuestionTypeSprite *operandB;
	QuestionTypeSprite *optionA;
	QuestionTypeSprite *optionB;
	QuestionTypeSprite *optionC;
	
	NSInteger *timerCounter;
	
	OptionSprite *optionSelectionSprite;
}

@property (assign) SPQuad *background;
@property (assign) SPSprite *questionType;

@property (assign) QuestionTypeSprite *qType;

@property (assign) NSInteger *operandOne;
@property (assign) NSInteger *operandTwo;

@property (assign) QuestionTypeSprite *operandA;
@property (assign) QuestionTypeSprite *operandB;
@property (assign) QuestionTypeSprite *optionA;
@property (assign) QuestionTypeSprite *optionB;
@property (assign) QuestionTypeSprite *optionC;

@property (assign) NSInteger *timerCounter;

@property (assign) OptionSprite *optionSelectionSprite;


-(id)initGame;
-(void)renderGame;
-(void)initGameAgain;
-(int) generateRandom:(int)maxValue;
-(void)waitAndInitAgain;

-(void) onWrongAnswer:(CorrectAnswerEvent *)event;
-(void) onCorrectAnswer:(CorrectAnswerEvent *)event;

-(void)onAddSelect:(OptionSelectionEvent *)event;
-(void)onSubtractSelect:(OptionSelectionEvent *)event;
-(void)showOptions:(BOOL)option;

@end
