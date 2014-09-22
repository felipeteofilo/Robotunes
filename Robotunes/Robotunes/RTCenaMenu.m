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
    
        //Cria e adiciona o fundo
        [self criarFundos];
        
        //Cria e adiciona o título
        [self criarTitulo];
        
        //Cria o Botão do Facebook
        [self criarFace];
        
        //Cria e adiciona o chão
        [self criarChao];
        
        //Criar nuvens
        [self criarNuvens];
        
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
    //Fundo 1
    self.fundo1 = [[SKSpriteNode alloc]initWithImageNamed:@"RT_fundo1"];
    self.fundo1.anchorPoint = CGPointZero;
    self.fundo1.size = self.frame.size;
    self.fundo1.zPosition = -20;
    self.fundo1.position = CGPointZero;
    [self addChild:self.fundo1];
    
    //Fundo 2
    self.fundo2 = [[SKSpriteNode alloc]initWithImageNamed:@"RT_fundo2"];
    self.fundo2.anchorPoint = CGPointZero;
    self.fundo2.size = self.frame.size;
    self.fundo2.zPosition = -20;
    self.fundo2.position = CGPointZero;
    [self addChild:self.fundo2];
    
    //Fundo 3
    self.fundo3 = [[SKSpriteNode alloc]initWithImageNamed:@"RT_fundo3"];
    self.fundo3.anchorPoint = CGPointZero;
    self.fundo3.size = self.frame.size;
    self.fundo3.zPosition = -20;
    self.fundo3.position = CGPointZero;
    [self addChild:self.fundo3];
    
    //Fundo 4
    self.fundo4 = [[SKSpriteNode alloc]initWithImageNamed:@"RT_fundo2"];
    self.fundo4.anchorPoint = CGPointZero;
    self.fundo4.size = self.frame.size;
    self.fundo4.zPosition = -20;
    self.fundo4.position = CGPointZero;
    [self addChild:self.fundo4];
    
    //Alphas de cada um - Começa com o fundo 1, portanto...
    self.fundo1.alpha = 1;
    self.fundo2.alpha = 0;
    self.fundo3.alpha = 0;
    self.fundo4.alpha = 0;
}

-(void)criarTitulo
{
    self.titulo = [[SKSpriteNode alloc]initWithImageNamed:@"logorobotunes"];
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
    self.chao = [[SKSpriteNode alloc]initWithImageNamed:@"Chao"];
    self.chao.anchorPoint = CGPointZero;
    self.chao.size = CGSizeMake(self.frame.size.width, self.frame.size.height * 0.01);
    self.chao.position = CGPointZero;
    [self addChild:self.chao];
}

-(void)criarNuvens
{
    //Nuvem 1
    self.nuvem1 = [[SKSpriteNode alloc]initWithImageNamed:@"RT_nuvenzinhas"];
    self.nuvem1.anchorPoint = CGPointZero;
    self.nuvem1.size = CGSizeMake(self.frame.size.width, self.frame.size.height * 0.5);
    self.nuvem1.zPosition = -15;
    self.nuvem1.position = CGPointMake(self.frame.size.width * 0.0, self.frame.size.height * 0.4);
    [self addChild:self.nuvem1];
    
    //Nuvem 2
    self.nuvem2 = [[SKSpriteNode alloc]initWithImageNamed:@"RT_nuvenzinhas"];
    self.nuvem2.anchorPoint = CGPointZero;
    self.nuvem2.size = CGSizeMake(self.frame.size.width, self.frame.size.height * 0.5);
    self.nuvem2.zPosition = -15;
    self.nuvem2.position = CGPointMake(self.frame.size.width * 0.0, self.frame.size.height * 0.4);
    [self addChild:self.nuvem2];
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
