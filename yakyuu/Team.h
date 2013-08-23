//
//  Team.h
//  yakyuu
//
//  Created by 楊 林超 on 2013/08/04.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Player.h"

@interface Team : NSObject

@property (nonatomic) bool isPinchSelected;
// TODO: This structure is not good.
@property (nonatomic, strong) NSMutableArray *powerPlayers;
@property (nonatomic, strong) NSMutableArray *balancePlayers;
@property (nonatomic, strong) NSMutableArray *averagePlayers;
@property (nonatomic, strong) NSMutableArray *pinchHitters;

-(void) initPowerPlayers;
-(void) initBalancePlayers;
-(void) initAveragePlayers;
-(void) initPinchHitters;

// TODO: Refactoring, Polymorphism 
-(Player *) getPowerPlayer;
-(Player *) getBalancePlayer;
-(Player *) getAveragePlayer;
-(Player *) getPinchHitter;

-(void) addPlayer:(Player *)player;

@end
