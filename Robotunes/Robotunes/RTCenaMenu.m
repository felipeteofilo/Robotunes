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
        
        
        self.numeroDeMusicas = [RTBancoDeDadosController ultimaMusica];
        self.musicaEscolhida = 1;
        
        //Adiciona o fundo
        SKSpriteNode *imagemFundo = [[SKSpriteNode alloc]initWithImageNamed:@"fundoMenu"];
        imagemFundo.anchorPoint = CGPointZero;
        imagemFundo.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
        imagemFundo.zPosition = -20;
        
        //adiciona titulo
        SKSpriteNode *titulo = [[SKSpriteNode alloc]initWithImageNamed:@"logorobotunes"];
        titulo.anchorPoint = CGPointZero;
        titulo.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
        titulo.zPosition = -10;
        
        [self addChild:titulo];
        [self addChild:imagemFundo];
        
        //Cria e adiciona o robo de venda
        [self criarRobotuneR1];
        
        //Cria e adiciona o robo de play
        [self criarRobotuneB2];
        
        //Cria e adiciona o robo principal - só a imagem
        [self criarRobotuneY3];
        
    }
    return self;
}

-(void)criarRobotuneR1
{
    self.robotuneR1 = [[SKSpriteNode alloc]initWithImageNamed:@"RobotuneR1"];
    self.robotuneR1.anchorPoint = CGPointZero;
    self.robotuneR1.size = CGSizeMake(self.frame.size.width * 0.24, self.frame.size.height * 0.45);
    self.robotuneR1.position = CGPointMake(self.frame.size.width * 0.7, 5);
    [self addChild:self.robotuneR1];
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
    if (self.musicaEscolhida >= self.numeroDeMusicas) {
        self.musicaEscolhida = 0;
        
    }
    self.musicaEscolhida++;
    
    NSArray *notas = [NSArray arrayWithObjects:@"do",@"0.0",@"re",@"1.0", nil];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    
    
    
    [dictionary setValue:@"Musica" forKey:@"nome"];
    [dictionary setValue:[NSNumber numberWithFloat:10.5] forKey:@"tempoTotal"];
    [dictionary setValue:notas forKey:@"notas"];
    
    
    //Musica *musica = [RTBancoDeDadosController procurarMusica:1];
    
    RTCenaJogo *jogo = [[RTCenaJogo alloc]initWithSize:self.size andMusica:1];
    [self.view presentScene:jogo];
}

@end
