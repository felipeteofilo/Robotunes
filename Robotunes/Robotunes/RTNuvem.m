//
//  RTNuvem.m
//  Robotunes
//
//  Created by Leonardo de Sousa Mendes on 22/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTNuvem.h"

@implementation RTNuvem

-(id)initNuvem:(float)alturaMinima :(float)alturaMaxima{
    if ([self init]) {
        
        //Sorteia a imagem que será da nuvem
        [self defineImagem];
        
        //sorteia a altura da nuvem
        [self sorteiaAltura:alturaMinima :alturaMaxima];
        
        //Sortei a velocidade da nuvem
        [self setVelocidade:(float)[RTUteis sorteioIntEntre:5 eMaiorNum:20]];
        
        //faz ela mover
        [self movimentar];
    }
    return self;
}

-(void)sorteiaAltura:(float)alturaMinima :(float)alturaMaxima{
    //define posicao Z para ficar a frente do fundo da tela e atras dos robos
    [self setZPosition:-50.0];
    [self setScale:0.5];
    
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
}

-(void)movimentar{
    [self runAction:[SKAction moveToX:2000 duration:self.velocidade]completion:^{
        //Ficar mais lgal :P
        [self runAction:[SKAction fadeOutWithDuration:0.5]completion:^{
            [self removeFromParent];
        }];
    }];
}
@end
