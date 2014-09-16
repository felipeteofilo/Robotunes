//
//  RTJogador.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTJogador.h"

@implementation RTJogador

-(id)init{
    if(self = [super init]){
        //Inicia o jogador e seu sprite node
        [self iniciarSpriteNode];
        
        //Iniciar os pontos e vidas do jogador
        [self iniciarPontosVida];
    }
    return self;
}

-(void)iniciarSpriteNode
{
    self.spriteNode = [[SKSpriteNode alloc] initWithImageNamed:@"RobotuneY3"];
    self.spriteNode.anchorPoint = CGPointZero;
}

-(void)iniciarPontosVida
{
    self.pontos = 0;
    self.vida = 100; //TODO - vida vai ser essa mesmo?
}

@end
