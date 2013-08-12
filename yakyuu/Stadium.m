//
//  Stadium.m
//  yakyuu
//
//  Created by 楊 林超 on 2013/08/05.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "Stadium.h"

#define START_INNING 7
#define END_INNING 9

const int MAX_OUT_COUNT = 3;

@implementation Stadium

@synthesize ownTeam, stadiumImages, turn, inning, outCount, currentScore, scoreRecords;

-(id) init
{
    self = [super init];
    if (self) {
        ownTeam = [[Team alloc] init];
        scoreRecords = [NSMutableArray array];
        
        stadiumImages = [NSMutableArray array];
        [stadiumImages addObject:@"yahoo.png"];
        [stadiumImages addObject:@"kousien.png"];
        [stadiumImages addObject:@"kyousera.png"];
        [stadiumImages addObject:@"marine.png"];
        [stadiumImages addObject:@"matuda.png"];
        [stadiumImages addObject:@"nagoya.png"];
        [stadiumImages addObject:@"rakuten.png"];
        [stadiumImages addObject:@"sapporo.png"];
        [stadiumImages addObject:@"seibu.png"];
        [stadiumImages addObject:@"tokyo.png"];
        [stadiumImages addObject:@"yokohama.png"];
        [stadiumImages addObject:@"zinguu.png"];
        
        [self resetStadium];
    }
    return self;
}

-(void) resetStadium
{
    totalScore.ownScore = 0;
    totalScore.enemyScore = 0;
    
    [self setTurn:TURN_ENEMY];
    [self setInning:START_INNING];
    [self setOutCount:0];
    
    [scoreRecords removeAllObjects];
    
    //TODO: Initialize the images of stadium
    [self notifyInitializeStadium];
}

-(void) notifyUpdateScore
{
    int curTotalScore = (turn == TURN_ENEMY)? totalScore.enemyScore:totalScore.ownScore;
    NSDictionary *scoreInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithInt:turn], @"GameTurn",
                               [NSNumber numberWithInt:inning], @"GameInning",
                               [NSNumber numberWithInt:curTotalScore], @"TotalScore",
                               [NSNumber numberWithInt:currentScore], @"CurrentScore",
                               nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateScore" object: self userInfo:scoreInfo];
}

//TODO: Do create notify data for the image of stadium
//      or pass self. Do not encapsulation data
-(void) notifyInitializeStadium
{
    NSUInteger imageIndex = arc4random() % [stadiumImages count];
    NSString *imageName = [stadiumImages objectAtIndex:imageIndex];
    NSDictionary *imageInfo = [NSDictionary dictionaryWithObject:imageName forKey:@"StadiumImage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"InitializeStadium" object:self userInfo:imageInfo];
}

@end
