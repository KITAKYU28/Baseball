//
//  Stadium.m
//  yakyuu
//
//  Created by 楊 林超 on 2013/08/05.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "Stadium.h"

const int MAX_OUT_COUNT = 3;

const int ENEMY_SCORE_LIMIT = 11;

static NSString *resultText[BATTING_MAX][2] = {
    {@"アウト!", @"スリーアウト!!"},
    {@"ヒット!", @"ﾀｲﾑﾘｰﾋｯﾄ!"},
    {@"ツーベース!", @"ﾀｲﾑﾘｰﾂｰﾍﾞｰｽ!"},
    {@"スリーベース!", @"ﾀｲﾑﾘｰｽﾘｰﾍﾞｰｽ!"},
    {@"", @"HOMERUN!!"},
};

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
    
    [self playersReturn];
    
    //TODO: Initialize the images of stadium
    [self notifyInitializeStadium];
    [self notifyUpdateRunners];
    
    [self enemyBatting];
}

-(void) notifyUpdateScore:(NSString *) resultText
{
    int curTotalScore = (turn == TURN_ENEMY)? totalScore.enemyScore:totalScore.ownScore;
    NSDictionary *scoreInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithInt:turn], @"GameTurn",
                               [NSNumber numberWithInt:inning], @"GameInning",
                               [NSNumber numberWithInt:curTotalScore], @"TotalScore",
                               [NSNumber numberWithInt:currentScore], @"CurrentScore",
                               [NSNumber numberWithInt:outCount], @"OutCount",
                               resultText, @"ResultText",
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

-(void) notifyBatterOut
{
    NSDictionary *outInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithInt:outCount], @"OutCount",
                             nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BatterOut" object:self userInfo:outInfo];
}

-(void) notifyUpdateRunners
{
    int first = 0, second = 0, count = 0;
    for (int i = FIRST_BASE; i < MAX_BASE; i++) {
        if (players[i]) {
            count++;
            
            if (first == 0) {
                first = i;
            }else{
                second = i;
            }
        }
    }
    
    NSString *runnerText;
    switch (count) {
        case 0:
            runnerText = @"ランナーなし";
            break;
        case 1:
            runnerText = [NSString stringWithFormat:@"ランナー%d塁",first];
            break;
        case 2:
            runnerText = [NSString stringWithFormat:@"ランナー%d、%d塁",first, second];
            break;
        case 3:
            runnerText = @"ランナー満塁!!";
            break;
        default:
            runnerText = @"";
            break;
    }
    
    NSDictionary *runnersInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:players[FIRST_BASE]], @"FirstBase",
                                 [NSNumber numberWithBool:players[SECOND_BASE]], @"SecondBase",
                                 [NSNumber numberWithBool:players[THIRD_BASE]], @"ThirdBase",
                                 runnerText, @"RunnerText",
                                 nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateRunners" object:self userInfo:runnersInfo];
}

-(void) selectBatter:(PLAYER_TYPE) type;
{
    if (turn != TURN_OWN) {
        // Error: It is not your turn now.
        return;
    }
    
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
    [players[HOME_BASE] setOnBase:HOME_BASE];
    [self notifyChangePlayer];
}

-(void) playerToHit
{
    if (players[HOME_BASE] == nil || turn != TURN_OWN) {
        // Error: There is no Batter.
        return;
    }
    
    int batResult = [players[HOME_BASE] bat];
    if (batResult == -1) {
        // Error
        return;
    }
    
    bool isGetScore = NO;

    // Make the runners run
    for (int i = THIRD_BASE; i > NONE_BASE; i--) {
        if (players[i] == nil) {
            continue;
        }
        
        BASE_TYPE runResult = [players[i] run:batResult];
        if (runResult == NONE_BASE) {
            currentScore++;
            totalScore.ownScore++;
            isGetScore = YES;
            
            [ownTeam addPlayer:players[i]];
        }else{
            players[runResult] = players[i];
        }
        if (runResult != i) {
            players[i] = nil;
        }
    }
    
    if (players[HOME_BASE]) {
        // Process out.
        outCount++;
        [self notifyBatterOut];
        
        [ownTeam addPlayer:players[HOME_BASE]];
        players[HOME_BASE] = nil;
        
        if (outCount >= 3) {
            isGetScore = YES;
        }
    }
    
    [self notifyUpdateScore:resultText[batResult][isGetScore]];
    
    // Next turn
    if (outCount >= 3) {
        // Players who on the base return to team
        [self playersReturn];
        
        turn = TURN_ENEMY;
        outCount = 0;
        currentScore = 0;
        inning++;
    }
    
    // Show the run result in view
    [self notifyUpdateRunners];
}

-(void) enemyBatting
{
    if (turn != TURN_ENEMY) {
        return;
    }
    
    currentScore = arc4random() % ENEMY_SCORE_LIMIT;
    totalScore.enemyScore += currentScore;
    
    [self notifyUpdateScore:resultText[HOME_RUN][0]];
    
    currentScore = 0;
    turn = TURN_OWN;
}

-(void) playersReturn
{
    for (int i = HOME_BASE; i < MAX_BASE; i++) {
        if (players[i])
        {
            [players[i] setOnBase:NONE_BASE];
            [ownTeam addPlayer:players[i]];
            players[i] = nil;
        }
    }
}

@end
