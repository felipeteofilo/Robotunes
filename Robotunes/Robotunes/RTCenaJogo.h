//
//  RTCenaJogo.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RTJogador.h"

//Categorias do jogo (chão, nota e jogador)
static const UInt32 NotaCategoria = 0x1 << 0;
static const UInt32 JogadorCategoria = 0x1 << 1;
static const UInt32 ChaoCategoria = 0x1 << 2;

@interface RTCenaJogo : SKScene

//NSMutabeArray que armazena as posicoes em que as notas irão descer
@property NSMutableArray *posicoes;

//RTJogador que armazena uma instancia do jogador
@property RTJogador *jogador;

//inteiro que armazena os pontos feitos nessa música
@property int pontos;

@end
