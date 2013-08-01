//
//  ViewController.h
//  yakyuu
//
//  Created by 篠原　辰徳 on 13/01/09.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSMutableArray *stadiumBackgroundArray;
    NSMutableArray *powerPlayerArray;
    NSMutableArray *balancePlayerArray;
    NSMutableArray *averagePlayerArray;
    NSMutableArray *pinchHitterPlayerArray;
}

typedef struct doesRunnerExistsStruct {
    unsigned first:1;  //1ビットって意味
    unsigned second:1;
    unsigned third:1;
} baseStruct;

@property baseStruct doesRunnerExists;

@property (weak, nonatomic) IBOutlet UILabel *sevenBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *baseLabel;
@property (weak, nonatomic) IBOutlet UILabel *outLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sevenTopLabel;
//@property (weak, nonatomic) IBOutlet UILabel *sevenBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *eightTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *eightBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *nineTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *nineBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalEnemyLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;


@property (weak, nonatomic) IBOutlet UIImageView *baseImage;
@property (weak, nonatomic) IBOutlet UIImageView *batterImage;
@property (weak, nonatomic) IBOutlet UIImageView *pitcherImage;
@property (weak, nonatomic) IBOutlet UIImageView *runnerFirst;
@property (weak, nonatomic) IBOutlet UIImageView *runnerSecond;
@property (weak, nonatomic) IBOutlet UIImageView *runnerThird;


@property (weak, nonatomic) IBOutlet UIButton *pinchHitterButton;
@property (weak, nonatomic) IBOutlet UIButton *powerButton;
@property (weak, nonatomic) IBOutlet UIButton *balanceButton;
@property (weak, nonatomic) IBOutlet UIButton *averageButton;
@property (weak, nonatomic) IBOutlet UIButton *battingButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *changeButton;


- (IBAction)setPinchHitterButtonDown:(id)sender;
- (IBAction)setPowerButtonDown:(id)sender;
- (IBAction)setBalanceButtonDown:(id)sender;
- (IBAction)setAverageButtonDown:(id)sender;
- (IBAction)battingButtonDown:(id)sender;
- (IBAction)resetButtonDown:(id)sender;
- (IBAction)changeButtonDown:(id)sender;


- (void)Button:(int)number;
- (void)buttonPowerAverageBalanceHiddenNo;
- (void)singleHit;
- (void)twoBaseHit;
- (void)threeBaseHit;
- (void)homerun;
- (void)batterOut;
- (void)runner:(int)number;
- (void)initialize;
- (void)scoreDisplay:(int)number;
- (void)winLose;
- (void)win:(int)number;
- (void)setStadiumBackground;
- (void)baseImageMethod;
- (void)baseRunnerText;
- (void)playerButtonDownHidden;


@end
