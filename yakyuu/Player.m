//
//  Player.m
//  yakyuu
//
//  Created by 楊 林超 on 2013/08/02.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "Player.h"

const int BATTINGRATEMAX = 100;

static int battingRates[PLAYER_MAX][HOME_RUN] =
{
//    {20, 21, 50, 65},
//    {10, 20, 40, 70},
//    {5, 15, 35, 75},
//    {75, 79, 91, 95},
    {0, 0, 0, 0},
    {35, 50, 79, 80},
    {30, 60, 80, 90},
    {25, 65, 85, 95},
    { 5,  9, 21, 25},
};

@implementation Player

@synthesize playerType, playerName, playerImage, onBase;

-(id) init
{
    return [self initWithName:@"" andType:PLAYER_NONE andImage:@""];
}

-(id) initWithName:(NSString *)name andType:(PLAYER_TYPE)type andImage:(NSString *)image
{
    self = [super init];
    if (self){
        [self setPlayerName:name];
        [self setPlayerType:type];
        [self setPlayerImage:image];
        onBase = NONE_BASE;
    }
    return  self;
}

-(int) bat
{
//    int (*myAverage)[BATTER_OUT];
//    myRates = &(battingRates[playerType]);
//    (*myRates)[HOME_RUN])
    
    if (onBase != HOME_BASE) {
        // Error: This Player is not a batter now.
        return -1;
    }
    
    int battingResult = arc4random() % BATTINGRATEMAX;
    int result = BATTER_OUT;
    
    // TODO: create utility class
    if (battingResult < battingRates[playerType][BATTER_OUT]){
        result = BATTER_OUT;
    }else if (battingResult < battingRates[playerType][SINGLE_HIT]){
        result = SINGLE_HIT;
    }else if (battingResult < battingRates[playerType][TWO_BASE_HIT]){
        result = TWO_BASE_HIT;
    }else if (battingResult < battingRates[playerType][THREE_BASE_HIT]){
        result = THREE_BASE_HIT;
    }else{
        result = HOME_RUN;
    }
    
    return result;
}

-(BASE_TYPE) run:(BATTING_TYPE) battingResult
{
    // switch
    if (onBase < HOME_BASE || onBase > THIRD_BASE) {
        // Error: This player is not a runner now.
        return onBase;
    }
    
    int runResult = onBase + battingResult;
    if (runResult > THIRD_BASE) {
        onBase = NONE_BASE;
    }else{
        onBase = runResult;
    }
    return onBase;
}

@end
