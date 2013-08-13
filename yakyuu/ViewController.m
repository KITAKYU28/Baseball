//
//  ViewController.m
//  yakyuu
//
//  Created by 篠原　辰徳 on 13/01/09.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "ViewController.h"
#define randomEnemyScore 11
#define stadiumType 12
#define basePlayerType 12
#define pinchHitterType 13
#define randamNumber 100
#define nothing 0
#define power 1
#define balance 2
#define average 3
#define pinchHitter 4
#define singleHit 1
#define twoBaseHit 2
#define threeBaseHit 3
#define homerun 4
#define own 1
#define enemy 2
#define easyVictory 0
#define sayonaraWin 1
#define sayonaraHomerun 2


@interface ViewController (){
    int whatIsPlayerStyle;
    int whatIsBattingResult;
    int ownScore;
    int enemyScore;
    int outCount;
    int whoIsPlayer;
    int totalEnemyScore;
    int totalOwnScore;
    int inning;
    int didYouUsePinchHitter; 
    int whatIsStadium;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // TODO: Comfirm the position of these codes.
    NSNotificationCenter *notifyCenter = [NSNotificationCenter defaultCenter];
    [notifyCenter addObserver:self selector:@selector(initializeStadium:) name:@"InitializeStadium" object:stadium];
    [notifyCenter addObserver:self selector:@selector(updateScore:) name:@"UpdateScore" object:stadium];
    [notifyCenter addObserver:self selector:@selector(changePlayer:) name:@"ChangePlayer" object:stadium];
    
    stadium = [[Stadium alloc] init];
    
    [self initialize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initialize{
    
    enemyScore = 0;
    totalEnemyScore = 0;
    whatIsPlayerStyle = nothing;
    whatIsBattingResult = nothing;
    whoIsPlayer = nothing;
    //sayonara = 0;
    didYouUsePinchHitter = NO;
    whatIsStadium = nothing;
    
    outCount = 0;
    ownScore = 0;
    _doesRunnerExists.third = NO;
    _doesRunnerExists.second = NO;
    _doesRunnerExists.first = NO;
    
    [self runnerImageDisplay];
    
    inning = 7;
    totalOwnScore = 0;
    self.resultLabel.text = @"打席結果";
    self.baseLabel.text = @"";
    self.outLabel.text = @"";
    self.sevenBottomLabel.text = @"";
    self.eightBottomLabel.text = @"";
    self.nineBottomLabel.text = @"";
    self.sevenTopLabel.text = @"";
    self.eightTopLabel.text = @"";
    self.nineTopLabel.text = @"";
    self.totalLabel.text = @"";
    self.totalEnemyLabel.text = @"";
    self.baseLabel.text = @"ランナーなし";
    
    self.pitcherImage.hidden = YES;
    self.changeButton.hidden = YES;
    self.balanceButton.hidden = NO;
    self.powerButton.hidden = NO;
    self.averageButton.hidden = NO;
    self.pinchHitterButton.hidden = NO;
    self.battingButton.hidden = YES;
    self.changeButton.hidden = YES;
    self.playerNameLabel.hidden = YES;
    self.baseLabel.hidden = YES;

    
    self.batterImage.image = [UIImage imageNamed:@""];
    self.baseImage.image = [UIImage imageNamed:@"noRunner.png"];
    self.playerNameLabel.text = @"";
    enemyScore = arc4random() % randomEnemyScore;      
    
    self.sevenTopLabel.text = [NSString stringWithFormat : @"%d", enemyScore];
    totalEnemyScore = enemyScore;
    self.totalEnemyLabel.text = [NSString stringWithFormat : @"%d", totalEnemyScore];
    
    
    
    //スタジアム画像
    stadiumBackgroundArray = [NSMutableArray array];
    [stadiumBackgroundArray addObject:@"yahoo.png"];    
    [stadiumBackgroundArray addObject:@"kousien.png"];
    [stadiumBackgroundArray addObject:@"kyousera.png"];
    [stadiumBackgroundArray addObject:@"marine.png"];
    [stadiumBackgroundArray addObject:@"matuda.png"];
    [stadiumBackgroundArray addObject:@"nagoya.png"];
    [stadiumBackgroundArray addObject:@"rakuten.png"];
    [stadiumBackgroundArray addObject:@"sapporo.png"];
    [stadiumBackgroundArray addObject:@"seibu.png"];
    [stadiumBackgroundArray addObject:@"tokyo.png"];
    [stadiumBackgroundArray addObject:@"yokohama.png"];
    [stadiumBackgroundArray addObject:@"zinguu.png"];

//    [self setStadiumBackground];
    
    
    //パワープレイヤー画像
    NSMutableDictionary *nakamuraTakeya = [NSMutableDictionary dictionary];
    [nakamuraTakeya setObject:@"nakamuraTakeya.png" forKey:@"Image"];
    [nakamuraTakeya setObject:@"中村剛" forKey:@"Name"];
    NSMutableDictionary *balentien = [NSMutableDictionary dictionary];
    [balentien setObject:@"balentien.png" forKey:@"Image"];
    [balentien setObject:@"ﾊﾞﾚﾝﾃｨﾝ" forKey:@"Name"];
    NSMutableDictionary *pena = [NSMutableDictionary dictionary];
    [pena setObject:@"pena2.png" forKey:@"Image"];
    [pena setObject:@"ペーニャ" forKey:@"Name"];
    NSMutableDictionary *blanco = [NSMutableDictionary dictionary];
    [blanco setObject:@"branco.png" forKey:@"Image"];
    [blanco setObject:@"ﾌﾞﾗﾝｺ" forKey:@"Name"];
    NSMutableDictionary *nakata = [NSMutableDictionary dictionary];
    [nakata setObject:@"nakata.png" forKey:@"Image"];
    [nakata setObject:@"中田翔" forKey:@"Name"];
    NSMutableDictionary *tokada = [NSMutableDictionary dictionary];
    [tokada setObject:@"Tokada.png" forKey:@"Image"];
    [tokada setObject:@"T−岡田" forKey:@"Name"];
    NSMutableDictionary *tsutsugou = [NSMutableDictionary dictionary];
    [tsutsugou setObject:@"tsutsugo.png" forKey:@"Image"];
    [tsutsugou setObject:@"筒香" forKey:@"Name"];
    NSMutableDictionary *abe = [NSMutableDictionary dictionary];
    [abe setObject:@"abe.png" forKey:@"Image"];
    [abe setObject:@"阿部" forKey:@"Name"];
    NSMutableDictionary *fernandez = [NSMutableDictionary dictionary];
    [fernandez setObject:@"feru.png" forKey:@"Image"];
    [fernandez setObject:@"ﾌｪﾙﾅﾝﾃﾞｽ" forKey:@"Name"];
    NSMutableDictionary *kim = [NSMutableDictionary dictionary];
    [kim setObject:@"kimu.png" forKey:@"Image"];
    [kim setObject:@"金泰均" forKey:@"Name"];
    NSMutableDictionary *brazell = [NSMutableDictionary dictionary];
    [brazell setObject:@"brazell.png" forKey:@"Image"];
    [brazell setObject:@"ﾌﾞﾗｾﾞﾙ" forKey:@"Name"];
    NSMutableDictionary *dobayashi = [NSMutableDictionary dictionary];
    [dobayashi setObject:@"doubayashi.png" forKey:@"Image"];
    [dobayashi setObject:@"堂林" forKey:@"Name"];
    
    powerPlayerArray = [NSMutableArray array];
    [powerPlayerArray addObject:nakamuraTakeya];
    [powerPlayerArray addObject:balentien];
    [powerPlayerArray addObject:pena];
    [powerPlayerArray addObject:blanco];
    [powerPlayerArray addObject:nakata];
    [powerPlayerArray addObject:tokada];
    [powerPlayerArray addObject:tsutsugou];
    [powerPlayerArray addObject:abe];
    [powerPlayerArray addObject:fernandez];
    [powerPlayerArray addObject:kim];
    [powerPlayerArray addObject:brazell];
    [powerPlayerArray addObject:dobayashi];

    
    //バランスプレイヤー画像
    NSMutableDictionary *matsuda = [NSMutableDictionary dictionary];
    [matsuda setObject:@"matsuda.png" forKey:@"Image"];
    [matsuda setObject:@"松田" forKey:@"Name"];
    NSMutableDictionary *saburo = [NSMutableDictionary dictionary];
    [saburo setObject:@"saburo.png" forKey:@"Image"];
    [saburo setObject:@"ｻﾌﾞﾛｰ" forKey:@"Name"];
    NSMutableDictionary *toritani = [NSMutableDictionary dictionary];
    [toritani setObject:@"toritani.png" forKey:@"Image"];
    [toritani setObject:@"鳥谷" forKey:@"Name"];
    NSMutableDictionary *hijirisawa = [NSMutableDictionary dictionary];
    [hijirisawa setObject:@"fujita.png" forKey:@"Image"];
    [hijirisawa setObject:@"藤田" forKey:@"Name"];
    NSMutableDictionary *tanakaken = [NSMutableDictionary dictionary];
    [tanakaken setObject:@"tanakaken.png" forKey:@"Image"];
    [tanakaken setObject:@"田中賢" forKey:@"Name"];
    NSMutableDictionary *kurihara = [NSMutableDictionary dictionary];
    [kurihara setObject:@"kurihara.png" forKey:@"Image"];
    [kurihara setObject:@"栗原" forKey:@"Name"];
    NSMutableDictionary *morino = [NSMutableDictionary dictionary];
    [morino setObject:@"morino.png" forKey:@"Image"];
    [morino setObject:@"森野" forKey:@"Name"];
    NSMutableDictionary *tamura = [NSMutableDictionary dictionary];
    [tamura setObject:@"tamura.png" forKey:@"Image"];
    [tamura setObject:@"多村" forKey:@"Name"];
    NSMutableDictionary *ortiz = [NSMutableDictionary dictionary];
    [ortiz setObject:@"otiz.png" forKey:@"Image"];
    [ortiz setObject:@"ｵｰﾃｨｽﾞ" forKey:@"Name"];
    NSMutableDictionary *gotou = [NSMutableDictionary dictionary];
    [gotou setObject:@"gotou.png" forKey:@"Image"];
    [gotou setObject:@"後藤" forKey:@"Name"];
    NSMutableDictionary *sakamoto = [NSMutableDictionary dictionary];
    [sakamoto setObject:@"sakamoto.png" forKey:@"Image"];
    [sakamoto setObject:@"坂本" forKey:@"Name"];
    NSMutableDictionary *milledge = [NSMutableDictionary dictionary];
    [milledge setObject:@"mirezzi.png" forKey:@"Image"];
    [milledge setObject:@"ﾐﾚｯｼﾞ" forKey:@"Name"];
    
    balancePlayerArray = [NSMutableArray array];
    [balancePlayerArray addObject:matsuda];
    [balancePlayerArray addObject:saburo];
    [balancePlayerArray addObject:toritani];
    [balancePlayerArray addObject:hijirisawa];
    [balancePlayerArray addObject:tanakaken];
    [balancePlayerArray addObject:kurihara];
    [balancePlayerArray addObject:morino];
    [balancePlayerArray addObject:tamura];
    [balancePlayerArray addObject:ortiz];
    [balancePlayerArray addObject:gotou];
    [balancePlayerArray addObject:sakamoto];
    [balancePlayerArray addObject:milledge];

    
    //アベレージプレイヤー画像
    NSMutableDictionary *murton = [NSMutableDictionary dictionary];
    [murton setObject:@"murton.png" forKey:@"Image"];
    [murton setObject:@"ﾏｰﾄﾝ" forKey:@"Name"];
    NSMutableDictionary *uchikawa = [NSMutableDictionary dictionary];
    [uchikawa setObject:@"uchikawa.png" forKey:@"Image"];
    [uchikawa setObject:@"内川" forKey:@"Name"];
    NSMutableDictionary *imae = [NSMutableDictionary dictionary];
    [imae setObject:@"imae.png" forKey:@"Image"];
    [imae setObject:@"今江" forKey:@"Name"];
    NSMutableDictionary *hirose = [NSMutableDictionary dictionary];
    [hirose setObject:@"hirose.png" forKey:@"Image"];
    [hirose setObject:@"廣瀬" forKey:@"Name"];
    NSMutableDictionary *chono = [NSMutableDictionary dictionary];
    [chono setObject:@"chono.png" forKey:@"Image"];
    [chono setObject:@"長野" forKey:@"Name"];
    NSMutableDictionary *miyamoto = [NSMutableDictionary dictionary];
    [miyamoto setObject:@"miyamoto.png" forKey:@"Image"];
    [miyamoto setObject:@"宮本" forKey:@"Name"];
    NSMutableDictionary *teppei = [NSMutableDictionary dictionary];
    [teppei setObject:@"teppei.png" forKey:@"Image"];
    [teppei setObject:@"鉄平" forKey:@"Name"];
    NSMutableDictionary *sakaguchi = [NSMutableDictionary dictionary];
    [sakaguchi setObject:@"sakaguchi.png" forKey:@"Image"];
    [sakaguchi setObject:@"坂口" forKey:@"Name"];
    NSMutableDictionary *itoi = [NSMutableDictionary dictionary];
    [itoi setObject:@"itoi.png" forKey:@"Image"];
    [itoi setObject:@"糸井" forKey:@"Name"];
    NSMutableDictionary *oshima = [NSMutableDictionary dictionary];
    [oshima setObject:@"ooshima.png" forKey:@"Image"];
    [oshima setObject:@"大島" forKey:@"Name"];
    NSMutableDictionary *kinjo = [NSMutableDictionary dictionary];
    [kinjo setObject:@"kinjo.png" forKey:@"Image"];
    [kinjo setObject:@"金城" forKey:@"Name"];
    NSMutableDictionary *kuriyama = [NSMutableDictionary dictionary];
    [kuriyama setObject:@"kuriyama.png" forKey:@"Image"];
    [kuriyama setObject:@"栗山" forKey:@"Name"];
    
    averagePlayerArray = [NSMutableArray array];
    [averagePlayerArray addObject:murton];
    [averagePlayerArray addObject:uchikawa];
    [averagePlayerArray addObject:imae];
    [averagePlayerArray addObject:hirose];
    [averagePlayerArray addObject:chono];
    [averagePlayerArray addObject:miyamoto];
    [averagePlayerArray addObject:teppei];
    [averagePlayerArray addObject:sakaguchi];
    [averagePlayerArray addObject:itoi];
    [averagePlayerArray addObject:oshima];
    [averagePlayerArray addObject:kinjo];
    [averagePlayerArray addObject:kuriyama];

    
    //代打プレイヤー画像
    NSMutableDictionary *matsunaka = [NSMutableDictionary dictionary];
    [matsunaka setObject:@"matsunaka.png" forKey:@"Image"];
    [matsunaka setObject:@"松中" forKey:@"Name"];
    NSMutableDictionary *inaba = [NSMutableDictionary dictionary];
    [inaba setObject:@"inaba.png" forKey:@"Image"];
    [inaba setObject:@"稲葉" forKey:@"Name"];
    NSMutableDictionary *nakajima = [NSMutableDictionary dictionary];
    [nakajima setObject:@"nakajima.png" forKey:@"Image"];
    [nakajima setObject:@"中島" forKey:@"Name"];
    NSMutableDictionary *matsui = [NSMutableDictionary dictionary];
    [matsui setObject:@"matsuiKazuo" forKey:@"Image"];
    [matsui setObject:@"松井稼" forKey:@"Name"];
    NSMutableDictionary *ideho = [NSMutableDictionary dictionary];
    [ideho setObject:@"ideho.png" forKey:@"Image"];
    [ideho setObject:@"李大浩" forKey:@"Name"];
    NSMutableDictionary *fukuura = [NSMutableDictionary dictionary];
    [fukuura setObject:@"fukuura.png" forKey:@"Image"];
    [fukuura setObject:@"福浦" forKey:@"Name"];
    NSMutableDictionary *ogasawara = [NSMutableDictionary dictionary];
    [ogasawara setObject:@"ogasawara.png" forKey:@"Image"];
    [ogasawara setObject:@"小笠原" forKey:@"Name"];
    NSMutableDictionary *kanemoto = [NSMutableDictionary dictionary];
    [kanemoto setObject:@"kanemoto.png" forKey:@"Image"];
    [kanemoto setObject:@"金本" forKey:@"Name"];
    NSMutableDictionary *wada = [NSMutableDictionary dictionary];
    [wada setObject:@"wadaKazuhiro.png" forKey:@"Image"];
    [wada setObject:@"和田" forKey:@"Name"];
    NSMutableDictionary *maedatomo = [NSMutableDictionary dictionary];
    [maedatomo setObject:@"maedaTomonori.png" forKey:@"Image"];
    [maedatomo setObject:@"前田智" forKey:@"Name"];
    NSMutableDictionary *aoki = [NSMutableDictionary dictionary];
    [aoki setObject:@"aoki.png" forKey:@"Image"];
    [aoki setObject:@"青木" forKey:@"Name"];
    NSMutableDictionary *ramirez = [NSMutableDictionary dictionary];
    [ramirez setObject:@"ramirez.png" forKey:@"Image"];
    [ramirez setObject:@"ﾗﾐﾚｽ" forKey:@"Name"];
    NSMutableDictionary *yamazakiSusumu = [NSMutableDictionary dictionary];
    [yamazakiSusumu setObject:@"yamazaki.png" forKey:@"Image"];
    [yamazakiSusumu setObject:@"ZACKY" forKey:@"Name"];
    
    pinchHitterPlayerArray = [NSMutableArray array];
    [pinchHitterPlayerArray addObject:matsunaka];
    [pinchHitterPlayerArray addObject:inaba];
    [pinchHitterPlayerArray addObject:nakajima];
    [pinchHitterPlayerArray addObject:matsui];
    [pinchHitterPlayerArray addObject:ideho];
    [pinchHitterPlayerArray addObject:fukuura];
    [pinchHitterPlayerArray addObject:ogasawara];
    [pinchHitterPlayerArray addObject:kanemoto];
    [pinchHitterPlayerArray addObject:wada];
    [pinchHitterPlayerArray addObject:maedatomo];
    [pinchHitterPlayerArray addObject:aoki];
    [pinchHitterPlayerArray addObject:ramirez];
    [pinchHitterPlayerArray addObject:yamazakiSusumu];
}


- (void)setStadiumBackground{ 
    whatIsStadium = arc4random() % stadiumType;
    stadiumImage = [UIImage imageNamed:[stadiumBackgroundArray objectAtIndex:whatIsStadium]];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:stadiumImage];
}


- (IBAction)setPowerButtonDown:(id)sender {
     [self playerButtonHidden];
// TODO: clear
//    whatIsPlayerStyle = power;
//    whoIsPlayer = arc4random() % basePlayerType;
//    whichIsPowerPlayerImage = [[powerPlayerArray objectAtIndex:whoIsPlayer] objectForKey:@"Image"];
//    
//    self.batterImage.image = [UIImage imageNamed:whichIsPowerPlayerImage];
//    self.playerNameLabel.text = [[powerPlayerArray objectAtIndex:whoIsPlayer] objectForKey:@"Name"];
    
    [stadium selectBatter:PLAYER_POWER];
}


- (IBAction)setBalanceButtonDown:(id)sender {
    [self playerButtonHidden];
// TODO: clear
//    whatIsPlayerStyle = balance;
//    whoIsPlayer = arc4random() % basePlayerType;
//    whichIsBalancePlayerImage = [[balancePlayerArray objectAtIndex:whoIsPlayer] objectForKey:@"Image"];
//    
//    self.batterImage.image = [UIImage imageNamed:whichIsBalancePlayerImage];
//    self.playerNameLabel.text = [[balancePlayerArray objectAtIndex:whoIsPlayer] objectForKey:@"Name"];
    
    [stadium selectBatter:PLAYER_BALANCE];
}


- (IBAction)setAverageButtonDown:(id)sender {
    [self playerButtonHidden];
// TODO: clear
//    whatIsPlayerStyle = average;
//    whoIsPlayer = arc4random() % basePlayerType;
//    whichIsAveragePlayerImage = [[averagePlayerArray objectAtIndex:whoIsPlayer] objectForKey:@"Image"];
//    
//    self.batterImage.image = [UIImage imageNamed:whichIsAveragePlayerImage];
//    self.playerNameLabel.text = [[averagePlayerArray objectAtIndex:whoIsPlayer] objectForKey:@"Name"];
    
    [stadium selectBatter:PLAYER_AVERAGE];
}


- (IBAction)setPinchHitterButtonDown:(id)sender {
    [self playerButtonHidden];
// TODO: clear
//    whatIsPlayerStyle = pinchHitter;
//    didYouUsePinchHitter = YES;
//    whoIsPlayer = arc4random() % pinchHitterType;
//    whichIsPinchHitterPlayerImage = [[pinchHitterPlayerArray objectAtIndex:whoIsPlayer] objectForKey:@"Image"];
//    
//    self.batterImage.image = [UIImage imageNamed:whichIsPinchHitterPlayerImage];
//    self.playerNameLabel.text = [[pinchHitterPlayerArray objectAtIndex:whoIsPlayer] objectForKey:@"Name"];
    
    [stadium selectBatter:PLAYER_PINCH];
}


- (void)playerButtonHidden{
    self.balanceButton.hidden = YES;
    self.averageButton.hidden = YES;
    self.powerButton.hidden = YES;
    self.pinchHitterButton.hidden = YES;
    self.battingButton.hidden = NO;
    self.pitcherImage.hidden = NO;
    self.resultLabel.text = @"";
    
    self.playerNameLabel.hidden = NO;
    self.baseLabel.hidden = NO;
}


- (IBAction)battingButtonDown:(id)sender {    
    whatIsBattingResult = arc4random() % randamNumber;
    [self playerButtonVisible]; 
    
  
    
    switch(whatIsPlayerStyle){
        case power:
            if(whatIsBattingResult < 20){
                [self battingResultIs:homerun];
                        }
            
            if(whatIsBattingResult >= 20 && whatIsBattingResult < 21){
                [self battingResultIs:threeBaseHit];
                        }
            
            if(whatIsBattingResult >= 21 && whatIsBattingResult < 50) {
                [self battingResultIs:twoBaseHit];
                        }
            
            if (whatIsBattingResult >= 50 && whatIsBattingResult < 65) {
                [self battingResultIs:singleHit];
                        }
            
            if (whatIsBattingResult >= 65) {
                [self batterOut];
                        }
            break;
            
        case balance:
            if (whatIsBattingResult < 10) {
                [self battingResultIs:homerun];
                    }
            
            if (whatIsBattingResult >= 10 && whatIsBattingResult < 20) {
                [self battingResultIs:threeBaseHit];
                        }
            
            if (whatIsBattingResult >= 20 && whatIsBattingResult < 40) {
                [self battingResultIs:twoBaseHit];
                        }
            
            if (whatIsBattingResult >= 40 && whatIsBattingResult < 70) {
                [self battingResultIs:singleHit];
                        }
            
            if (whatIsBattingResult >= 70) {
                [self batterOut];
                        }
            break;
            
        case average:
            if (whatIsBattingResult < 5) {
                [self battingResultIs:homerun];
                        }
            
            if (whatIsBattingResult >= 5 && whatIsBattingResult < 15) {
                [self battingResultIs:threeBaseHit];
                        }
            
            if (whatIsBattingResult >= 15 && whatIsBattingResult < 35) {
                [self battingResultIs:twoBaseHit];
            }
            
            if (whatIsBattingResult >= 35 && whatIsBattingResult < 75) {
                [self battingResultIs:singleHit];
                        }
            
            if (whatIsBattingResult >= 75) {
                [self batterOut];
                        }
            break;
            
        case pinchHitter:
            if (whatIsBattingResult < 75) {
                [self battingResultIs:homerun];
            }
            
            if (whatIsBattingResult >= 75 && whatIsBattingResult < 79) {
                [self battingResultIs:threeBaseHit];
            }
            
            if (whatIsBattingResult >= 79 && whatIsBattingResult < 91) {
                [self battingResultIs:twoBaseHit];
            }
            
            if (whatIsBattingResult >= 91 && whatIsBattingResult < 95) {
                [self battingResultIs:singleHit];
            }
            
            if (whatIsBattingResult >= 95) {
                [self batterOut];
            }
            break;
    }
    
    whatIsPlayerStyle = nothing;

    self.battingButton.hidden = YES;
    
    if(didYouUsePinchHitter == YES){
        self.pinchHitterButton.hidden = YES;
        }
}
    
- (IBAction)resetButtonDown:(id)sender {
    [self initialize];
    [stadium resetStadium];
}


- (void)playerButtonVisible{
    self.powerButton.hidden = NO;
    self.averageButton.hidden = NO;
    self.balanceButton.hidden = NO;
        
        if(didYouUsePinchHitter == NO){
            self.pinchHitterButton.hidden = NO;
            }
}

 
- (void)batterOut{
    self.resultLabel.text = @"アウト!";
    outCount = outCount + 1;
    
    switch(outCount){
        case 1:
            self.outLabel.text = @"●";
            break;
        
        case 2:
            self.outLabel.text = @"●●";
            break;

        case 3:
            if(inning != 9){
        outCount = 0;
        _doesRunnerExists.third = NO;
        _doesRunnerExists.second = NO;
        _doesRunnerExists.first = NO;
        [self runnerImageDisplay];
        self.resultLabel.text = @"スリーアウト!!";
        self.outLabel.text = @"";
        self.battingButton.hidden = YES;
        self.balanceButton.hidden = YES;
        self.powerButton.hidden = YES;
        self.averageButton.hidden = YES;
        self.pinchHitterButton.hidden = YES;
        self.changeButton.hidden = NO;
        
        if(ownScore == 0){
            [self whoseScoreIsDisplayed:own];
            }
        }
            
            else{
                [self winLoseResults];
            }
        break;
    }
}

- (void)winLoseResults{
    self.battingButton.hidden = YES;
    self.balanceButton.hidden = YES;
    self.powerButton.hidden = YES;
    self.averageButton.hidden = YES;
    
    if(didYouUsePinchHitter == NO){
    self.pinchHitterButton.hidden = YES;
    }
    
    self.changeButton.hidden = YES;
    
    if(totalOwnScore + ownScore > totalEnemyScore){
        [self didYouWin:easyVictory];
            }
    
    if(totalOwnScore + ownScore < totalEnemyScore){
        self.resultLabel.text = @"敗北";
        [self whoseScoreIsDisplayed:own];
    }
    
    if(totalOwnScore + ownScore == totalEnemyScore){
        self.resultLabel.text = @"引き分け";
        [self whoseScoreIsDisplayed:own];
    }
}

- (void)didYouWin:(int)howToWin{
    
    if(inning == 9){
        if(totalOwnScore + ownScore > totalEnemyScore){
            switch(howToWin){
                case easyVictory:
                    self.resultLabel.text = @"勝利!";
                    if(ownScore == 0){
                        self.nineBottomLabel.text = @"X";
                    }
                    break;
                    
                case sayonaraWin:
                    self.resultLabel.text = @"サヨナラ勝ち!!!";
                    self.nineBottomLabel.text = [NSString stringWithFormat : @"%dX", totalEnemyScore - totalOwnScore + 1];
                    self.totalLabel.text = [NSString stringWithFormat : @"%dX", totalEnemyScore + 1];
                    break;
                    
                case sayonaraHomerun:
                    self.resultLabel.text = @"ｻﾖﾅﾗﾎｰﾑﾗﾝ!!!";
                    self.nineBottomLabel.text = [NSString stringWithFormat : @"%dX", ownScore];
                    break;

            }
            self.powerButton.hidden = YES;
            self.averageButton.hidden = YES;
            self.balanceButton.hidden = YES;
            self.pinchHitterButton.hidden = YES;
        }
    }
}


- (IBAction)changeButtonDown:(id)sender {
    
    self.powerButton.hidden = NO;
    self.averageButton.hidden = NO;
    self.balanceButton.hidden = NO;
    
    if(didYouUsePinchHitter == NO){
    self.pinchHitterButton.hidden = NO;
        }
    
    self.changeButton.hidden = YES;
    self.baseLabel.hidden = YES;
    self.playerNameLabel.hidden = YES;
    self.pitcherImage.hidden = YES;
    
    self.playerNameLabel.text = @"";
    self.resultLabel.text = @"チェンジ";
    self.baseLabel.text = @"ランナーなし";
    self.batterImage.image = [UIImage imageNamed:@""];
    self.baseImage.image = [UIImage imageNamed:@"noRunner.png"];
    inning = inning + 1;
    totalOwnScore = totalOwnScore + ownScore;
    ownScore = 0;
    self.totalLabel.text = [NSString stringWithFormat : @"%d", totalOwnScore];
    [self whoseScoreIsDisplayed:enemy];
}


- (void)whoseScoreIsDisplayed:(int)whichIsScore{
    switch(whichIsScore){
        //自分のスコア
        case own:
            switch(inning){
            case 7:
                self.sevenBottomLabel.text = [NSString stringWithFormat : @"%d", ownScore];
                self.totalLabel.text = [NSString stringWithFormat : @"%d", ownScore];
                break;
                
            case 8:
                self.eightBottomLabel.text = [NSString stringWithFormat : @"%d", ownScore];
                self.totalLabel.text = [NSString stringWithFormat : @"%d", totalOwnScore + ownScore];
                break;
                
            case 9:
                self.nineBottomLabel.text = [NSString stringWithFormat : @"%d", ownScore];
                self.totalLabel.text = [NSString stringWithFormat : @"%d", totalOwnScore + ownScore];
                    if(totalOwnScore > totalEnemyScore){
                        [self winLoseResults];
                    }
                break;
            }
            break;
            
        //相手スコア
        case enemy:
            switch(inning){
                case 8:
                    enemyScore = arc4random() % randomEnemyScore;
                    self.eightTopLabel.text = [NSString stringWithFormat:@"%d", enemyScore];
                    totalEnemyScore = totalEnemyScore + enemyScore;
                    self.totalEnemyLabel.text = [NSString stringWithFormat:@"%d", totalEnemyScore];
                    break;
                    
                case 9:
                    enemyScore = arc4random() % randomEnemyScore;
                    self.nineTopLabel.text = [NSString stringWithFormat:@"%d", enemyScore];
                    totalEnemyScore = totalEnemyScore + enemyScore;
                    self.totalEnemyLabel.text = [NSString stringWithFormat:@"%d", totalEnemyScore];
                    if(totalOwnScore > totalEnemyScore){
                        [self winLoseResults];
                    }
                    break;
            }
            break;
    }
}




- (void)battingResultIs:(int)whatIsResult{
    
    switch(whatIsResult){
            //シングルヒット
        case singleHit:
            self.resultLabel.text = @"ヒット!";
            if(_doesRunnerExists.third == YES){
                _doesRunnerExists.third = NO;
                ownScore = ownScore + 1;
                self.resultLabel.text = @"ﾀｲﾑﾘｰﾋｯﾄ!";     //
                [self whoseScoreIsDisplayed:own];                //順番固定
                [self didYouWin:sayonaraWin];           //
            }
            
            if(_doesRunnerExists.second == YES){
                _doesRunnerExists.third = YES;
                _doesRunnerExists.second = NO;
            }
            
            if(_doesRunnerExists.first == YES){
                _doesRunnerExists.second = YES;
            }
        
            _doesRunnerExists.first = YES;
            break;
         
            //ツーベースヒット
        case twoBaseHit:
            self.resultLabel.text = @"ツーベース!";
            if(_doesRunnerExists.third == YES){
                _doesRunnerExists.third = NO;
                ownScore = ownScore + 1;
                 self.resultLabel.text = @"ﾀｲﾑﾘｰﾂｰﾍﾞｰｽ!";
                [self whoseScoreIsDisplayed:own];
                [self didYouWin:sayonaraWin];
            }
            
            if(_doesRunnerExists.second == YES){
                _doesRunnerExists.second = NO;
                ownScore = ownScore + 1;
                self.resultLabel.text = @"ﾀｲﾑﾘｰﾂｰﾍﾞｰｽ!";
                [self whoseScoreIsDisplayed:own];
                [self didYouWin:sayonaraWin];
            }
            
            if(_doesRunnerExists.first == YES){
                _doesRunnerExists.third = YES;
                _doesRunnerExists.first = NO;
            }
            
            _doesRunnerExists.second = YES;
            break;
     
            //スリーベースヒット
        case threeBaseHit:
            self.resultLabel.text = @"スリーベース!";
            if(_doesRunnerExists.third == YES){
                _doesRunnerExists.third = NO;
                ownScore = ownScore + 1;
                self.resultLabel.text = @"ﾀｲﾑﾘｰｽﾘｰﾍﾞｰｽ!";
                [self whoseScoreIsDisplayed:own];
                [self didYouWin:sayonaraWin];
            }
            
            if(_doesRunnerExists.second == YES){
                _doesRunnerExists.second = NO;
                ownScore = ownScore + 1;
                self.resultLabel.text = @"ﾀｲﾑﾘｰｽﾘｰﾍﾞｰｽ!";
                [self whoseScoreIsDisplayed:own];
                [self didYouWin:sayonaraWin];
            }
            
            if(_doesRunnerExists.first == YES){
                _doesRunnerExists.first = NO;
                ownScore = ownScore + 1;
                self.resultLabel.text = @"ﾀｲﾑﾘｰｽﾘｰﾍﾞｰｽ!";
                [self whoseScoreIsDisplayed:own];
                [self didYouWin:sayonaraWin];
            }
            
            _doesRunnerExists.third = YES;
            break;
            
            //ホームラン
        case homerun:
            self.resultLabel.text = @"HOMERUN!!";
            if(_doesRunnerExists.third == YES){
                _doesRunnerExists.third = NO;
                ownScore = ownScore + 1;
            }
            
            if(_doesRunnerExists.second == YES){
                _doesRunnerExists.second = NO;
                ownScore = ownScore + 1;
            }
            
            if(_doesRunnerExists.first == YES){
                _doesRunnerExists.first = NO;
                ownScore = ownScore + 1;
            }
            
            ownScore = ownScore + 1;
            [self whoseScoreIsDisplayed:own]; //[self win:2]より先
            [self didYouWin:sayonaraHomerun];
            break;
            
    }
    [self runnerImageDisplay];
    [self descriptionOfBaseSituation];
}

- (void)runnerImageDisplay{
    if(_doesRunnerExists.third == YES){
        self.thirdRunner.hidden = NO;
    }
    
    if(_doesRunnerExists.third == NO){
         self.thirdRunner.hidden = YES;
    }
    
    if(_doesRunnerExists.second == YES){
         self.secondRunner.hidden = NO;
    }
    
    if(_doesRunnerExists.second == NO){
         self.secondRunner.hidden = YES;
    }
    
    if(_doesRunnerExists.first == YES){
         self.firstRunner.hidden = NO;
    }
    
    if(_doesRunnerExists.first == NO){
         self.firstRunner.hidden = YES;
    }
    
}


- (void)descriptionOfBaseSituation{
    //ランナー無し
    if(_doesRunnerExists.first == NO && _doesRunnerExists.second == NO && _doesRunnerExists.third == NO){
        self.baseLabel.text = @"ランナーなし";
    }
    
    //ランナー１塁
    if(_doesRunnerExists.first == YES && _doesRunnerExists.second == NO && _doesRunnerExists.third == NO){
        self.baseLabel.text = @"ランナー１塁";
    }
    
    //ランナー２塁
    if(_doesRunnerExists.first == NO && _doesRunnerExists.second == YES && _doesRunnerExists.third == NO){
        self.baseLabel.text = @"ランナー２塁";
    }
    
    //ランナー３塁
    if(_doesRunnerExists.first == NO && _doesRunnerExists.second == NO && _doesRunnerExists.third == YES){
        self.baseLabel.text = @"ランナー３塁";
    }
    
    //ランナー１、２塁
    if(_doesRunnerExists.first == YES && _doesRunnerExists.second == YES && _doesRunnerExists.third == NO){
        self.baseLabel.text = @"ランナー１、２塁";
    }
    
    //ランナー１、３塁
    if(_doesRunnerExists.first == YES && _doesRunnerExists.second == NO && _doesRunnerExists.third == YES){
        self.baseLabel.text = @"ランナー１、３塁";
    }
    
    //ランナー２、３塁
    if(_doesRunnerExists.first == NO && _doesRunnerExists.second == YES && _doesRunnerExists.third == YES){
        self.baseLabel.text = @"ランナー２、３塁";
    }
    
    //ランナー満塁
    if(_doesRunnerExists.first == YES && _doesRunnerExists.second == YES && _doesRunnerExists.third == YES){
        self.baseLabel.text = @"ランナー満塁!!";
    }
    
}

-(void) initializeStadium:(NSNotification *)notify
{
    NSString *imageInfo = [[notify userInfo] objectForKey:@"StadiumImage"];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageInfo]];
}

-(void) updateScore:(NSNotification *)notify
{
    NSDictionary *scoreInfo = [notify userInfo];
    int turn = [[scoreInfo objectForKey:@"Gameturn"] intValue];
    inning = [[scoreInfo objectForKey:@"GameInning"] intValue];
    int curScore = [[scoreInfo objectForKey:@"CurrentScore"] intValue];
    int totalScore =[[scoreInfo objectForKey:@"TotalScore"] intValue];
    outCount = [[scoreInfo objectForKey:@"OutCount"] intValue];
    
    NSLog(@"%d, %d, %d, %d", turn, inning, curScore, totalScore);
    
    self.sevenBottomLabel.text = [NSString stringWithFormat : @"%d", curScore];
    self.totalLabel.text = [NSString stringWithFormat : @"%d", totalScore];

    
    self.eightBottomLabel.text = [NSString stringWithFormat : @"%d", curScore];
    self.totalLabel.text = [NSString stringWithFormat : @"%d", totalScore];

    
    self.nineBottomLabel.text = [NSString stringWithFormat : @"%d", curScore];
    self.totalLabel.text = [NSString stringWithFormat : @"%d", totalScore];
    
}

-(void) changePlayer:(NSNotification *)notify
{
    NSDictionary *playerInfo = [notify userInfo];
    NSString *playerName =[playerInfo objectForKey:@"PlayerName"];
    NSString *playerImage = [playerInfo objectForKey:@"PlayerImage"];
    self.playerNameLabel.text = playerName;
    self.batterImage.image = [UIImage imageNamed:playerImage];
}

@end
