//
//  LevelDetails.m
//  xBook2
//
//  Created by awoth on 2015-10-09.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "LevelDetails.h"

@implementation LevelDetails {
    CCLabelTTF *_titleLabel;
}

- (void)setLevel:(NSDictionary*)levelDescription {
    _titleLabel.string = levelDescription[@"levelTitle"];
}

@end
