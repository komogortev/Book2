//
//  GameState.m
//  xBook2
//
//  Created by awoth on 2015-10-09.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "GameState.h"

@implementation GameState {
    NSArray *_levels;
}

+ (instancetype)sharedInstance
{
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
        
    // returns the same object each time
    return _sharedObject;
}

- (id)init {
    self = [super init];
    
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Levels" ofType:@"plist"];
        _levels = [NSArray arrayWithContentsOfFile:path];
        
        _currentLevelIndex = -1;
        
        if (_currentLevelIndex < [_levels count]) {
            [self loadLevel:_currentLevelIndex];
        } else {
            [self loadLevel:0];
        }
    }
    
    return self;
}

- (NSDictionary *)nextLevelInfo {
    NSDictionary *nextLevel = nil;
    
    if (self.currentLevelIndex+1 >= _levels.count) {
        nextLevel = _levels[0];
    } else {
        nextLevel = _levels[self.currentLevelIndex+1];
    }
    
    return nextLevel;
}

- (NSDictionary *)currentLevelInfo {
    return _levels[self.currentLevelIndex];
}

- (void)loadNextLevel {
    NSString *levelString = [NSString stringWithFormat:@"Level_%d_unlocked", _currentLevelIndex+1];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:levelString];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    int nextIndex = self.currentLevelIndex + 1;
    
    if (self.currentLevelIndex+1 >= _levels.count) {
        nextIndex = 0;
    }
    
    [self loadLevel:nextIndex];
}

- (void)loadLevel:(NSInteger)levelIndex {
    NSDictionary *nextLevel = _levels[levelIndex];
    _currentLevel = nextLevel[@"levelName"];
    _currentLevelIndex = levelIndex;
    self.currentLevelAttempts = 0;
}



- (NSUInteger)levelCount {
    return [_levels count];
}

@end
