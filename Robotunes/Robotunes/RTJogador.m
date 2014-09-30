//
//  RTJogador.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTJogador.h"

@implementation RTJogador


-(id)initWithSize :(CGSize)size
{
    if(self = [super initWithImageNamed:@"RobotuneY3"]){
        self.anchorPoint = CGPointZero;
        
        self.size = size;
        
        //Cria corpo fisico
        [self setPhysicsBody:[SKPhysicsBody bodyWithPolygonFromPath:[self pathForRectangleOfSize:self.size withAnchorPoint:self.anchorPoint]]];
        self.physicsBody.restitution = 0;
        
        //Iniciar os pontos e vidas do jogador
        [self iniciarPontosVida];
        
        //Iniciar as animaçõess
        [self iniciarAnimacoes];
        
    }
    return self;
}

-(void)iniciarPontosVida
{
    self.pontos = 0;
    self.vida = 8;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificacaoMudancaSangue" object:nil userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:self.vida] forKey:@"vida"]];
}

//TODO
-(void)iniciarAnimacoes
{
    
}

- (CGPathRef)pathForRectangleOfSize:(CGSize)size withAnchorPoint:(CGPoint)anchor {
    CGPathRef path = CGPathCreateWithRect( CGRectMake(-size.width * anchor.x, -size.height * anchor.y,
                                                      size.width,   size.height), nil);
    return path;
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
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificacaoMudancaPontos" object:nil userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:self.pontos] forKey:@"pontos"]];
}

-(void)atualizarVida:(int)valor
{
    if (self.vida +valor >=16) {
        self.vida=16;
    }else{
        self.vida = self.vida + valor;
    }
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificacaoMudancaSangue" object:nil userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:self.vida] forKey:@"vida"]];
}


-(void)movimentarPara: (NSString*)direcao naPosicao:(NSNumber*)posicao;
{
    //Se estiver indo para o lado direito...
    if([direcao isEqualToString:@"Direita"]){
        //Faz a animação
        [self runAction:self.acaoDancarDireita];
        
        //Movimenta o personagem
        [self runAction:[SKAction moveToX:[posicao floatValue]+(self.size.width/3) duration:0.2]];
    }
    
    //Se estiver indo para o lado esquerdo...
    else if([direcao isEqualToString:@"Esquerda"]){
        //Faz a animação
        [self runAction:self.acaoDancarEsquerda];
        
        //Movimenta o personagem
        [self runAction:[SKAction moveToX:[posicao floatValue]+(self.size.width/3) duration:0.2]];
    }
}

-(void)perder
{
    [self runAction:self.acaoPerder];
}

-(void)ganhar
{
    [self runAction:self.acaoGanhar];
}

-(void)dancarBem
{
    int aleatorio = arc4random() % 3;
    switch (aleatorio) {
        case 0:
            [self runAction:self.acaoDancarBem1];
            break;
            
        case 1:
            [self runAction:self.acaoDancarBem2];
            break;
            
        case 2:
            [self runAction:self.acaoDancarBem3];
            break;
    }
}

-(void)dancarMal
{
    int aleatorio = arc4random() % 2;
    switch (aleatorio) {
        case 0:
            [self runAction:self.acaoDancarMal1];
            break;
            
        case 1:
            [self runAction:self.acaoDancarMal2];
            break;
    }
}


@end
