//
//  ViewController.h
//  yakyuu
//
//  Created by 篠原　辰徳 on 13/01/09.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Stadium.h"

@interface ViewController : UIViewController{
    NSMutableArray *stadiumBackgroundArray;
    NSMutableArray *powerPlayerArray;
    NSMutableArray *balancePlayerArray;
    NSMutableArray *averagePlayerArray;
    NSMutableArray *pinchHitterPlayerArray;
    UIImage *stadiumImage;
    NSString *whichIsPowerPlayerImage;
    NSString *whichIsBalancePlayerImage;
    NSString *whichIsAveragePlayerImage;
    NSString *whichIsPinchHitterPlayerImage;
    
    Stadium *stadium;
}

typedef struct doesRunnerExistsStruct {
    unsigned first:1;  //1ビットって意味
    unsigned second:1;
    unsigned third:1;
} baseStruct;

@property baseStruct doesRunnerExists;


@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *baseLabel;
@property (weak, nonatomic) IBOutlet UILabel *outLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sevenTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *sevenBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *eightTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *eightBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *nineTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *nineBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalEnemyLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;


@property (weak, nonatomic) IBOutlet UIImageView *baseImage;
@property (weak, nonatomic) IBOutlet UIImageView *batterImage;
@property (weak, nonatomic) IBOutlet UIImageView *pitcherImage;
@property (weak, nonatomic) IBOutlet UIImageView *firstRunner;
@property (weak, nonatomic) IBOutlet UIImageView *secondRunner;
@property (weak, nonatomic) IBOutlet UIImageView *thirdRunner;


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


- (void)playerButtonVisible;
- (void)batterOut;
- (void)battingResultIs:(int)whatIsResult;
- (void)initialize;
- (void)whoseScoreIsDisplayed:(int)whichIsScore;
- (void)winLoseResults;
- (void)didYouWin:(int)howToWin;
- (void)setStadiumBackground;
- (void)runnerImageDisplay;
- (void)descriptionOfBaseSituation;
- (void)playerButtonHidden;
//- (void)battingResultOfPower;


-(void) initializeStadium:(NSNotification *) notify;
-(void) updateScore:(NSNotification *) notify;
-(void) changePlayer:(NSNotification *) notify;

@end
