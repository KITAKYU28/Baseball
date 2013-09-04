//
//  player.m
//  yakyuu
//
//  Created by 篠原 辰徳 on 2013/09/04.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "Player.h"

#define howManyTypesOfPlayer 5
#define howManyKindsOfBattingResult 5


static int battingRates[howManyTypesOfPlayer][howManyKindsOfBattingResult] = {
    {0, 0, 0, 0, 0,},
    {0, 20, 21, 50, 65},
    {0, 10, 20, 40, 70},
    {0, 5, 15, 35, 75},
    {0, 75, 79, 91, 95},
};

@implementation Player

- (void)batting{
    /*
    whatIsBattingResult = arc4random() % randamNumber;
    [self playerButtonVisible];
    
    
    
    switch(whatIsPlayerStyle){
        case power:
            if(whatIsBattingResult < 20){
                [self battingResultIs:homerun];
            }
            
            else if(whatIsBattingResult < 21){
                [self battingResultIs:threeBaseHit];
            }
            
            else if(whatIsBattingResult < 50) {
                [self battingResultIs:twoBaseHit];
            }
            
            else if(whatIsBattingResult < 65) {
                [self battingResultIs:singleHit];
            }
            
            else if (whatIsBattingResult >= 65) {
                [self batterOut];
            }
            break;
            
        case balance:
            if(whatIsBattingResult < 10) {
                [self battingResultIs:homerun];
            }
            
            else if(whatIsBattingResult < 20) {
                [self battingResultIs:threeBaseHit];
            }
            
            else if(whatIsBattingResult < 40) {
                [self battingResultIs:twoBaseHit];
            }
            
            else if(whatIsBattingResult < 70) {
                [self battingResultIs:singleHit];
            }
            
            else if(whatIsBattingResult >= 70) {
                [self batterOut];
            }
            break;
            
        case average:
            if(whatIsBattingResult < 5) {
                [self battingResultIs:homerun];
            }
            
            else if(whatIsBattingResult < 15) {
                [self battingResultIs:threeBaseHit];
            }
            
            else if(whatIsBattingResult < 35) {
                [self battingResultIs:twoBaseHit];
            }
            
            else if(whatIsBattingResult < 75) {
                [self battingResultIs:singleHit];
            }
            
            else if(whatIsBattingResult >= 75) {
                [self batterOut];
            }
            break;
            
        case pinchHitter:
            if(whatIsBattingResult < 75) {
                [self battingResultIs:homerun];
            }
            
            else if(whatIsBattingResult < 79) {
                [self battingResultIs:threeBaseHit];
            }
            
            else if(whatIsBattingResult < 91) {
                [self battingResultIs:twoBaseHit];
            }
            
            else if(whatIsBattingResult < 95) {
                [self battingResultIs:singleHit];
            }
            
            else if(whatIsBattingResult >= 95) {
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


*/
}


@end
