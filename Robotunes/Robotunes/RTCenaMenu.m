//
//  RTCenaMenu.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTCenaMenu.h"
#define tempoParaMudar 300;

@implementation RTCenaMenu

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        self.numeroDeMusicas = [RTBancoDeDadosController ultimaMusica];
        self.musicaEscolhida = 1;
        
        //Variaveis para controle da mudança no menu
        self.tempo = -80;
        self.fundoAtual = 1;
    
        //Cria e adiciona o fundo
        [self criarFundos];
        
        //Cria e adiciona o título
        [self criarTitulo];
        
        //Cria o Botão do Facebook
        [self criarFace];
        
        //Cria e adiciona o chão
        [self criarChao];
        
        //Cria e adiciona o robo de venda
        [self criarRobotuneR1];
        
        //Cria e adiciona o robo de play
        [self criarRobotuneB2];
        
        //Cria e adiciona o robo principal - só a imagem
        [self criarRobotuneY3];
    }
    return self;
}

-(void)criarFundos
{
    SKTextureAtlas * fundos = [SKTextureAtlas atlasNamed:@"Fundos"];
    
    self.fundo = [[SKSpriteNode alloc]initWithImageNamed:@"RT_fundo1"];
    self.fundo.anchorPoint = CGPointZero;
    self.fundo.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.fundo.zPosition = -17;
    
    self.fundo2 = [[SKSpriteNode alloc]initWithImageNamed:@"RT_fundo2"];
    self.fundo2.anchorPoint = CGPointZero;
    self.fundo2.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.fundo2.zPosition = -17;
    
    self.fundo2.alpha = 0;

    [self.fundo runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:[RTUteis lerFrames:fundos] timePerFrame:7.5 resize:NO restore:YES]]];
    
    
    SKAction *acaoFadeOut = [SKAction fadeOutWithDuration:8.5];
    SKAction *acaoFadeIn = [SKAction fadeInWithDuration:1];
    
    
    [self.fundo runAction:[SKAction repeatActionForever:[SKAction sequence:@[acaoFadeOut,acaoFadeIn]]]];
    
    
    
    
    [self addChild:self.fundo];
    [self addChild:self.fundo2];
   
}

-(void)criarTitulo
{
    self.titulo = [[SKSpriteNode alloc]initWithImageNamed:@"logo"];
    self.titulo.anchorPoint = CGPointZero;
    self.titulo.size = self.frame.size;
    self.titulo.zPosition = -10;
    [self addChild:self.titulo];
}

-(void)criarFace
{
    self.btnFace = [[SKSpriteNode alloc]initWithImageNamed:@"btnFace"];
    self.btnFace.anchorPoint = CGPointZero;
    self.btnFace.size = CGSizeMake(self.frame.size.width * 0.1, self.frame.size.width * 0.1);
    self.btnFace.position = CGPointMake(self.frame.size.width * 0.85, self.frame.size.height * 0.85);
    self.btnFace.zPosition = -9;
    [self addChild:self.btnFace];
}

-(void)criarChao
{
    self.chao = [[SKSpriteNode alloc]initWithImageNamed:@"chao"];
    self.chao.anchorPoint = CGPointZero;
    self.chao.size = CGSizeMake(self.frame.size.width, self.frame.size.height * 0.035);
    self.chao.position = CGPointZero;
    [self addChild:self.chao];
}

-(void)criarRobotuneR1
{
    self.robotuneR1Corpo = [[SKSpriteNode alloc]initWithImageNamed:@"R1_corpo"];
    self.robotuneR1Corpo.anchorPoint = CGPointZero;
    self.robotuneR1Corpo.size = CGSizeMake(self.frame.size.width * 0.24, self.frame.size.height * 0.42);
    self.robotuneR1Corpo.position = CGPointMake(self.frame.size.width * 0.7, 5);
    [self addChild:self.robotuneR1Corpo];
    
    self.robotuneR1Cabeca = [[SKSpriteNode alloc]initWithImageNamed:@"R1_cabeca"];
    self.robotuneR1Cabeca.anchorPoint = CGPointZero;
    self.robotuneR1Cabeca.size = CGSizeMake(self.frame.size.width * 0.32, self.frame.size.height * 0.32);
    self.robotuneR1Cabeca.position = CGPointMake(self.frame.size.width * 0.66, self.frame.size.height * 0.33);
    [self addChild:self.robotuneR1Cabeca];
}

-(void)criarRobotuneB2
{
    self.robotuneB2 = [[SKSpriteNode alloc]initWithImageNamed:@"RobotuneB2"];
    self.robotuneB2.anchorPoint = CGPointZero;
    self.robotuneB2.size = CGSizeMake(self.frame.size.width * 0.372, self.frame.size.height*0.767);
    self.robotuneB2.position = CGPointMake(self.frame.size.width * 0.299, 5);
    [self addChild:self.robotuneB2];
}

-(void)criarRobotuneY3
{
    self.robotuneY3 = [[SKSpriteNode alloc]initWithImageNamed:@"RobotuneY3"];
    self.robotuneY3.anchorPoint = CGPointZero;
    self.robotuneY3.size = CGSizeMake(self.frame.size.width * 0.176, self.frame.size.height * 0.25);
    self.robotuneY3.position = CGPointMake(self.frame.size.width * 0.056, 5);
    [self addChild:self.robotuneY3];
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    RTCenaJogo *jogo = [[RTCenaJogo alloc]initWithSize:self.size andMusica:2];
    [self.view presentScene:jogo];
}

-(void)update:(NSTimeInterval)currentTime
{
    //COISAS PARA A NUVEM
    //Tempo desde ultimo update
    CFTimeInterval ultimoUpdate = currentTime - self.intervaloNuvens;
    

    //A cada meio segundo tenta criar uma nuvem
    if (ultimoUpdate > 0.4) {
        if ([RTUteis sortearChanceSim:15]) {
            //Cria a nuvem
            RTNuvem *nuvem=[[RTNuvem alloc]initNuvem:CGRectGetMidY(self.frame) :CGRectGetMaxY(self.frame)+50];
            
            //add na arvore de nodes
            [self addChild:nuvem];
        }
        
        //Atualiza o contador
        self.intervaloNuvens =currentTime;
    }

    
  

}

@end
