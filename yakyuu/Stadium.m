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
        for (int i = HOME_BASE; i < MAX_BASE; i++) {
            players[i] = nil;
        }
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
    [ownTeam setIsPinchSelected:NO];
    
    // TODO: Initialize the
    for (int i = HOME_BASE; i < MAX_BASE; i++) {
        if (players[i])
        {
            [players[i] setOnBase:NONE_BASE];
            [ownTeam addPlayer:players[i]];
            players[i] = nil;
        }
    }
    
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
                               [NSNumber numberWithInt:outCount], @"OutCount"
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

-(void) notifyChangePlayer
{
    NSDictionary *playerInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                               players[HOME_BASE].playerName, @"PlayerName",
                               players[HOME_BASE].playerImage, @"PlayerImage",
                               nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangePlayer" object:self userInfo:playerInfo];
}

-(void) selectBatter:(PLAYER_TYPE) type;
{
    switch (type) {
        case PLAYER_POWER:
            players[HOME_BASE] = [ownTeam getPowerPlayer];
            break;
        case PLAYER_BALANCE:
            players[HOME_BASE] = [ownTeam getBalancePlayer];
            break;
        case PLAYER_AVERAGE:
            players[HOME_BASE] = [ownTeam getAveragePlayer];
            break;
        case PLAYER_PINCH:
            players[HOME_BASE] = [ownTeam getPinchHitter];
            break;
        default:
            // TODO: or return; ?
            break;
    }
    [self notifyChangePlayer];
}

-(void) playerToHit
{
    if (players[HOME_BASE] == nil) {
        // Error: There is no Batter.
        return;
    }
    
    int batResult = [players[HOME_BASE] bat];
    if (batResult == -1) {
        // Error
        return;
    }
    if (batResult == BATTER_OUT) {
        // Process out.
        outCount++;
        [ownTeam addPlayer:players[HOME_BASE]];
        players[HOME_BASE] = nil;
    }else{
        // Make the runners run
        for (int i = THIRD_BASE; i > NONE_BASE && players[i]; i--) {
            
            BASE_TYPE runResult = [players[i] run:batResult];
            if (runResult == NONE_BASE) {
                currentScore++;
                totalScore.ownScore++;
                
                [ownTeam addPlayer:players[i]];
            }else{
                players[runResult] = players[i];
            }
            players[i] = nil;
        }
        
        // TODO: Run process in view
    }
    
    [self notifyUpdateScore];
}

@end
