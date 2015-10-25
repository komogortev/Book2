//
//  Scene01.m
//  xBook2
//
//  Created by awoth on 2015-10-01.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Scene01.h"
#import "Gameplay.h"

@implementation Scene01 {
    CCSprite *_part01;CCNode *_base01;
    CCSprite *_part02;CCNode *_base02;
    CCSprite *_part03;CCNode *_base03;
    CCSprite *_part04;CCNode *_base04;
    CCSprite *_part05;CCNode *_base05;
    CCNode *_currentFigure;
    
    BOOL _touchingPart01;BOOL *_part01Avail;
    BOOL _touchingPart02;BOOL *_part02Avail;
    BOOL _touchingPart03;BOOL *_part03Avail;
    BOOL _touchingPart04;BOOL *_part04Avail;
    BOOL _touchingPart05;BOOL *_part05Avail;
    CGPoint _touchPoint;
}


// is called when CCB file has completed loading
-(void) didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    //set all pieces as accessible and group'em on the same z-lvl
    _part01Avail = true;[_part01 setZOrder:1];
    _part02Avail = true;[_part02 setZOrder:1];
    _part03Avail = true;[_part03 setZOrder:1];
    _part04Avail = true;[_part04 setZOrder:1];
    _part05Avail = true;[_part05 setZOrder:1];
}


//----------------------------------------------------------------
-(void) touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    // when touches end, meaning the user releases their finger, release the catapult
    [self releaseFigure];
    //drop piece back to z-level with other pieces
    [_currentFigure setZOrder:1];
}
-(void) touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
    // when touches are cancelled, meaning the user drags their finger off the screen or onto something else, release the figure
    [self releaseFigure];
    //drop piece back to z-level with other pieces
    [_currentFigure setZOrder:1];
}

- (void)positionFigure {
    //move piece to lowest level
    [_currentFigure setZOrder:0];
    //set piece to position and cancell flags assigned
    if (_touchingPart01){
        _currentFigure.position = _base01.position;
        _part01Avail = false;_touchingPart01 = false;
    }
    else if (_touchingPart02){
        _currentFigure.position = _base02.position;
        _part02Avail = false;_touchingPart02 = false;
    }
    else if (_touchingPart03){
        _currentFigure.position = _base03.position;
        _part03Avail = false;_touchingPart03 = false;
    }
    else if (_touchingPart04){
        _currentFigure.position = _base04.position;
        _part04Avail = false;_touchingPart04 = false;
    }
    else if (_touchingPart05){
        _currentFigure.position = _base05.position;
        _part05Avail = false;_touchingPart05 = false;
    }
    //call func to releace piece
    [self releaseFigure];
}

- (void)releaseFigure {
    _currentFigure = nil;
}

// BUTTONS ---------------------------------


@end
