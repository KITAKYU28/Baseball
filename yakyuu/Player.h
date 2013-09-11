//
//  Player.h
//  yakyuu
//
//  Created by 篠原 辰徳 on 2013/09/04.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject



typedef enum tagPlayerType
{
    power = 1,
    balance = 2,
    average = 3,
    pinchHitter = 4,
}playerType;


-(void)batting;
-(void)setPlayerStyle:(int)whatIsStyle;

@end
