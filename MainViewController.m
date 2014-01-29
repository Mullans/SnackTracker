//
//  MainViewController.m
//  SnackTracker
//
//  Created by Sean on 1/28/14.
//  Copyright (c) 2014 SilentLupin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Creates the snack button
	snackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [snackButton setFrame:CGRectMake(80, 300, self.view.bounds.size.width-160, 80)];
    NSLog(@"%f",self.view.bounds.size.width);
    [snackButton setTitle:@"Snack" forState:UIControlStateNormal];
    [snackButton setBackgroundColor:[UIColor redColor]];
    [snackButton addTarget:self action:@selector(snack) forControlEvents:UIControlEventTouchUpInside];
    snackButton.layer.cornerRadius = 20;
    snackButton.clipsToBounds = YES;
    [self.view addSubview:snackButton];
    
    [dataStore loadTestData];
    currentExp = [dataStore getExp];
    currentLevel = [dataStore getLevel];
    nextLevel = 100; //make a table or something with values for this
    expBar = [[ExpBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width-20, 20)];
    [self.view addSubview:expBar];
    CGRect rect = [expBar frame];
    //these set the location of the bar
    rect.origin.x = 5;
    rect.origin.y = self.view.bounds.size.height/2;
    [expBar setFrame:rect];
    [self.view addSubview:expBar];
    [expBar setProgress:(currentExp/nextLevel)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)snack{
    [self addExp:-10.0f];
}

-(void)addExp:(float)newExp{
    float updater = (newExp+currentExp)/nextLevel;
    if(updater>=1.0f){
        NSLog(@"here");
        currentExp = currentExp-nextLevel;
        nextLevel = nextLevel + 100; //still need a table
        currentLevel++;
        updater = currentExp/nextLevel;
    }else{
        NSLog(@"\nHere\n");
        currentExp += newExp;
        NSLog(@"%f",currentExp);
    }
    [expBar setProgress:updater];
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}
- (IBAction)tester:(id)sender {
    [self addExp:10.0f];
}
@end
