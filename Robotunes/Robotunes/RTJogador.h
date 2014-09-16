//
//  RTJogador.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface RTJogador : SKNode

//Variável de controle do nível de vida do jogador
@property int vida;

//Variável do controle de pontos do jogador
@property int pontos;

//SKSpriteNode que armazena o sprite do jogador
@property SKSpriteNode *spriteNode;

@end
