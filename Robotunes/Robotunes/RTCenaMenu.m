//
//  RTCenaMenu.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTCenaMenu.h"

@implementation RTCenaMenu

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        
       
        
        SKSpriteNode * fundo = [SKSpriteNode spriteNodeWithImageNamed:@"fundo"];
        [fundo setSize:self.frame.size];
        [fundo setAnchorPoint:CGPointZero];
        [fundo setZPosition:-10];
        
        
        
        SKSpriteNode * roboY3 = [SKSpriteNode spriteNodeWithImageNamed:@"RobotuneY3"];
        [roboY3 setAnchorPoint:CGPointZero];
        [roboY3 setSize:CGSizeMake(self.frame.size.width*0.176, self.frame.size.height*0.25)];
        
        [roboY3 setPosition:CGPointMake(self.frame.size.width*0.056, 5)];
        
        SKSpriteNode * roboB2 = [SKSpriteNode spriteNodeWithImageNamed:@"RobotuneB2"];
        [roboB2 setAnchorPoint:CGPointZero];
        [roboB2 setSize:CGSizeMake(self.frame.size.width*0.372, self.frame.size.height*0.767)];
        
        [roboB2 setPosition:CGPointMake(self.frame.size.width*0.299, 5)];
        
        SKSpriteNode * roboR1 = [SKSpriteNode spriteNodeWithImageNamed:@"RobotuneR1"];
        [roboR1 setAnchorPoint:CGPointZero];
        [roboR1 setSize:CGSizeMake(self.frame.size.width*0.261, self.frame.size.height*0.45)];
        
        [roboR1 setPosition:CGPointMake(self.frame.size.width*0.70, 5)];
        
        
        
        
        [self addChild:fundo];
        [self addChild:roboY3];
        [self addChild:roboB2];
        [self addChild:roboR1];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    RTCenaJogo *jogo = [[RTCenaJogo alloc]initWithSize:self.size];
    [self.view presentScene:jogo];
}


@end
