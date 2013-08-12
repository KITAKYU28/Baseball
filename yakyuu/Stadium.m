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

@synthesize ownTeam, backgroundImages, turn, inning, outCount, scoreRecords;

-(id) init
{
    self = [super init];
    if (self) {
        ownTeam = [[Team alloc] init];
        scoreRecords = [NSMutableArray array];
        
        backgroundImages = [NSMutableArray array];
        [backgroundImages addObject:@"yahoo.png"];
        [backgroundImages addObject:@"kousien.png"];
        [backgroundImages addObject:@"kyousera.png"];
        [backgroundImages addObject:@"marine.png"];
        [backgroundImages addObject:@"matuda.png"];
        [backgroundImages addObject:@"nagoya.png"];
        [backgroundImages addObject:@"rakuten.png"];
        [backgroundImages addObject:@"sapporo.png"];
        [backgroundImages addObject:@"seibu.png"];
        [backgroundImages addObject:@"tokyo.png"];
        [backgroundImages addObject:@"yokohama.png"];
        [backgroundImages addObject:@"zinguu.png"];
        
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
    ScoreNotify scoreNotify;
    // __bridge : transfers a pointer between Objective-C and Core Foundation without transfer of ownership.
    // __bridge_retained :casts an Objective-C pointer to a Core Foundation pointer and also transfers ownership to you.
    // __bridge_transfer : moves a non-Objective-C pointer to Objective-C and also transfers ownership to ARC.
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateScore" object: (__bridge id)(&scoreNotify)];
}

//TODO: Do create notify data for the image of stadium
//      or pass self. Do not encapsulation data
-(void) notifyInitializeStadium
{
    NSUInteger bgIndex = arc4random() % [backgroundImages count];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"InitializeStadium" object: [backgroundImages objectAtIndex:bgIndex]];
}

@end
