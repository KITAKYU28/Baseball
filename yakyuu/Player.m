//
//  Player.m
//  yakyuu
//
//  Created by 楊 林超 on 2013/08/02.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "Player.h"

// battingの関数で元のswitchの各caseが同じの動作を実行しているので
// 現在の機能だけで、クラスを分割する必要がないと思う
const int BATTINGRATEMAX = 100;

static int battingRates[PLAYER_MAX][BATTER_OUT] =
{
    {20, 21, 50, 65},
    {10, 20, 40, 70},
    {5, 15, 35, 75},
    {75, 79, 91, 95}
};

@implementation Player

@synthesize playerType, playerName, playerImage;

-(id) init
{
    return [self initWithName: @"" andType: PLAYER_NONE andImage: @""];
}

-(id) initWithName: (NSString *)name andType: (PLAYER_TYPE)type andImage: (NSString *)image
{
    self = [super init];
    if (self){
        [self setPlayerImage: name];
        [self setPlayerType: type];
        [self setPlayerImage: image];
    }
    return  self;
}

-(int) bat
{
//    int (*myAverage)[BATTER_OUT];
//    myRates = &(battingRates[playerType]);
//    (*myRates)[HOME_RUN])
    
    int battingResult = arc4random() % BATTINGRATEMAX;
    
    // TODO: Show button
    if (battingResult < battingRates[playerType][HOME_RUN]){
        //TODO: Process [self homerun];
    }else if (battingResult < battingRates[playerType][THREE_BASE_HIT]){
        //TODO: Process [self threeBaseHit];
    }else if (battingResult < battingRates[playerType][TWO_BASE_HIT]) {
        //TODO: [self twoBaseHit];
    }else if (battingResult < battingRates[playerType][SINGLE_HIT]){
        //TODO: [self singleHit];
    }else{
        //TODO: [self batterOut];
    }
    
    // TODO: return value
    return battingResult;
}

@end
