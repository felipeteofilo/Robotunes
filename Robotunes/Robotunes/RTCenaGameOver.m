//
//  RTGameOver.m
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 23/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTCenaGameOver.h"

@implementation RTCenaGameOver
-(id)initWithSize:(CGSize)size eGanhou:(BOOL)ganhou eBackgournd:(SKSpriteNode*)background{
    if (self=[super initWithSize:size]) {
        
        [self addChild:background];
        [self configuraTela:ganhou];
    }
    return self;
}

-(void)configuraTela:(BOOL)ganhou{
    
    //Cria o node do background
    SKSpriteNode *mensagem;
    SKSpriteNode *botao;
    
    if (ganhou) {
        mensagem=[SKSpriteNode spriteNodeWithImageNamed:@"RTGameOver_win"];
        botao=[SKSpriteNode spriteNodeWithImageNamed:@"botao_win"];
    }else{
        mensagem=[SKSpriteNode spriteNodeWithImageNamed:@"RTGameOver_lose"];
        botao=[SKSpriteNode spriteNodeWithImageNamed:@"botao_lose"];
    }
    
    [mensagem setAnchorPoint:CGPointMake(0.5, 0)];
    [mensagem setScale:0.31];
    [mensagem setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame)*0.004f)];
    [self addChild:mensagem];
    
    //Configura o botao
    [botao setScale:0.3];
    [botao setAnchorPoint:CGPointMake(0.5, 0)];
    [botao setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame)*0.015f)];
    [botao setName:@"botao"];
    [self addChild:botao];
}

-(void)configuraBotao{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    SKNode *nodeTocado=[self nodeAtPoint:[[touches anyObject]locationInNode:self]];
    
    if ([nodeTocado.name isEqualToString:@"botao"]) {
        [self voltarMenuInical];
    }
}

-(void)voltarMenuInical{
    RTCenaMenu *menuInicial=[RTCenaMenu sceneWithSize:self.size];
    
    [self.view presentScene:menuInicial];
}
@end
