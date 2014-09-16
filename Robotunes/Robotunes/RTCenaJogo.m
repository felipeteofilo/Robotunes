//
//  RTCenaJogo.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTCenaJogo.h"

@implementation RTCenaJogo

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        NSLog(@"Você está no Jogo");
        self.backgroundColor = [UIColor whiteColor];
        
        //Cria a imagem de fundo
        [self criarImagemFundo];
        
        //Cria o chão
        [self criarChao];
        
    }
    return self;
}

-(void)criarImagemFundo
{
    //Cria a imagem de fundo e define atributos
    SKSpriteNode *imagemFundo = [[SKSpriteNode alloc]initWithImageNamed:@"Fundo"];
    imagemFundo.anchorPoint = CGPointZero;
    imagemFundo.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    imagemFundo.zPosition = -10;
    imagemFundo.alpha = 0.5f;
    
    //Adiciona a imagem de fundo
    [self addChild:imagemFundo];
}

-(void)criarChao
{
    //Cria o chão e define atributos
    SKSpriteNode *chao = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(self.size.width, self.size.height * 0.01)];
    chao.anchorPoint = CGPointZero;
    chao.position = CGPointMake(0, 0);
    
    //Cria o corpo físico do chão
    chao.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:chao.size];
    chao.physicsBody.affectedByGravity = YES;
    chao.physicsBody.collisionBitMask = ChaoCategoria;
    chao.physicsBody.contactTestBitMask = NotaCategoria;
    chao.physicsBody.usesPreciseCollisionDetection = YES;
    chao.physicsBody.dynamic = NO;

    //Adiciona o chão
    [self addChild:chao];
}

@end
