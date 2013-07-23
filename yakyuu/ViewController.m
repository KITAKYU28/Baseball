//
//  ViewController.m
//  yakyuu
//
//  Created by 篠原　辰徳 on 13/01/09.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "ViewController.h"
#define randomEnemyScore 11
//#define nameFontSize 20
#define stadiumType 12
#define basePlayerType 12
#define pinchHitterType 13
#define randamNumber 100

@interface ViewController (){
    int playerStyle;
    int battingResult;
    int ownScore;
    int enemyScore;
    int outCount;
    //int whichBaseIsRunner;
    //int buttonHidden;    不要だったので削除
    int randomPlayer;
    int totalEnemyScore;
    int totalOwnScore;
    int inning;
    int sayonara;
    int pinchHitter; 
    int stadiumNumber;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initialize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)initialize{ 
    playerStyle = 0;
    battingResult = 0;
    enemyScore = 0;
    randomPlayer = 0;
    totalEnemyScore = 0;
    sayonara = 0;
    pinchHitter = 0;
    stadiumNumber = 0;
    
    outCount = 0;
    ownScore = 0;
    //whichBaseIsRunner = 0; //enumで、bitで
    _baseRunnerExist.third = 0;
    _baseRunnerExist.second = 0;
    _baseRunnerExist.first = 0;
    [self baseImageMethod];
    inning = 7;
    //buttonHidden = 0; //Yes,Noでやる
    totalOwnScore = 0;
    pinchHitter = 0;
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
    //self.resultLabel.hidden = YES;
    self.baseLabel.hidden = YES;
    //self.baseImage.hidden = YES;
    //self.outLabel.hidden = YES;
    
    self.batterImage.image = [UIImage imageNamed:@""];  //hiddenのメソッドを作ってもいいかも
    self.baseImage.image = [UIImage imageNamed:@"noRunner.png"]; //画像の名前も英語。もしくは画像のメソッドを作成
    self.playerNameLabel.text = @"";
    enemyScore = arc4random() % randomEnemyScore;       //メソッドとして抽出したほうがいいかも？
    //self.playerNameLabel.font = [UIFont boldSystemFontOfSize:nameFontSize];
    
    self.sevenTopLabel.text = [NSString stringWithFormat : @"%d", enemyScore];
    totalEnemyScore = enemyScore;
    self.totalEnemyLabel.text = [NSString stringWithFormat : @"%d", totalEnemyScore];
    
    
    
    //スタジアム画像
    stadiumBackgroundArray = [NSMutableArray array];
    [stadiumBackgroundArray addObject:@"yahoo.png"];     //メンバー変数を登録、initializeに画像を書く
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

    [self setStadiumBackground];
    
    
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
    [ramirez setObject:@"ramiresu.png" forKey:@"Image"];
    [ramirez setObject:@"ﾗﾐﾚｽ" forKey:@"Name"];
    NSMutableDictionary *yamazakiSusumu = [NSMutableDictionary dictionary];
    [yamazakiSusumu setObject:@"yamazaki.png" forKey:@"Image"];
    [yamazakiSusumu setObject:@"ｻﾞｯｷｰ" forKey:@"Name"];
    
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
    stadiumNumber = arc4random() % stadiumType;
    
    UIImage *stadiumImage = [UIImage imageNamed:[stadiumBackgroundArray objectAtIndex:stadiumNumber]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:stadiumImage];
    
    //整理する
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[stadiumBackgroundArray objectAtIndex:stadiumNumber]]];
    
}

- (IBAction)setPowerButtonDown:(id)sender {
    /*
    self.balanceButton.hidden = YES;
    self.averageButton.hidden = YES;
    self.powerButton.hidden = YES;
    self.pinchHitterButton.hidden = YES;
    self.battingButton.hidden = NO;
    */
     [self playerButtonDownHidden];
    playerStyle = 1;
    
    randomPlayer = arc4random() % basePlayerType; 
    
    //self.batterImage.image = [UIImage imageNamed:[[powerPlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"]];
    
    //UIImage *playerImage = [[powerPlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"];
    NSString *playerImage = [[powerPlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"];
    self.batterImage.image = [UIImage imageNamed:playerImage];
    self.playerNameLabel.text = [[powerPlayerArray objectAtIndex:randomPlayer] objectForKey:@"Name"];
}

- (IBAction)setBalanceButtonDown:(id)sender {
    [self playerButtonDownHidden];
    playerStyle = 2;
    
    randomPlayer = arc4random() % basePlayerType;
    
    //self.batterImage.image = [UIImage imageNamed:[[balancePlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"]];
    NSString *balancePlayer = [[balancePlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"];
    self.batterImage.image = [UIImage imageNamed:balancePlayer];
    self.playerNameLabel.text = [[balancePlayerArray objectAtIndex:randomPlayer] objectForKey:@"Name"];
}

- (IBAction)setAverageButtonDown:(id)sender {
    [self playerButtonDownHidden];
    playerStyle = 3;
    
    randomPlayer = arc4random() % basePlayerType;
    
        
    //self.batterImage.image = [UIImage imageNamed:[[averagePlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"]];
    NSString *averagePlayer = [[averagePlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"];
    self.batterImage.image = [UIImage imageNamed:averagePlayer];
    self.playerNameLabel.text = [[averagePlayerArray objectAtIndex:randomPlayer] objectForKey:@"Name"];
}

- (IBAction)setPinchHitterButtonDown:(id)sender {
    [self playerButtonDownHidden];
    playerStyle = 4;
    pinchHitter = 1;
    
    randomPlayer = arc4random() % pinchHitterType;
   

    //self.batterImage.image = [UIImage imageNamed:[[pinchHitterPlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"]];
    NSString *pinchHitterPlayer = [[pinchHitterPlayerArray objectAtIndex:randomPlayer] objectForKey:@"Image"];
    self.batterImage.image = [UIImage imageNamed:pinchHitterPlayer];
    self.playerNameLabel.text = [[pinchHitterPlayerArray objectAtIndex:randomPlayer] objectForKey:@"Name"];
}


- (void)playerButtonDownHidden{
    self.balanceButton.hidden = YES;
    self.averageButton.hidden = YES;
    self.powerButton.hidden = YES;
    self.pinchHitterButton.hidden = YES;
    self.battingButton.hidden = NO;
    self.resultLabel.text = @"";
    
    self.playerNameLabel.hidden = NO;
    //self.resultLabel.hidden = NO;
    self.baseLabel.hidden = NO;
    //self.baseImage.hidden = NO;
    //self.outLabel.hidden = NO;
}


- (IBAction)battingButtonDown:(id)sender {    
    battingResult = arc4random() % randamNumber;
    [self buttonPowerAverageBalanceHiddenNo]; //メソッドの先頭に持ってきた
    
    switch(playerStyle){
            
        case 1:
            if(battingResult < 20){
                [self homerun];
                        }
            
            if(battingResult >= 20 && battingResult < 21){
                [self threeBaseHit];
                        }
            
            if(battingResult >= 21 && battingResult < 50) {
               [self twoBaseHit];
                        }
            
            if (battingResult >= 50 && battingResult < 65) {
                [self singleHit];
                        }
            
            if (battingResult >= 65) {
                [self batterOut];
                        }
            break;
            
        case 2:
            if (battingResult < 10) {
                [self homerun];
                    }
            
            if (battingResult >= 10 && battingResult < 20) {
                [self threeBaseHit];
                        }
            
            if (battingResult >= 20 && battingResult < 40) {
                [self twoBaseHit];
                        }
            
            if (battingResult >= 40 && battingResult < 70) {
                [self singleHit];
                        }
            
            if (battingResult >= 70) {
                [self batterOut];
                        }
            break;
            
        case 3:
            if (battingResult < 5) {
                [self homerun];
                        }
            
            if (battingResult >= 5 && battingResult < 15) {
                [self threeBaseHit];
                        }
            
            if (battingResult >= 15 && battingResult < 35) {
                [self twoBaseHit];
            }
            
            if (battingResult >= 35 && battingResult < 75) {
                [self singleHit];
                        }
            
            if (battingResult >= 75) {
                [self batterOut];
                        }
            break;
            
        case 4:
            if (battingResult < 50) {
                [self homerun];
            }
            
            if (battingResult >= 50 && battingResult < 55) {
                [self threeBaseHit];
            }
            
            if (battingResult >= 55 && battingResult < 85) {
                [self twoBaseHit];
            }
            
            if (battingResult >= 85 && battingResult < 95) {
                [self singleHit];
            }
            
            if (battingResult >= 95) {
                [self batterOut];
            }
            break;
    }
    
    playerStyle = 0;

    self.battingButton.hidden = YES;
    
    /*if(buttonHidden == 1){
        self.balanceButton.hidden =YES;
        self.averageButton.hidden = YES;
        self.powerButton.hidden = YES;
      */
    
    if(pinchHitter == 1){
        self.pinchHitterButton.hidden = YES;
        }
}
    
- (IBAction)resetButtonDown:(id)sender {
    [self initialize];
}


- (void)buttonPowerAverageBalanceHiddenNo{
    //if(buttonHidden != 1){
    self.powerButton.hidden = NO;
    self.averageButton.hidden = NO;
    self.balanceButton.hidden = NO;
        
        if(pinchHitter == 0){
            self.pinchHitterButton.hidden = NO;
            }
   // }
}

- (void)homerun{
    self.resultLabel.text = @"HOMERUN!!";
    [self runner:4];
}

- (void)threeBaseHit{
    self.resultLabel.text = @"スリーベース!";
    [self runner:3];
}

- (void)twoBaseHit{
    self.resultLabel.text = @"ツーベース!";
    [self runner:2];
}

- (void)singleHit{
    self.resultLabel.text = @"ヒット!";
    [self runner:1];
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
        //whichBaseIsRunner = 0;
        _baseRunnerExist.third = 0;
        _baseRunnerExist.second = 0;
        _baseRunnerExist.first = 0;
        [self baseImageMethod];
        self.resultLabel.text = @"スリーアウト!!";
        //self.baseLabel.text = @"";
        self.outLabel.text = @"";
        self.battingButton.hidden = YES;
        self.balanceButton.hidden = YES;
        self.powerButton.hidden = YES;
        self.averageButton.hidden = YES;
        self.pinchHitterButton.hidden = YES;
        self.changeButton.hidden = NO;
        
        if(ownScore == 0){
            [self scoreDisplay:1];
            }
            }
            
            else{
                [self winLose];
            }
        break;
    }
}

- (void)winLose{
    self.battingButton.hidden = YES;
    self.balanceButton.hidden = YES;
    self.powerButton.hidden = YES;
    self.pinchHitterButton.hidden = YES;
    self.averageButton.hidden = YES;
    self.changeButton.hidden = YES;
    
    if(totalOwnScore + ownScore > totalEnemyScore){
        [self win:0];
            }
    
    if(totalOwnScore + ownScore < totalEnemyScore){
        self.resultLabel.text = @"敗北";
        [self scoreDisplay:1];
    }
    
    if(totalOwnScore + ownScore == totalEnemyScore){
        self.resultLabel.text = @"引き分け";
        [self scoreDisplay:1];
    }
}

- (void)win:(int)number{
    [self scoreDisplay:1];
    
    if(inning == 9){
        if(totalOwnScore + ownScore > totalEnemyScore){
    switch(number){
        case 0:
            self.resultLabel.text = @"勝利!";
            if(ownScore == 0){
                self.nineBottomLabel.text = @"X";
            }
            break;
            
        case 1:
            self.resultLabel.text = @"サヨナラ勝ち!!!";
            self.nineBottomLabel.text = [NSString stringWithFormat : @"%dX", totalEnemyScore - totalOwnScore + 1];
            self.totalLabel.text = [NSString stringWithFormat : @"%dX", totalEnemyScore + 1];
            break;
            
        case 2:
            self.resultLabel.text = @"ｻﾖﾅﾗﾎｰﾑﾗﾝ!!!";
            self.nineBottomLabel.text = [NSString stringWithFormat : @"%dX", ownScore];
            break;
            
        case 3:
            self.resultLabel.text = @"逆転ｻﾖﾅﾗﾎｰﾑﾗﾝ!!!";
            self.nineBottomLabel.text = [NSString stringWithFormat : @"%dX", ownScore];
            break;
            
        case 4:
            self.resultLabel.text = @"ｻﾖﾅﾗ満塁ﾎｰﾑﾗﾝ!!!";
            self.nineBottomLabel.text = [NSString stringWithFormat : @"%dX", ownScore];
            break;
            
        case 5:
            self.resultLabel.text = @"逆転ｻﾖﾅﾗ満塁ﾎｰﾑﾗﾝ!!!";
            self.nineBottomLabel.text = [NSString stringWithFormat : @"%dX", ownScore];
            break;

    }
    }
}
}

- (IBAction)changeButtonDown:(id)sender {
    self.powerButton.hidden = NO;
    self.averageButton.hidden = NO;
    self.balanceButton.hidden = NO;
    
    if(pinchHitter == 0){
    self.pinchHitterButton.hidden = NO;
        }
    
    self.changeButton.hidden = YES;
    self.baseLabel.hidden = YES;
    self.playerNameLabel.hidden = YES;
    
    self.playerNameLabel.text = @"";
    self.resultLabel.text = @"チェンジ";
    self.baseLabel.text = @"ランナーなし";
    self.batterImage.image = [UIImage imageNamed:@""];
    self.baseImage.image = [UIImage imageNamed:@"noRunner.png"];
    inning = inning + 1;
    totalOwnScore = totalOwnScore + ownScore;
    ownScore = 0;
    self.totalLabel.text = [NSString stringWithFormat : @"%d", totalOwnScore];
    [self scoreDisplay:2];
}

- (void)scoreDisplay:(int)number{
    switch(number){
        //自分のスコア
        case 1:
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
                    [self winLose];
                }
            break;
    }
            break;
            
        //相手スコア
        case 2:
            switch(inning){
                case 8:
                    enemyScore = arc4random() % randomEnemyScore;
                    self.eightTopLabel.text = [NSString stringWithFormat:@"%d", enemyScore];
                    totalEnemyScore = totalEnemyScore+enemyScore;
                    self.totalEnemyLabel.text = [NSString stringWithFormat:@"%d", totalEnemyScore];
                    break;
                    
                case 9:
                    enemyScore = arc4random() % randomEnemyScore;
                    self.nineTopLabel.text = [NSString stringWithFormat:@"%d", enemyScore];
                    totalEnemyScore = totalEnemyScore+enemyScore;
                    self.totalEnemyLabel.text = [NSString stringWithFormat:@"%d", totalEnemyScore];
                    if(totalOwnScore > totalEnemyScore){
                        [self winLose];
                    }
                    break;
            }
        break;
}
}

/*
- (void)runner:(int)number{
    switch(whichBaseIsRunner){
        //ランナー無し
        case 0:
            switch(number){
            //ランナー一塁
            case 1:
                whichBaseIsRunner = 1;
                self.baseLabel.text = @"ランナー1塁";
                    self.baseImage.image = [UIImage imageNamed:@"ランナー一塁.jpg"];
                    break;
                
            //ランナー二塁
            case 2:
                whichBaseIsRunner = 2;
                self.baseLabel.text = @"ランナー2塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー二塁.jpg"];
                    break;
                
            //ランナー三塁
            case 3:
                whichBaseIsRunner = 3;
                self.baseLabel.text = @"ランナー3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー三塁.jpg"];
                    break;
                
            //ランナー無し、得点1
            case 4:
                whichBaseIsRunner = 0;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー無し";
                self.baseImage.image = [UIImage imageNamed:@"ランナー無.jpg"];
                    [self win:2];
                    break;
        }
            break;
    
    //ランナー一塁
    case 1:
        switch(number){
                //ランナー一、二塁
            case 1:
                whichBaseIsRunner = 12;
                self.baseLabel.text = @"ランナー1、2塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー一塁二塁.jpg"];
                break;
                
                //ランナー二、三塁
            case 2:
                whichBaseIsRunner = 23;
                self.baseLabel.text = @"ランナー2、3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー二塁三塁.jpg"];
                break;
                
                //ランナー三塁、得点1
            case 3:
                whichBaseIsRunner = 3;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー三塁.jpg"];
                [self win:1];
                break;
            
                //ランナー無し、得点2
            case 4:
                whichBaseIsRunner = 0;
                ownScore = ownScore + 2;
                [self score:1];
                self.baseLabel.text = @"ランナー無し";
                self.baseImage.image = [UIImage imageNamed:@"ランナー無.jpg"];
                [self win:2];
                break;

        }
            break;
    
    //ランナー二塁
    case 2:
        switch(number){
                //ランナー一、三塁
            case 1:
                whichBaseIsRunner = 13;
                self.baseLabel.text = @"ランナー1、3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー一塁三塁.jpg"];
                break;
                
                //ランナー二塁、得点1
            case 2:
                whichBaseIsRunner = 2;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー2塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー二塁.jpg"];
                [self win:1];
                break;
                
                //ランナー三塁、得点1
            case 3:
                whichBaseIsRunner = 3;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー三塁.jpg"];
                [self win:1];
                break;
                
                //ランナー無し、得点2
            case 4:
                whichBaseIsRunner = 0;
                ownScore = ownScore + 2;
                [self score:1];
                self.baseLabel.text = @"ランナー無し";
                self.baseImage.image = [UIImage imageNamed:@"ランナー無.jpg"];
                [self win:2];
                break;
        }
            break;
    
    //ランナー三塁
    case 3:
        switch(number){
                //ランナー一塁、得点1
            case 1:
                whichBaseIsRunner = 1;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー1塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー一塁.jpg"];
                [self win:1];
                break;
                
                //ランナー二塁、得点1
            case 2:
                whichBaseIsRunner = 2;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー2塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー二塁.jpg"];
                [self win:1];
                break;
                
                //ランナー三塁、得点1
            case 3:
                whichBaseIsRunner = 3;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー三塁.jpg"];
                [self win:1];
                break;
                
                //ランナー無し、得点2
            case 4:
                whichBaseIsRunner = 0;
                ownScore = ownScore + 2;
                [self score:1];
                self.baseLabel.text = @"ランナー無し";
                self.baseImage.image = [UIImage imageNamed:@"ランナー無.jpg"];
                [self win:2];
                break;
        }
            break;

    //ランナー一、二塁
    case 12:
        switch(number){
                //ランナー満塁
            case 1:
                whichBaseIsRunner = 4;
                self.baseLabel.text = @"ランナー満塁!!";
                self.baseImage.image = [UIImage imageNamed:@"ランナー満塁.jpg"];
                break;
                
                //ランナー二、三塁、得点1
            case 2:
                whichBaseIsRunner = 23;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー2、3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー二塁三塁.jpg"];
                [self win:1];
                break;
                
                //ランナー三塁、得点2
            case 3:
                whichBaseIsRunner = 3;
                ownScore = ownScore + 2;
                [self score:1];
                self.baseLabel.text = @"ランナー3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー三塁.jpg"];
                [self win:1];
                break;
                
                //ランナー無し、得点3
            case 4:
                whichBaseIsRunner = 0;
                ownScore = ownScore + 3;
                [self score:1];
                self.baseLabel.text = @"ランナー無し";
                self.baseImage.image = [UIImage imageNamed:@"ランナー無.jpg"];
                [self win:2];
                break;
        }
            break;
    
    //ランナー一、三塁
    case 13:
        switch(number){
                //ランナー1、2塁、得点1
                case 1:
                    whichBaseIsRunner = 12;
                    ownScore = ownScore + 1;
                    [self score:1];
                    self.baseLabel.text = @"ランナー1、2塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー一塁二塁.jpg"];
                [self win:1];
                    break;
                    
                    //ランナー二、三塁、得点1
                case 2:
                    whichBaseIsRunner = 23;
                    ownScore = ownScore + 1;
                    [self score:1];
                    self.baseLabel.text = @"ランナー2、3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー二塁三塁.jpg"];
                [self win:1];
                    break;
                    
                    //ランナー三塁、得点2
                case 3:
                    whichBaseIsRunner = 3;
                    ownScore = ownScore + 2;
                    [self score:1];
                    self.baseLabel.text = @"ランナー3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー三塁.jpg"];
                [self win:1];
                break;
                    
                    //ランナー無し、得点3
                case 4:
                    whichBaseIsRunner = 0;
                    ownScore = ownScore + 3;
                    [self score:1];
                    self.baseLabel.text = @"ランナー無し";
                self.baseImage.image = [UIImage imageNamed:@"ランナー無.jpg"];
                [self win:2];
                    break;
            }
            break;
            
    //ランナー二、三塁
    case 23:
        switch(number){
                //ランナー一、三塁、得点1
            case 1:
                whichBaseIsRunner = 13;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー1、3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー一塁三塁.jpg"];
                [self win:1];
                break;
                
                //ランナー二塁、得点2
            case 2:
                whichBaseIsRunner = 2;
                ownScore = ownScore + 2;
                [self score:1];
                self.baseLabel.text = @"ランナー2塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー二塁.jpg"];
                [self win:1];
                break;
                
                //ランナー三塁、得点2
            case 3:
                whichBaseIsRunner = 3;
                ownScore = ownScore + 2;
                [self score:1];
                self.baseLabel.text = @"ランナー3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー三塁.jpg"];
                [self win:1];
                break;
                
                //ランナー無し、得点3
            case 4:
                whichBaseIsRunner = 0;
                ownScore = ownScore + 3;
                [self score:1];
                self.baseLabel.text = @"ランナー無し";
                self.baseImage.image = [UIImage imageNamed:@"ランナー無.jpg"];
                [self win:2];
                break;
        }
            break;

    //ランナー満塁
    case 4:
        switch(number){
                //ランナー満塁、得点1
            case 1:
                whichBaseIsRunner = 4;
                ownScore = ownScore + 1;
                [self score:1];
                self.baseLabel.text = @"ランナー満塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー満塁.jpg"];
                [self win:1];
                break;
                
                //ランナー二、三塁、得点2
            case 2:
                whichBaseIsRunner = 23;
                ownScore = ownScore + 2;
                [self score:1];
                self.baseLabel.text = @"ランナー2、3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー二塁三塁.jpg"];
                [self win:1];
                break;
                
                //ランナー三塁、得点3
            case 3:
                whichBaseIsRunner = 3;
                ownScore = ownScore + 3;
                [self score:1];
                self.baseLabel.text = @"ランナー3塁";
                self.baseImage.image = [UIImage imageNamed:@"ランナー三塁.jpg"];
                [self win:1];
                break;
                
                //ランナー無し、得点4
            case 4:
                whichBaseIsRunner = 0;
                ownScore = ownScore + 4;
                [self score:1];
                self.baseLabel.text = @"ランナー無し";
                self.baseImage.image = [UIImage imageNamed:@"ランナー無.jpg"];
                [self win:4];
                break;
        }
            break;
}
}
*/

- (void)runner:(int)number{
    
    switch(number){
            //シングルヒット
        case 1:
            if(_baseRunnerExist.third == 1){
                _baseRunnerExist.third = 0;
                ownScore = ownScore + 1;
                [self win:1];
            }
            
            if(_baseRunnerExist.second == 1){
                _baseRunnerExist.third = 1;
                _baseRunnerExist.second = 0;
            }
            
            if(_baseRunnerExist.first == 1){
                _baseRunnerExist.second = 1;
            }
        
            _baseRunnerExist.first = 1;
            break;
         
            //ツーベースヒット
        case 2:
            if(_baseRunnerExist.third == 1){
                _baseRunnerExist.third = 0;
                ownScore = ownScore + 1;
                [self win:1];
            }
            
            if(_baseRunnerExist.second == 1){
                _baseRunnerExist.second = 0;
                ownScore = ownScore + 1;
                [self win:1];
            }
            
            if(_baseRunnerExist.first == 1){
                _baseRunnerExist.third = 1;
                _baseRunnerExist.first = 0;
            }
            
            _baseRunnerExist.second = 1;
            break;
     
            //スリーベースヒット
        case 3:
            if(_baseRunnerExist.third == 1){
                _baseRunnerExist.third = 0;
                ownScore = ownScore + 1;
                [self win:1];
            }
            
            if(_baseRunnerExist.second == 1){
                _baseRunnerExist.second = 0;
                ownScore = ownScore + 1;
                [self win:1];
            }
            
            if(_baseRunnerExist.first == 1){
                _baseRunnerExist.first = 0;
                ownScore = ownScore + 1;
                [self win:1];
            }
            
            _baseRunnerExist.third = 1;
            break;
            
            //ホームラン
        case 4:
            if(_baseRunnerExist.third == 1){
                _baseRunnerExist.third = 0;
                ownScore = ownScore + 1;
            }
            
            if(_baseRunnerExist.second == 1){
                _baseRunnerExist.second = 0;
                ownScore = ownScore + 1;
            }
            
            if(_baseRunnerExist.first == 1){
                _baseRunnerExist.first = 0;
                ownScore = ownScore + 1;
            }
            
            ownScore = ownScore + 1;
            [self win:2];
            break;
            
    }
    
    [self baseImageMethod];
    [self baseRunnerText];
}

- (void)baseImageMethod{
    if(_baseRunnerExist.third == 1){
        self.runnerThird.hidden = NO;
    }
    
    if(_baseRunnerExist.third == 0){
         self.runnerThird.hidden = YES;
    }
    
    if(_baseRunnerExist.second == 1){
         self.runnerSecond.hidden = NO;
    }
    
    if(_baseRunnerExist.second == 0){
         self.runnerSecond.hidden = YES;
    }
    
    if(_baseRunnerExist.first == 1){
         self.runnerFirst.hidden = NO;
    }
    
    if(_baseRunnerExist.first == 0){
         self.runnerFirst.hidden = YES;
    }
    
}


- (void)baseRunnerText{
    //ランナー無し
    if(_baseRunnerExist.first == 0 && _baseRunnerExist.second == 0 && _baseRunnerExist.third == 0){
        self.baseLabel.text = @"ランナーなし";
    }
    
    //ランナー１塁
    if(_baseRunnerExist.first == 1 && _baseRunnerExist.second == 0 && _baseRunnerExist.third == 0){
        self.baseLabel.text = @"ランナー１塁";
    }
    
    //ランナー２塁
    if(_baseRunnerExist.first == 0 && _baseRunnerExist.second == 1 && _baseRunnerExist.third == 0){
        self.baseLabel.text = @"ランナー２塁";
    }
    
    //ランナー３塁
    if(_baseRunnerExist.first == 0 && _baseRunnerExist.second == 0 && _baseRunnerExist.third == 1){
        self.baseLabel.text = @"ランナー３塁";
    }
    
    //ランナー１、２塁
    if(_baseRunnerExist.first == 1 && _baseRunnerExist.second == 1 && _baseRunnerExist.third == 0){
        self.baseLabel.text = @"ランナー１、２塁";
    }
    
    //ランナー１、３塁
    if(_baseRunnerExist.first == 1 && _baseRunnerExist.second == 0 && _baseRunnerExist.third == 1){
        self.baseLabel.text = @"ランナー１、３塁";
    }
    
    //ランナー２、３塁
    if(_baseRunnerExist.first == 0 && _baseRunnerExist.second == 1 && _baseRunnerExist.third == 1){
        self.baseLabel.text = @"ランナー２、３塁";
    }
    
    //ランナー満塁
    if(_baseRunnerExist.first == 1 && _baseRunnerExist.second == 1 && _baseRunnerExist.third == 1){
        self.baseLabel.text = @"ランナー満塁!!";
    }
    
}

@end
