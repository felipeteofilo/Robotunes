//
//  RTCenaJogo.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTCenaJogo.h"
#import "RTBancoDeDadosController.h"

@implementation RTCenaJogo

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        //Acrescenta um fundo branco
        self.backgroundColor = [UIColor whiteColor];
        
        //Define a gravidade da Cena
        self.physicsWorld.gravity = CGVectorMake(0, -3);
        
        //Determina que o delegate para colisão é a própria cena
        self.physicsWorld.contactDelegate = self;
        
        //Cria a imagem de fundo
        [self criarImagemFundo];
        
        //Cria o chão
        [self criarChao];
        
        //Cria o jogador
        Musica *musica=[RTBancoDeDadosController procurarMusica:1];
        Musica *musica2=[RTBancoDeDadosController procurarMusica:2];
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
    chao.zPosition = -1;
    
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

-(void)criarJogador
{
    self.jogador = [[RTJogador alloc]init];
    self.jogador.spriteNode.size = CGSizeMake(self.frame.size.width * 0.2, self.frame.size.width * 0.2);
    self.jogador.spriteNode.position = CGPointMake(self.frame.size.width * 0.5 - self.jogador.spriteNode.size.width / 2, self.frame.size.height * 0.015);
    [self addChild:self.jogador];
}

@end
