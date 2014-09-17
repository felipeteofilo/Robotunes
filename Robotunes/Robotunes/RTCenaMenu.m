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
        //TODO
        //[RTDadosParse logout];
        
        self.backgroundColor = [UIColor cyanColor];
        
        [RTDadosParse logarParse];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    RTCenaJogo *jogo = [[RTCenaJogo alloc]initWithSize:self.size];
    [self.view presentScene:jogo];
}


@end
