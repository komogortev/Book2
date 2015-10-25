//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "LevelDetails.h"
#import "GameState.h"

@implementation MainScene{
    NSArray *_nodes;
    int _onScreen;
    int _selectedLevel;
    NSArray *_levels;
    
    CGSize _screenSize;
    
    CCScrollView *_scrollView;
}

- (void)didLoadFromCCB {
    _screenSize = [[CCDirector sharedDirector] viewSize];
    
    //set default Level#
    _selectedLevel = 0;
    
    //create string containing path to levels files
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Levels" ofType:@"plist"];
    _levels = [NSArray arrayWithContentsOfFile:path];
    
    self.userInteractionEnabled = TRUE;
}

- (void)selectedLevel:(NSInteger)levelIndex {
    [[GameState sharedInstance] loadLevel:levelIndex];
    NSDictionary *levelInfo = [[GameState sharedInstance] currentLevelInfo];
    
    [self performSelector:@selector(actualLoadLevel) withObject:nil afterDelay:0.1f];
}

- (void)actualLoadLevel {
    CCScene *scene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:scene];
}



-(void)_scene01Btn {

    CCScene *gameplayScene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}


-(void)_scene02Btn:(id)sender {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

-(void)_scene03Btn {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}


@end
