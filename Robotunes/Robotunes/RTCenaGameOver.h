//
//  RTGameOver.h
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 23/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RTCenaMenu.h"

@interface RTCenaGameOver : SKScene

-(id)initWithSize:(CGSize)size eGanhou:(BOOL)ganhou eBackgournd:(SKSpriteNode*)background;
@end
