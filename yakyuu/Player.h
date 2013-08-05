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
    HOME_RUN = 0,
    THREE_BASE_HIT = 1,
    TWO_BASE_HIT = 2,
    SINGLE_HIT = 3,
    BATTER_OUT = 4,
} BATTING_TYPE;

@interface Player : NSObject

@property (nonatomic) PLAYER_TYPE playerType;
@property (nonatomic, copy) NSString *playerName;
@property (nonatomic, copy) NSString *playerImage;


-(id) initWithName: (NSString *)name andType: (PLAYER_TYPE) type andImage: (NSString *)image;
-(int) bat;

@end
