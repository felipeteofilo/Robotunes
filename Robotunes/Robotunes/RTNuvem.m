//
//  RTNuvem.m
//  Robotunes
//
//  Created by Leonardo de Sousa Mendes on 22/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTNuvem.h"

@implementation RTNuvem

-(id)initNuvem:(float)alturaMinima :(float)alturaMaxima frameTela:(CGRect)frame{
    if ([self init]) {
        
        //Sorteia a imagem que será da nuvem
        [self defineImagem];
        
        
        [self setScale:CGRectGetWidth(frame)*0.0003f];
        
        //sorteia a altura da nuvem
        [self sorteiaAltura:alturaMinima :alturaMaxima];
        
        //Sortei a velocidade da nuvem
        [self setVelocidade:(float)[RTUteis sorteioIntEntre:20 eMaiorNum:40]];
        
        //faz ela mover
        [self movimentar];
    }
    return self;
}

-(void)sorteiaAltura:(float)alturaMinima :(float)alturaMaxima{
    //define posicao Z para ficar a frente do fundo da tela e atras dos robos
    [self setZPosition:-17.0];
    
    [self setPosition:CGPointMake(-500, [RTUteis sorteioIntEntre:(int)alturaMinima eMaiorNum:(int)alturaMaxima])];
}

-(void)defineImagem{
    SKTextureAtlas *pastaAtlas=[SKTextureAtlas atlasNamed:@"Nuvens"];
    
    //Sorteia de acordo com o numero de nuvens desenhadas
    int nImagemSorteado=arc4random()%[[pastaAtlas textureNames]count]+1;
    
    //Define a imagem da nuvem
    [self setTexture:[pastaAtlas textureNamed:[NSString stringWithFormat:@"RTNuvem%i",nImagemSorteado]]];
    
    //Atualiza o tamanho do node
    [self setSize:self.texture.size];
    
    [self setAlpha:0.2f];
}

-(void)movimentar{
    [self runAction:[SKAction moveToX:2000 duration:self.velocidade]completion:^{
        //Ficar mais lgal :P
        [self runAction:[SKAction fadeOutWithDuration:0.1]completion:^{
            [self removeFromParent];
        }];
    }];
}
@end
