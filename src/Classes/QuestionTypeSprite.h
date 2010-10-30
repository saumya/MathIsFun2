//
//  QuestionTypeSprite.h
//  MathIsFun2
//
//  Created by saumya ray on 10/6/10.
//  http://www.saumyaray.com , twit me @saumya
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>
#import <CorrectAnswerEvent.h>


@interface QuestionTypeSprite : SPSprite
{
	SPQuad *border;
	SPQuad *background;
	SPTextField *questionSymbol;
	SPTextField *questionShadow;
	int userDefinedX;
	int userDefinedY;
	int question;
	BOOL isCorrectAnswer;
	SPImage *rightImage;
	SPImage *wrongImage;
	
	BOOL isOptionButton;
	NSString *mode;
}

@property (assign) SPQuad *border;
@property (assign) SPQuad *background;
@property (assign) SPTextField *questionSymbol;
@property (assign) SPTextField *questionShadow;
@property (assign) int userDefinedX;
@property (assign) int userDefinedY;
@property (assign) int question;
@property (assign) BOOL isCorrectAnswer;
@property (assign) SPImage *rightImage;
@property (assign) SPImage *wrongImage;
@property (assign) BOOL isOptionButton;

@property (assign) NSString *mode;

-(id)initWithType:(NSString *)type;
-(id)initWithOperand:(NSString *)operand havingPosX:(int)xPos andPosY:(int)yPos;
-(id)initWithOption:(int)option havingPosX:(int)xPos andPosY:(int)yPos;
-(void)setQuestionValue:(int)value;
-(void)renderThisType:(NSString *)type;
-(void)setTypeOfOperation:(NSString *)type;
-(void)moveToPosX:(float)xPos andPosY:(float)yPos; 
-(void)resetResponseImage;

@end
