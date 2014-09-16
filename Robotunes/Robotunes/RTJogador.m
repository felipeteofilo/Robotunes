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
        
        //Iniciar as animacoes
        [self iniciarAnimacoes];
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

//TODO
-(void)iniciarAnimacoes
{
    
}

-(BOOL)morreu
{
    //Se estiver sem mais nenhuma vida, retorna YES
    if(self.vida <= 0){
        return YES;
    }
    
    //Senão, retorna NO
    return NO;
}

-(void)atualizarPontos:(int)valor
{
    //Só acrescenta se os pontos forem positivos
    if(valor > 0){
        self.pontos = self.pontos + valor;
    }
}

-(void)atualizarVida:(int)valor
{
    self.vida = self.vida + valor;
}

-(void)movimentar: (NSString*)direcao
{
    //Se estiver indo para o lado direito...
    if([direcao isEqualToString:@"Direita"]){
        //Faz a animação
        [self.spriteNode runAction:self.acaoAndarDireita];
        
        //Movimenta o personagem
        [self.spriteNode runAction:self.acaoDancarDireita];
    }
    
    //Se estiver indo para o lado esquerdo...
    else if([direcao isEqualToString:@"Esquerda"]){
        //Faz a animação
        [self.spriteNode runAction:self.acaoAndarEsquerda];
        
        //Movimenta o personagem
        [self.spriteNode runAction:self.acaoDancarEsquerda];
    }
}

-(void)perder
{
    [self.spriteNode runAction:self.acaoPerder];
}

-(void)ganhar
{
    [self.spriteNode runAction:self.acaoGanhar];
}

-(void)dancarBem
{
    int aleatorio = arc4random() % 3;
    switch (aleatorio) {
        case 0:
            [self.spriteNode runAction:self.acaoDancarBem1];
            break;
            
        case 1:
            [self.spriteNode runAction:self.acaoDancarBem2];
            break;
            
        case 2:
            [self.spriteNode runAction:self.acaoDancarBem3];
            break;
    }
}

-(void)dancarMal
{
    int aleatorio = arc4random() % 2;
    switch (aleatorio) {
        case 0:
            [self.spriteNode runAction:self.acaoDancarMal1];
            break;
            
        case 1:
            [self.spriteNode runAction:self.acaoDancarMal2];
            break;
    }
}

@end
