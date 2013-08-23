//
//  Team.m
//  yakyuu
//
//  Created by 楊 林超 on 2013/08/04.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "Team.h"

@implementation Team

@synthesize isPinchSelected, powerPlayers, balancePlayers, averagePlayers, pinchHitters;

-(id) init
{
    self = [super init];
    if (self)
    {
        isPinchSelected = NO;
        [self initPowerPlayers];
        [self initBalancePlayers];
        [self initAveragePlayers];
        [self initPinchHitters];
    }
    return self;
}

-(void) initPowerPlayers
{
    powerPlayers = [NSMutableArray array];

    // TODO: extract method
    Player *nakamuraTakeya = [[Player alloc] initWithName:@"中村剛" andType:PLAYER_POWER andImage:@"nakamuraTakeya.png"];
    [powerPlayers addObject:nakamuraTakeya];

    
    Player *balentien = [[Player alloc] initWithName:@"ﾊﾞﾚﾝﾃｨﾝ" andType:PLAYER_POWER andImage:@"balentien.png"];
    [powerPlayers addObject:balentien];

    
    Player *pena = [[Player alloc] initWithName:@"ペーニャ" andType:PLAYER_POWER andImage:@"pena2.png"];
    [powerPlayers addObject:pena];

    
    Player *blanco = [[Player alloc] initWithName:@"ﾌﾞﾗﾝｺ" andType:PLAYER_POWER andImage:@"branco.png"];
    Player *nakata = [[Player alloc] initWithName:@"中田翔" andType:PLAYER_POWER andImage:@"nakata.png"];
    Player *tokada = [[Player alloc] initWithName:@"T−岡田" andType:PLAYER_POWER andImage:@"Tokada.png"];
    Player *tsutsugou = [[Player alloc] initWithName:@"筒香" andType:PLAYER_POWER andImage:@"tsutsugo.png"];
    Player *abe = [[Player alloc] initWithName:@"阿部" andType:PLAYER_POWER andImage:@"abe.png"];
    Player *fernandez = [[Player alloc] initWithName:@"ﾌｪﾙﾅﾝﾃﾞｽ" andType:PLAYER_POWER andImage:@"feru.png"];
    Player *kim = [[Player alloc] initWithName:@"金泰均" andType:PLAYER_POWER andImage:@"kimu.png"];
    Player *brazell = [[Player alloc] initWithName:@"ﾌﾞﾗｾﾞﾙ" andType:PLAYER_POWER andImage:@"brazell.png"];
    Player *dobayashi = [[Player alloc] initWithName:@"堂林" andType:PLAYER_POWER andImage:@"doubayashi.png"];
    
    [powerPlayers addObject:blanco];
    [powerPlayers addObject:nakata];
    [powerPlayers addObject:tokada];
    [powerPlayers addObject:tsutsugou];
    [powerPlayers addObject:abe];
    [powerPlayers addObject:fernandez];
    [powerPlayers addObject:kim];
    [powerPlayers addObject:brazell];
    [powerPlayers addObject:dobayashi];
}

-(void) initBalancePlayers
{
    Player *matsuda = [[Player alloc] initWithName:@"松田" andType:PLAYER_BALANCE andImage:@"matsuda.png"];
    Player *saburo = [[Player alloc] initWithName:@"ｻﾌﾞﾛｰ" andType:PLAYER_BALANCE andImage:@"saburo.png"];
    Player *toritani = [[Player alloc] initWithName:@"鳥谷" andType:PLAYER_BALANCE andImage:@"toritani.png"];
    Player *hijirisawa = [[Player alloc] initWithName:@"藤田" andType:PLAYER_BALANCE andImage:@"fujita.png"];
    Player *tanakaken = [[Player alloc] initWithName:@"田中賢" andType:PLAYER_BALANCE andImage:@"tanakaken.png"];
    Player *kurihara = [[Player alloc] initWithName:@"栗原" andType:PLAYER_BALANCE andImage:@"kurihara.png"];
    Player *morino = [[Player alloc] initWithName:@"森野" andType:PLAYER_BALANCE andImage:@"morino.png"];
    Player *tamura = [[Player alloc] initWithName:@"多村" andType:PLAYER_BALANCE andImage:@"tamura.png"];
    Player *ortiz = [[Player alloc] initWithName:@"ｵｰﾃｨｽﾞ" andType:PLAYER_BALANCE andImage:@"otiz.png"];
    Player *gotou = [[Player alloc] initWithName:@"後藤" andType:PLAYER_BALANCE andImage:@"gotou.png"];
    Player *sakamoto = [[Player alloc] initWithName:@"坂本" andType:PLAYER_BALANCE andImage:@"sakamoto.png"];
    Player *milledge = [[Player alloc] initWithName:@"ﾐﾚｯｼﾞ" andType:PLAYER_BALANCE andImage:@"mirezzi.png"];
    
    balancePlayers = [NSMutableArray array];
    [balancePlayers addObject:matsuda];
    [balancePlayers addObject:saburo];
    [balancePlayers addObject:toritani];
    [balancePlayers addObject:hijirisawa];
    [balancePlayers addObject:tanakaken];
    [balancePlayers addObject:kurihara];
    [balancePlayers addObject:morino];
    [balancePlayers addObject:tamura];
    [balancePlayers addObject:ortiz];
    [balancePlayers addObject:gotou];
    [balancePlayers addObject:sakamoto];
    [balancePlayers addObject:milledge];
}

-(void) initAveragePlayers
{
    Player *murton = [[Player alloc] initWithName:@"ﾏｰﾄﾝ" andType:PLAYER_AVERAGE andImage:@"murton.png"];
    Player *uchikawa = [[Player alloc] initWithName:@"内川" andType:PLAYER_AVERAGE andImage:@"uchikawa.png"];
    Player *imae = [[Player alloc] initWithName:@"今江" andType:PLAYER_AVERAGE andImage:@"imae.png"];
    Player *hirose = [[Player alloc] initWithName:@"廣瀬" andType:PLAYER_AVERAGE andImage:@"hirose.png"];
    Player *chono = [[Player alloc] initWithName:@"長野" andType:PLAYER_AVERAGE andImage:@"chono.png"];
    Player *miyamoto = [[Player alloc] initWithName:@"宮本" andType:PLAYER_AVERAGE andImage:@"miyamoto.png"];
    Player *teppei = [[Player alloc] initWithName:@"鉄平" andType:PLAYER_AVERAGE andImage:@"teppei.png"];
    Player *sakaguchi = [[Player alloc] initWithName:@"坂口" andType:PLAYER_AVERAGE andImage:@"sakaguchi.png"];
    Player *itoi = [[Player alloc] initWithName:@"糸井" andType:PLAYER_AVERAGE andImage:@"itoi.png"];
    Player *oshima = [[Player alloc] initWithName:@"大島" andType:PLAYER_AVERAGE andImage:@"ooshima.png"];
    Player *kinjo = [[Player alloc] initWithName:@"金城" andType:PLAYER_AVERAGE andImage:@"kinjo.png"];
    Player *kuriyama = [[Player alloc] initWithName:@"栗山" andType:PLAYER_AVERAGE andImage:@"kuriyama.png"];
    
    averagePlayers = [NSMutableArray array];
    [averagePlayers addObject:murton];
    [averagePlayers addObject:uchikawa];
    [averagePlayers addObject:imae];
    [averagePlayers addObject:hirose];
    [averagePlayers addObject:chono];
    [averagePlayers addObject:miyamoto];
    [averagePlayers addObject:teppei];
    [averagePlayers addObject:sakaguchi];
    [averagePlayers addObject:itoi];
    [averagePlayers addObject:oshima];
    [averagePlayers addObject:kinjo];
    [averagePlayers addObject:kuriyama];
}

-(void) initPinchHitters
{
    Player *matsunaka = [[Player alloc] initWithName:@"松中" andType:PLAYER_PINCH andImage:@"matsunaka.png"];
    Player *inaba = [[Player alloc] initWithName:@"稲葉" andType:PLAYER_PINCH andImage:@"inaba.png"];
    Player *nakajima = [[Player alloc] initWithName:@"中島" andType:PLAYER_PINCH andImage:@"nakajima.png"];
    Player *matsui = [[Player alloc] initWithName:@"松井稼" andType:PLAYER_PINCH andImage:@"matsuiKazuo"];
    Player *ideho = [[Player alloc] initWithName:@"李大浩" andType:PLAYER_PINCH andImage:@"ideho.png"];
    Player *fukuura = [[Player alloc] initWithName:@"福浦" andType:PLAYER_PINCH andImage:@"fukuura.png"];
    Player *ogasawara = [[Player alloc] initWithName:@"小笠原" andType:PLAYER_PINCH andImage:@"ogasawara.png"];
    Player *kanemoto = [[Player alloc] initWithName:@"金本" andType:PLAYER_PINCH andImage:@"kanemoto.png"];
    Player *wada = [[Player alloc] initWithName:@"和田" andType:PLAYER_PINCH andImage:@"wadaKazuhiro.png"];
    Player *maedatomo = [[Player alloc] initWithName:@"前田智" andType:PLAYER_PINCH andImage:@"maedaTomonori.png"];
    Player *aoki = [[Player alloc] initWithName:@"青木" andType:PLAYER_PINCH andImage:@"aoki.png"];
    Player *ramirez = [[Player alloc] initWithName:@"ﾗﾐﾚｽ" andType:PLAYER_PINCH andImage:@"ramirez.png"];
    Player *yamazakiSusumu = [[Player alloc] initWithName:@"ZACKY" andType:PLAYER_PINCH andImage:@"yamazaki.png"];
    
    pinchHitters = [NSMutableArray array];
    [pinchHitters addObject:matsunaka];
    [pinchHitters addObject:inaba];
    [pinchHitters addObject:nakajima];
    [pinchHitters addObject:matsui];
    [pinchHitters addObject:ideho];
    [pinchHitters addObject:fukuura];
    [pinchHitters addObject:ogasawara];
    [pinchHitters addObject:kanemoto];
    [pinchHitters addObject:wada];
    [pinchHitters addObject:maedatomo];
    [pinchHitters addObject:aoki];
    [pinchHitters addObject:ramirez];
    [pinchHitters addObject:yamazakiSusumu];
}

-(Player *) getPowerPlayer
{
    NSUInteger randomPlayer = arc4random() % [powerPlayers count];
    Player *player = [powerPlayers objectAtIndex:randomPlayer];
    [powerPlayers removeObjectAtIndex:randomPlayer];
    return player;
}

-(Player *) getBalancePlayer
{
    NSUInteger randomPlayer = arc4random() % [balancePlayers count];
    Player *player = [balancePlayers objectAtIndex:randomPlayer];
    [balancePlayers removeObjectAtIndex:randomPlayer];
    return player;
}

-(Player *) getAveragePlayer
{
    NSUInteger randomPlayer = arc4random() % [averagePlayers count];
    Player *player = [averagePlayers objectAtIndex:randomPlayer];
    [averagePlayers removeObjectAtIndex:randomPlayer];
    return player;
}

-(Player *) getPinchHitter
{
    isPinchSelected = YES;
    
    NSUInteger randomPlayer = arc4random() % [pinchHitters count];
    Player *player = [pinchHitters objectAtIndex:randomPlayer];
    [pinchHitters removeObjectAtIndex:randomPlayer];
    return player;
}

-(void) addPlayer:(Player *)player
{
    // TODO: polymorphism
    if (player) {
        switch (player.playerType) {
            case PLAYER_POWER:
                [powerPlayers addObject:player];
                break;
            case PLAYER_BALANCE:
                [balancePlayers addObject:player];
                break;
            case PLAYER_AVERAGE:
                [averagePlayers addObject:player];
                break;
            case PLAYER_PINCH:
                [pinchHitters addObject:player];
                break;
            default:
                break;
        }
    }
}

@end
