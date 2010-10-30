//
//  GameAddition.m
//  MathIsFun2
//
//  Created by saumya ray on 10/6/10.
//  http://www.saumyaray.com , twit me @saumya
//

#import "GameAddition.h"
#import "GameAddition+ShadowText.h"


@implementation GameAddition

@synthesize background;
@synthesize questionType;

@synthesize questionTimeCounter;
@synthesize qtText;
@synthesize qtTime;
//
@synthesize qType;
//
@synthesize operandOne;
@synthesize operandTwo;
//
@synthesize operandA;
@synthesize operandB;
@synthesize optionA;
@synthesize optionB;
@synthesize optionC;
//
@synthesize timerCounter;
//
@synthesize optionSelectionSprite;
//
@synthesize maxOperandValue;
@synthesize scoreCard;

-(id)initGame
{
	if (self=[super init]) {
		//customisation
		[self renderGame];
		//detecting the orientation change
		[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(orientationDetected:) 
													 name:@"UIDeviceOrientationDidChangeNotification" 
												   object:nil];
		//end orientation detection
		
	}
	return self;
}

-(void)orientationDetected:(UIEvent *)event
{
	//NSLog(@"orientation Change : %i",[UIDevice currentDevice].orientation);
	//NSLog(@"90 degrees= %f",(M_PI/180)*90);
	
	[self removeEventListener:@selector(onEachFrameAlertUser:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
	
	int orientation=[UIDevice currentDevice].orientation;
	if (orientation==2) {
		self.x=320+10;
		self.y=480;
		self.rotation=M_PI;
		[self initGameAgainWithSubtraction];
	}else if (orientation==3) {
		self.x=320+70;
		self.y=80;
		self.rotation=M_PI/2;
		[self initGameAgainWithMultiplication];
	}else if (orientation==4) {
		//self.rotation=3*M_PI;
		self.x=0-70;
		self.y=480-80;
		self.rotation=-(M_PI/2);
		[self initGameAgainWithDivision];
	}else {
		self.x=0;
		self.y=0;
		self.rotation=0;
		[self initGameAgain];
	}
}


-(void)renderGame
{
	//score elements
	self.qtTime=000;
	self.qtText=[SPTextField textFieldWithWidth:150 
										 height:20 
										   text:[NSString stringWithString:@"001"] 
									   fontName:@"Helvetica" 
									   fontSize:15 
										  color:0xAAAAAA];
	self.qtText.text=[NSString stringWithFormat:@"Counter %i",self.qtTime];
	self.qtText.x=20;
	self.qtText.y=110;
	[self addChild:qtText];
	
	self.scoreCard=[[ScoreCardSprite alloc] initWithDefault];
	[self addChild:self.scoreCard];
	self.scoreCard.x=45;
	self.scoreCard.y=320;
	//Game containers
	self.maxOperandValue=20;//just an option to add functionality next (difficulty level)
	
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
	[[self optionSelectionSprite] addEventListener:@selector(onGameBegin:) atObject:self forType:EVENT_TYPE_BEGIN_GAME];
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
	
	int a=0;
	int b=0;
	int c=0;
	
	//setting questions
	//max should be 99 as its the last 2 digit number
	//int tempOne=[self generateRandom:99];
	int tempTwo=[self generateRandom:self.maxOperandValue];
	int tempThree=[self generateRandom:self.maxOperandValue];
	if ((tempTwo+tempThree)>99) {
		tempThree=99-tempTwo;
	}
	a=tempTwo;
	b=tempThree;
	c=a+b;
	
	[[self operandA] setQuestionValue:a];
	[[self operandB] setQuestionValue:b];
	//setting options
	//distractors
	int d=1+[self generateRandom:c];
	int e=2+[self generateRandom:c];
	//checks whether both the distractor and correct answer are not same!!
	if (d==c) {
		d=[self generateRandom:10]+[self generateRandom:70];//just some randomness
	}
	if (e==c) {
		e=[self generateRandom:20]+[self generateRandom:70];//just some randomness
	}
	if (d==e) {
		if (d>0) {
			e=d-1;
		}else if (d<99) {
			e=d+1;
		}else {
			e=1;
		}
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
	
	//Times
	self.qtTime=0;
	self.qtText.text=[NSString stringWithFormat:@"%i",self.qtTime];
	//adds the timer
	[self addEventListener:@selector(onEachFrameAlertUser:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
}

-(void)initGameAgainWithSubtraction
{
	//setQuestionValue
	[[self qType] setTypeOfOperation:@"-"];
	
	self.timerCounter=0;
	//setting questions
	int a=0;
	int b=0;
	int c=0;
	
	//int tempOne=[self generateRandom:99];//as 99 is max 2 digit num
	int tempTwo=1+[self generateRandom:(self.maxOperandValue/2)];
	int tempThree=self.maxOperandValue+[self generateRandom:(self.maxOperandValue/2)];
	if (tempTwo>tempThree) {
		a=tempTwo;
		b=tempThree;
	}else {
		a=tempThree;
		b=tempTwo;
	}
	c=a-b;
	
	[[self operandA] setQuestionValue:a];
	[[self operandB] setQuestionValue:b];
	//setting options
	//distractors
	int d=[self generateRandom:self.maxOperandValue];
	int e=[self generateRandom:self.maxOperandValue];
	//checks whether both the distractor and correct answer are not same!!
	if (d==c) {
		if (d>1) {
			d=(d-1);
		}else {
			d=(d+1);
		}

	}
	if (e==c) {
		if (e>1) {
			e=(e-1);
		}else if (e<1) {
			e=(e+1);
		}else if (e==d) {
			e=(e+2);
		}
	}
	
	if (d==e) {
		if (d>0) {
			e=d-1;
		}else if (d<99) {
			e=d+1;
		}else {
			e=1;
		}
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
	
	//Times
	self.qtTime=0;
	self.qtText.text=[NSString stringWithFormat:@"%i",self.qtTime];
	//adds the timer
	[self addEventListener:@selector(onEachFrameAlertUser:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
}


-(void)initGameAgainWithMultiplication
{
	[[self qType] setTypeOfOperation:@"x"];
	
	self.timerCounter=0;
	
	//setting questions
	int a=1;
	int b=1;
	int c=1;
	
	int tempA=1+[self generateRandom:90];//99 being the last number we can go as a 2 digit number
	int tempB=1+[self generateRandom:self.maxOperandValue];
	int tempC=floor(tempA/tempB);
	if (tempB>self.maxOperandValue) {
		tempB=self.maxOperandValue-1;
	}
	if (tempC>self.maxOperandValue) {
		tempC=self.maxOperandValue-1;
	}
	a=tempB;
	b=tempC;
	c=tempB*tempC;
	
	[[self operandA] setQuestionValue:a];
	[[self operandB] setQuestionValue:b];
	//setting options
	//distractors
	int d=1+[self generateRandom:20];
	int e=21+[self generateRandom:20];
	//checks whether both the distractor and correct answer are not same!!
	if (d==c) {
		d=d+1;//just some randomness
	}
	if (e==c) {
		e=e-1;//just some randomness
	}
	if (d==e) {
		if (d>0) {
			e=d-1;
		}else if (d<99) {
			e=d+1;
		}else {
			e=1;
		}
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
	
	//Times
	self.qtTime=0;
	self.qtText.text=[NSString stringWithFormat:@"Counter %i",self.qtTime];
	//adds the timer
	[self addEventListener:@selector(onEachFrameAlertUser:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
}

-(void)initGameAgainWithDivision
{
	//NSLog(@"initGameAgainWithDivision : ");
	[[self qType] setTypeOfOperation:@"/"];
	self.timerCounter=0;
	int a=0;
	int b=0;
	int c=0;
	int tempA=1+[self generateRandom:90];//99 being the max value for 2digit numbers
	int tempB=1+[self generateRandom:self.maxOperandValue];
	int tempC=1;
	if (tempA>tempB) {
		tempC=floor(tempA/tempB);
	}else {
		tempC=floor(tempB/tempA);
	}
	
	b=tempC;
	a=tempB*tempC;
	c=tempB;
	
	[[self operandA] setQuestionValue:a];
	[[self operandB] setQuestionValue:b];
	//setting options
	
	//distractors
	int d=1+[self generateRandom:30];
	int e=31+[self generateRandom:30];
	if (d==c) {
		d=d+1;
	}
	if (e==c) {
		e=e-1;
	}
	if (d==e) {
		if (d>0) {
			e=d-1;
		}else if (d<99) {
			e=d+1;
		}else {
			e=1;
		}
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
	
	//times
	self.qtTime=0;
	self.qtText.text=[NSString stringWithFormat:@"Counter %i",self.qtTime];
	//adds the timer
	[self addEventListener:@selector(onEachFrameAlertUser:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
}



-(void) onShowOptions:(CorrectAnswerEvent *)event
{
	//NSLog(@"onShowOptions : event= %@",event);
	[self showOptions:TRUE];
}


-(void) onCorrectAnswer:(CorrectAnswerEvent *)event
{
	//NSLog(@"onCorrectAnswer : event = %@",event);
	[self removeEventListener:@selector(onEachFrameAlertUser:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
	
	[self waitAndInitAgain];
}

-(void) onWrongAnswer:(CorrectAnswerEvent *)event
{
	//NSLog(@"onWrongAnswer : event = %@",event);
}


-(void)waitAndInitAgain
{
	//NSLog(@"waitAndInitAgain : ");
	self.timerCounter=0;
	[self addEventListener:@selector(onEachFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
}

-(void)onEachFrame:(SPEnterFrameEvent *)event
{
	self.timerCounter++;
	if (((int)self.timerCounter)>=100) {
		[self removeEventListener:@selector(onEachFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
		if (qType.mode==@"add") {
			[self initGameAgain];
		}else if (qType.mode==@"subtract") {
			[self initGameAgainWithSubtraction];
		}else if (qType.mode==@"multiply") {
			[self initGameAgainWithMultiplication];
		}else if (qType.mode==@"divide") {
			[self initGameAgainWithDivision];
		}
		
		self.qtTime=0;
		self.qtText.text=[NSString stringWithFormat:@"Counter %i",self.qtTime];
		
		//update the score card
		int scored=(int)self.scoreCard.score+1;
		int missed=(int)self.scoreCard.miss;
		int asked=(int)self.scoreCard.ask+1;
		[self.scoreCard updateScore:scored andMiss:missed andAsked:asked];
	}
}

-(void)onEachFrameAlertUser:(SPEnterFrameEvent *)event
{
	/*
	float pt=event.passedTime;
	NSLog(@"passed time %f",pt);
	*/
	
	//
	self.qtTime++;
	
	//if its greater than 1000, reset the game
	if (self.qtTime>=1000) {
		[self removeEventListener:@selector(onEachFrameAlertUser:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
		self.qtTime=0;
		//self.qtText.text=[NSString stringWithFormat:@"Counter %i",self.qtTime];
		if (qType.mode==@"add") {
			[self initGameAgain];
		}else if (qType.mode==@"subtract") {
			[self initGameAgainWithSubtraction];
		}else if (qType.mode==@"multiply") {
			[self initGameAgainWithMultiplication];
		}else if (qType.mode==@"divide") {
			[self initGameAgainWithDivision];
		}
		//update the score card
		int scored=(int)self.scoreCard.score;
		int missed=(int)self.scoreCard.miss+1;
		int asked=(int)self.scoreCard.ask+1;
		[self.scoreCard updateScore:scored andMiss:missed andAsked:asked];
	}
	//
	self.qtText.text=[NSString stringWithFormat:@"Counter %i",self.qtTime];
}

-(void)onGameBegin:(OptionSelectionEvent *)event
{
	//NSLog(@"GameAddition : onGameBegin :");
	[self initGameAgain];
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
