//
//  GameState.h
//  xBook2
//
//  Created by awoth on 2015-10-09.
//  Copyright (c) 2015 Apportable. All rights reserved.
//
// 
#import <Foundation/Foundation.h>

@interface GameState : NSObject

@property (nonatomic, readonly) NSString *currentLevel;
@property (nonatomic, readonly) int currentLevelIndex;
@property (nonatomic) int currentLevelAttempts;

+ (instancetype)sharedInstance;
- (NSDictionary *)nextLevelInfo;
- (NSDictionary *)currentLevelInfo;
- (BOOL)isNextLevelPremium;
- (void)loadNextLevel;
- (void)loadLevel:(NSInteger)levelIndex;
- (NSUInteger)levelCount;

@end
