//
//  ScoreCardSprite.h
//  MathIsFun
//
//  Created by saumya ray on 10/29/10.
//  http://www.saumyaray.com , twit me @saumya
//

#import <Foundation/Foundation.h>
#import <Sparrow.h>

@interface ScoreCardSprite : SPSprite {
	SPTextField *scored;
	SPTextField *missed;
	SPTextField *asked;
	NSInteger *score;
	NSInteger *miss;
	NSInteger *ask;
}

@property (assign) SPTextField *scored;
@property (assign) SPTextField *missed;
@property (assign) SPTextField *asked;
@property (assign) NSInteger *score;
@property (assign) NSInteger *miss;
@property (assign) NSInteger *ask;

-(id)initWithDefault;
-(void) renderDefault;
-(void)updateScore:(int)newScore andMiss:(int)missCount andAsked:(int)askCount;

@end
