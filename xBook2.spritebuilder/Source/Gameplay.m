//
//  Gameplay.m
//  JAZZPAZZ
//
//  Created by awoth on 2014-04-10.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"
#import "GameState.h"

@implementation Gameplay {
    CCNode *_sceneNode;
    

}


#pragma mark -
#pragma mark Scene Setup and Initialize

// is called when CCB file has completed loading
-(void) didLoadFromCCB {
    //tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
   
    //find level, assign as scene and load to node
    NSString *levelName = [[GameState sharedInstance] currentLevel];
    CCScene *level = [CCBReader loadAsScene:levelName];
    [_sceneNode addChild:level];

}
- (void)backButtonPressed {
    CCScene *scene = [CCBReader loadAsScene:@"MainScene"];
    CCTransition *transition = [CCTransition transitionCrossFadeWithDuration:0.3f];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:transition];
}

#pragma mark -
#pragma mark Scene Mechanics

//--------------------------------------

// called on every touch in this scene
//- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
//}

//--------------------------------------


-(void)_mainMenuBtn {
    [self performSelector:@selector(backButtonPressed) withObject:nil afterDelay:0.1f];
    
}

-(void)_nextSceneBtn {
    // reload this level
    CCScene *level = [CCBReader loadAsScene:@"Scenes/Scene02"];
    [_sceneNode removeAllChildrenWithCleanup:YES];
    [_sceneNode addChild:level];
}

-(void)_prevSceneBtn {
    CCScene *level = [CCBReader loadAsScene:@"Scene03"];
    [_sceneNode removeAllChildrenWithCleanup:YES];
    [_sceneNode addChild:level];
}
@end
