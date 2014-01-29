//
//  MainViewController.h
//  SnackTracker
//
//  Created by Sean on 1/28/14.
//  Copyright (c) 2014 SilentLupin. All rights reserved.
//

#import "FlipsideViewController.h"
#import "ExpBar.h"
#import "DataStore.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>{
    float currentExp;
    int currentLevel;
    NSMutableArray* gymList;
    DataStore *dataStore;
    ExpBar *expBar;
    float nextLevel;
    UIButton *snackButton;
}
- (IBAction)tester:(id)sender;

@end
