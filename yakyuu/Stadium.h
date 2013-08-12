//
//  Stadium.h
//  yakyuu
//
//  Created by 楊 林超 on 2013/08/05.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Team.h"

typedef enum TAG_TURN_TYPE{
    TURN_ENEMY = 1,
    TURN_OWN = 2,
} TURN_TYPE;

typedef struct Tag_ScorePair{
    int ownScore;
    int enemyScore;
} ScorePair;

typedef struct Tag_ScoreNotify{
    TURN_TYPE turnType;
    int inning;
    int score;
    int totalScore;
} ScoreNotify;

@interface Stadium : NSObject{
    ScorePair totalScore;
}

@property (nonatomic, strong) Team *ownTeam;
@property (nonatomic, copy) NSMutableArray *backgroundImages;
@property (nonatomic) TURN_TYPE turn;
@property (nonatomic) int inning;
@property (nonatomic) int outCount;
@property (nonatomic, strong) NSMutableArray *scoreRecords;

-(void) resetStadium;

-(void) notifyUpdateScore;
-(void) notifyInitializeStadium;

@end
