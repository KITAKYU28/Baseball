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
    int whatIsBattingResult;
    int ownScore;
    int enemyScore;
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
    
    [self initialize];
    
    // TODO: Comfirm the position of these codes.
    NSNotificationCenter *notifyCenter = [NSNotificationCenter defaultCenter];
    [notifyCenter addObserver:self selector:@selector(initializeStadium:) name:@"InitializeStadium" object:stadium];
    [notifyCenter addObserver:self selector:@selector(updateScore:) name:@"UpdateScore" object:stadium];
    [notifyCenter addObserver:self selector:@selector(changePlayer:) name:@"ChangePlayer" object:stadium];
    [notifyCenter addObserver:self selector:@selector(batterOut:) name:@"BatterOut" object:stadium];
    [notifyCenter addObserver:self selector:@selector(updateRunners:) name:@"UpdateRunners" object:stadium];
    
    stadium = [[Stadium alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initialize{
    
    enemyScore = 0;
    totalEnemyScore = 0;
    whatIsBattingResult = nothing;
    whoIsPlayer = nothing;
    //sayonara = 0;
    didYouUsePinchHitter = NO;
    whatIsStadium = nothing;
    
    ownScore = 0;
    _doesRunnerExists.third = NO;
    _doesRunnerExists.second = NO;
    _doesRunnerExists.first = NO;
    
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
    
}

- (IBAction)setPowerButtonDown:(id)sender {
     [self playerButtonHidden];
    
    [stadium selectBatter:PLAYER_POWER];
}

- (IBAction)setBalanceButtonDown:(id)sender {
    [self playerButtonHidden];
    
    [stadium selectBatter:PLAYER_BALANCE];
}

- (IBAction)setAverageButtonDown:(id)sender {
    [self playerButtonHidden];
    
    [stadium selectBatter:PLAYER_AVERAGE];
}

- (IBAction)setPinchHitterButtonDown:(id)sender {
    [self playerButtonHidden];
// TODO: clear
//    didYouUsePinchHitter = YES;
    
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
    [self playerButtonVisible];

    
    self.battingButton.hidden = YES;
    
    if(didYouUsePinchHitter == YES){
        self.pinchHitterButton.hidden = YES;
    }
    
    [stadium playerToHit];
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

 
- (void)batterOut:(NSNotification *) notify
{
    int outCount = [[[notify userInfo] objectForKey:@"OutCount"] intValue];
    
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
                self.outLabel.text = @"";
                self.battingButton.hidden = YES;
                self.balanceButton.hidden = YES;
                self.powerButton.hidden = YES;
                self.averageButton.hidden = YES;
                self.pinchHitterButton.hidden = YES;
                self.changeButton.hidden = NO;
            }else{
//                [self winLoseResults];
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
//        [self whoseScoreIsDisplayed:own];
    }
    
    if(totalOwnScore + ownScore == totalEnemyScore){
        self.resultLabel.text = @"引き分け";
//        [self whoseScoreIsDisplayed:own];
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

    [stadium enemyBatting];
}

-(void) initializeStadium:(NSNotification *)notify
{
    NSString *imageInfo = [[notify userInfo] objectForKey:@"StadiumImage"];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageInfo]];
}

-(void) updateScore:(NSNotification *)notify
{
    NSDictionary *scoreInfo = [notify userInfo];
    int turn = [[scoreInfo objectForKey:@"GameTurn"] intValue];
    inning = [[scoreInfo objectForKey:@"GameInning"] intValue];
    int curScore = [[scoreInfo objectForKey:@"CurrentScore"] intValue];
    ownScore = curScore;
    int totalScore =[[scoreInfo objectForKey:@"TotalScore"] intValue];
    totalOwnScore = totalScore;
    
    NSString *resultText = [scoreInfo objectForKey:@"ResultText"];
    self.resultLabel.text = resultText;
    
    NSLog(@"%d, %d, %d, %d", turn, inning, curScore, totalScore);
    
    
    UILabel *scoreLabel[][2] = {
        {self.sevenTopLabel, self.sevenBottomLabel},
        {self.eightTopLabel, self.eightBottomLabel},
        {self.nineTopLabel, self.nineBottomLabel},
    };
    UILabel *totalScoreLabel[2] = {
        self.totalEnemyLabel, self.totalLabel
    };
    
    scoreLabel[inning - START_INNING][turn].text = [NSString stringWithFormat : @"%d", ownScore];
    totalScoreLabel[turn].text = [NSString stringWithFormat : @"%d", ownScore];
}

-(void) changePlayer:(NSNotification *)notify
{
    NSDictionary *playerInfo = [notify userInfo];
    NSString *playerName =[playerInfo objectForKey:@"PlayerName"];
    NSString *playerImage = [playerInfo objectForKey:@"PlayerImage"];
    self.playerNameLabel.text = playerName;
    self.batterImage.image = [UIImage imageNamed:playerImage];
}

-(void) updateRunners:(NSNotification *) notify
{
    NSDictionary *runnersInfo = [notify userInfo];
    self.firstRunner.hidden = ![[runnersInfo objectForKey:@"FirstBase"] boolValue];
    self.secondRunner.hidden = ![[runnersInfo objectForKey:@"SecondBase"] boolValue];
    self.thirdRunner.hidden = ![[runnersInfo objectForKey:@"ThirdBase"] boolValue];
    self.baseLabel.text = [runnersInfo objectForKey:@"RunnerText"];
}

@end
