//
//  GameAddition.m
//  MathIsFun2
//
//  Created by saumya ray on 10/6/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "GameAddition.h"


@implementation GameAddition

@synthesize background;
@synthesize questionType;

@synthesize qType;

@synthesize operandOne;
@synthesize operandTwo;

@synthesize operandA;
@synthesize operandB;
@synthesize optionA;
@synthesize optionB;
@synthesize optionC;

@synthesize timerCounter;

@synthesize optionSelectionSprite;

-(id)initGame
{
	if (self=[super init]) {
		//customisation
		[self renderGame];
	}
	return self;
}

-(void)renderGame
{
	self.qType=[[QuestionTypeSprite alloc] initWithType:@"+"];
	self.qType.isOptionButton=TRUE;
	[self.qType moveToPosX:128 andPosY:146];
	[self addChild:[self qType]];
	//operand
	self.operandA=[[QuestionTypeSprite alloc] initWithOperand:@"0" havingPosX:56 andPosY:150];
	self.operandB=[[QuestionTypeSprite alloc] initWithOperand:@"0" havingPosX:210 andPosY:150];
	[self addChild:[self operandA]];
	[self addChild:[self operandB]];
	//options
	self.optionA=[[QuestionTypeSprite alloc] initWithOption:0 havingPosX:56 andPosY:240];
	self.optionB=[[QuestionTypeSprite alloc] initWithOption:0 havingPosX:133 andPosY:240];
	self.optionC=[[QuestionTypeSprite alloc] initWithOption:0 havingPosX:210 andPosY:240];
	[self addChild:[self optionA]];
	[self addChild:[self optionB]];
	[self addChild:[self optionC]];
	//
	self.optionSelectionSprite=[[OptionSprite alloc] initWithDefault];
	[self addChild:[self optionSelectionSprite]];
	//handler for option
	[[self optionSelectionSprite] addEventListener:@selector(onAddSelect:) atObject:self forType:EVENT_TYPE_OPTION_ADD];
	[[self optionSelectionSprite] addEventListener:@selector(onSubtractSelect:) atObject:self forType:EVENT_TYPE_OPTION_SUBTRACT];
	[[self optionSelectionSprite] addEventListener:@selector(onMultiplySelect:) atObject:self forType:EVENT_TYPE_OPTION_MULTIPLY];
	[[self optionSelectionSprite] addEventListener:@selector(onDivideSelect:) atObject:self forType:EVENT_TYPE_OPTION_DEVIDE];
	[self initGameAgain];
	
	//adds the event handlers
	[[self optionA] addEventListener:@selector(onCorrectAnswer:) atObject:self forType:EVENT_TYPE_CORRECT_ANSWER];
	[[self optionA] addEventListener:@selector(onWrongAnswer:) atObject:self forType:EVENT_TYPE_WRONG_ANSWER];
	[[self optionB] addEventListener:@selector(onCorrectAnswer:) atObject:self forType:EVENT_TYPE_CORRECT_ANSWER];
	[[self optionB] addEventListener:@selector(onWrongAnswer:) atObject:self forType:EVENT_TYPE_WRONG_ANSWER];
	[[self optionC] addEventListener:@selector(onCorrectAnswer:) atObject:self forType:EVENT_TYPE_CORRECT_ANSWER];
	[[self optionC] addEventListener:@selector(onWrongAnswer:) atObject:self forType:EVENT_TYPE_WRONG_ANSWER];
	//handler for option
	[[self qType] addEventListener:@selector(onShowOptions:) atObject:self forType:EVENT_TYPE_SHOW_OPTION];
	
}

-(int)generateRandom:(int)maxValue
{
	return ((1+arc4random())%(maxValue));
}

-(void)initGameAgain
{
	[[self qType] setTypeOfOperation:@"+"];
	self.timerCounter=0;
	//setting questions
	int a=[self generateRandom:10];
	int b=[self generateRandom:10];
	//checks whether both are set to zero
	if (a==0) {
		if (b==a) {
			b=[self generateRandom:5]+1;//just some kind of randomness, i am crazy!!!!
		}
	}
	[[self operandA] setQuestionValue:a];
	[[self operandB] setQuestionValue:b];
	//setting options
	//first the answer
	int c=a+b;
	//distractors
	int d=[self generateRandom:20];
	int e=[self generateRandom:30];
	//checks whether both the distractor and correct answer are not same!!
	if (d==c) {
		d=[self generateRandom:50]+[self generateRandom:10];//just some randomness
	}
	if (e==c) {
		e=[self generateRandom:25]+[self generateRandom:20];//just some randomness
	}
	
	//reset the correct answer
	[self optionA].isCorrectAnswer=NO;
	[self optionB].isCorrectAnswer=NO;
	[self optionC].isCorrectAnswer=NO;
	[[self optionA] resetResponseImage];
	[[self optionB] resetResponseImage];
	[[self optionC] resetResponseImage];
	
	//shufle the position of correct answer
	int rand=[self generateRandom:3];
	if (rand==1) {
		[[self optionA] setQuestionValue:c];
		[[self optionB] setQuestionValue:d];
		[[self optionC] setQuestionValue:e];
		[self optionA].isCorrectAnswer=YES;
	}else if (rand==2) {
		[[self optionB] setQuestionValue:c];
		[[self optionA] setQuestionValue:d];
		[[self optionC] setQuestionValue:e];
		[self optionB].isCorrectAnswer=YES;
	}else {
		[[self optionC] setQuestionValue:c];
		[[self optionA] setQuestionValue:e];
		[[self optionB] setQuestionValue:d];
		[self optionC].isCorrectAnswer=YES;
	}
}

-(void)initGameAgainWithSubtraction
{
	//setQuestionValue
	//[[self.qType].setQuestionValue]=@"1";
	[[self qType] setTypeOfOperation:@"-"];
	
	self.timerCounter=0;
	//setting questions
	int a=[self generateRandom:10];
	int b=[self generateRandom:10];
	//checks whether both are set to zero
	if (a==0) {
		a=5+[self generateRandom:5];
	}
	if (b>a) {
		a=5+[self generateRandom:5];
		b=[self generateRandom:5];
	}
	[[self operandA] setQuestionValue:a];
	[[self operandB] setQuestionValue:b];
	//setting options
	//first the answer
	int c=a-b;
	//distractors
	int d=[self generateRandom:20];
	int e=[self generateRandom:30];
	//checks whether both the distractor and correct answer are not same!!
	if (d==c) {
		d=[self generateRandom:50]+[self generateRandom:10];//just some randomness
	}
	if (e==c) {
		e=[self generateRandom:25]+[self generateRandom:20];//just some randomness
	}
	
	//reset the correct answer
	[self optionA].isCorrectAnswer=NO;
	[self optionB].isCorrectAnswer=NO;
	[self optionC].isCorrectAnswer=NO;
	[[self optionA] resetResponseImage];
	[[self optionB] resetResponseImage];
	[[self optionC] resetResponseImage];
	
	//shufle the position of correct answer
	int rand=[self generateRandom:3];
	if (rand==1) {
		[[self optionA] setQuestionValue:c];
		[[self optionB] setQuestionValue:d];
		[[self optionC] setQuestionValue:e];
		[self optionA].isCorrectAnswer=YES;
	}else if (rand==2) {
		[[self optionB] setQuestionValue:c];
		[[self optionA] setQuestionValue:d];
		[[self optionC] setQuestionValue:e];
		[self optionB].isCorrectAnswer=YES;
	}else {
		[[self optionC] setQuestionValue:c];
		[[self optionA] setQuestionValue:e];
		[[self optionB] setQuestionValue:d];
		[self optionC].isCorrectAnswer=YES;
	}
}


-(void)initGameAgainWithMultiplication
{
	[[self qType] setTypeOfOperation:@"x"];
	
	self.timerCounter=0;
	//setting questions
	int a=[self generateRandom:10];
	int b=[self generateRandom:10];
	//checks whether both are set to zero
	if (a==0) {
		a=5+[self generateRandom:5];
	}
	if (b>a) {
		a=5+[self generateRandom:5];
		b=[self generateRandom:5];
	}
	[[self operandA] setQuestionValue:a];
	[[self operandB] setQuestionValue:b];
	//setting options
	//first the answer
	int c=a*b;
	//distractors
	int d=[self generateRandom:80];
	int e=[self generateRandom:80];
	//checks whether both the distractor and correct answer are not same!!
	if (d==c) {
		d=[self generateRandom:50]+[self generateRandom:10];//just some randomness
	}
	if (e==c) {
		e=[self generateRandom:25]+[self generateRandom:20];//just some randomness
	}
	
	//reset the correct answer
	[self optionA].isCorrectAnswer=NO;
	[self optionB].isCorrectAnswer=NO;
	[self optionC].isCorrectAnswer=NO;
	[[self optionA] resetResponseImage];
	[[self optionB] resetResponseImage];
	[[self optionC] resetResponseImage];
	
	//shufle the position of correct answer
	int rand=[self generateRandom:3];
	if (rand==1) {
		[[self optionA] setQuestionValue:c];
		[[self optionB] setQuestionValue:d];
		[[self optionC] setQuestionValue:e];
		[self optionA].isCorrectAnswer=YES;
	}else if (rand==2) {
		[[self optionB] setQuestionValue:c];
		[[self optionA] setQuestionValue:d];
		[[self optionC] setQuestionValue:e];
		[self optionB].isCorrectAnswer=YES;
	}else {
		[[self optionC] setQuestionValue:c];
		[[self optionA] setQuestionValue:e];
		[[self optionB] setQuestionValue:d];
		[self optionC].isCorrectAnswer=YES;
	}
}

-(void)initGameAgainWithDivision
{
	[[self qType] setTypeOfOperation:@"/"];
	self.timerCounter=0;
	//logic is difrent here than the other three operations
	//Here we will be getting the result first and then calculate the problem numbers :)
	//This will ensure that we are dealing between defined set of numbers
	int c=1+[self generateRandom:10];
	int b=1+[self generateRandom:10];
	int a= b*c;
	
	[[self operandA] setQuestionValue:a];
	[[self operandB] setQuestionValue:b];
	//setting options
	
	//distractors
	int d=[self generateRandom:20];
	int e=[self generateRandom:30];
	//checks whether both the distractor and correct answer are not same!!
	if (d==c) {
		d=[self generateRandom:50]+[self generateRandom:10];//just some randomness
	}
	if (e==c) {
		e=[self generateRandom:25]+[self generateRandom:20];//just some randomness
	}
	
	//reset the correct answer
	[self optionA].isCorrectAnswer=NO;
	[self optionB].isCorrectAnswer=NO;
	[self optionC].isCorrectAnswer=NO;
	[[self optionA] resetResponseImage];
	[[self optionB] resetResponseImage];
	[[self optionC] resetResponseImage];
	
	//shufle the position of correct answer
	int rand=[self generateRandom:3];
	if (rand==1) {
		[[self optionA] setQuestionValue:c];
		[[self optionB] setQuestionValue:d];
		[[self optionC] setQuestionValue:e];
		[self optionA].isCorrectAnswer=YES;
	}else if (rand==2) {
		[[self optionB] setQuestionValue:c];
		[[self optionA] setQuestionValue:d];
		[[self optionC] setQuestionValue:e];
		[self optionB].isCorrectAnswer=YES;
	}else {
		[[self optionC] setQuestionValue:c];
		[[self optionA] setQuestionValue:e];
		[[self optionB] setQuestionValue:d];
		[self optionC].isCorrectAnswer=YES;
	}
}



-(void) onShowOptions:(CorrectAnswerEvent *)event
{
	NSLog(@"onShowOptions : event= %@",event);
	[self showOptions:TRUE];
}


-(void) onCorrectAnswer:(CorrectAnswerEvent *)event
{
	NSLog(@"onCorrectAnswer : event = %@",event);
	//[self initGameAgain];
	[self waitAndInitAgain];
}

-(void) onWrongAnswer:(CorrectAnswerEvent *)event
{
	NSLog(@"onWrongAnswer : event = %@",event);
}


-(void)waitAndInitAgain
{
	NSLog(@"waitAndInitAgain : ");
	self.timerCounter=0;
	[self addEventListener:@selector(onEachFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
}

-(void)onEachFrame:(SPEnterFrameEvent *)event
{
	//NSLog(@"onEachFrame---");
	
	self.timerCounter++;
	if (((int)self.timerCounter)>=100) {
		[self removeEventListener:@selector(onEachFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
		NSLog(@"Wait is Over : init Again");
		//[self initGameAgain];
		//checks for the game type and resets accordingly
		if (qType.mode==@"add") {
			[self initGameAgain];
			//NSLog(@"---addition");
		}else if (qType.mode==@"subtract") {
			[self initGameAgainWithSubtraction];
			//NSLog(@"---subtraction");
		}else if (qType.mode==@"multiply") {
			[self initGameAgainWithMultiplication];
			//NSLog(@"----multiplication");
		}else if (qType.mode==@"divide") {
			[self initGameAgainWithDivision];
			//NSLog(@"----division");
		}
	}
	 
}

//option screen event handlers
-(void)onAddSelect:(OptionSelectionEvent *)event
{
	NSLog(@"GameAddition : onAddOptionSelect : ");
	[self initGameAgain];
	[self showOptions:FALSE];
}
-(void)onSubtractSelect:(OptionSelectionEvent *)event
{
	NSLog(@"GameAddition : onSubtractSelect : ");
	[self initGameAgainWithSubtraction];
	[self showOptions:FALSE];
}

-(void)onMultiplySelect:(OptionSelectionEvent *)event
{
	NSLog(@"GameAddition : onMultiplySelect : TODO");
	[self initGameAgainWithMultiplication];
	[self showOptions:FALSE];
}
-(void)onDivideSelect:(OptionSelectionEvent *)event
{
	NSLog(@"GameAddition : onDevideSelect : TODO");
	[self initGameAgainWithDivision];
	[self showOptions:FALSE];
}

-(void)showOptions:(BOOL)option
{
	if (option==TRUE) {
		self.optionSelectionSprite.visible=TRUE;
	}else {
		self.optionSelectionSprite.visible=FALSE;
	}
}



@end
