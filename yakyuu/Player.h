//
//  Player.h
//  yakyuu
//
//  Created by 楊 林超 on 2013/08/02.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum TAG_PLAYER_TYPE
{
    PLAYER_NONE = 0,
    PLAYER_POWER = 1,
    PLAYER_BALANCE = 2,
    PLAYER_AVERAGE = 3,
    PLAYER_PINCH = 4,
    PLAYER_MAX = 5,
} PLAYER_TYPE;

typedef enum TAG_BATTING_TYPE
{
    BATTER_OUT = 0,
    SINGLE_HIT = 1,
    TWO_BASE_HIT = 2,
    THREE_BASE_HIT = 3,
    HOME_RUN = 4,
    BATTING_MAX = 5,
} BATTING_TYPE;

// TODO: Make this to be player's state
typedef enum TAG_BASE_TYPE
{
    NONE_BASE = -1,
    HOME_BASE = 0,
    FIRST_BASE = 1,
    SECOND_BASE = 2,
    THIRD_BASE = 3,
    MAX_BASE = 4,
} BASE_TYPE;

@interface Player : NSObject

@property (nonatomic) PLAYER_TYPE playerType;
@property (nonatomic, copy) NSString *playerName;
@property (nonatomic, copy) NSString *playerImage;
@property (nonatomic) BASE_TYPE onBase;
// 


-(id) initWithName:(NSString *)name andType:(PLAYER_TYPE) type andImage:(NSString *)image;
-(int) bat;
-(BASE_TYPE) run:(BATTING_TYPE) result;

@end
