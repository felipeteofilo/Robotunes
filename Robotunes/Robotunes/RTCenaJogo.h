//
//  RTCenaJogo.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import  <CoreMotion/CoreMotion.h>
#import "RTJogador.h"
#import "RTMusica.h"
#import "RTBancoDeDadosController.h"
#import "Musica.h"
#import <AVFoundation/AVFoundation.h>

//Categorias do jogo (chão, nota e jogador)
static const UInt32 NotaCategoria = 0x1 << 0;
static const UInt32 JogadorCategoria = 0x1 << 1;
static const UInt32 ChaoCategoria = 0x1 << 2;

@interface RTCenaJogo : SKScene <SKPhysicsContactDelegate>

//NSArray que armazena as posicoes em que as notas irão descer
@property NSArray *arrayPosicoes;

//int que armazena a posição atual
@property int posicaoAtual;

//RTMusica a musica que ira ser tocada
@property RTMusica *musica;


//Float tempo inicial da musica
@property float tempoInicial;

//Booleano que armazena se o device já foi inclinado ou não
@property BOOL inclinado;

//CMMotionManager que armazena o gerenciador/controlador de movimento pelo acelerometro
@property CMMotionManager *motionManager;

//RTJogador que armazena uma instancia do jogador
@property RTJogador *jogador;

//inteiro que armazena os pontos feitos nessa música
@property int pontos;

-(id)initWithSize:(CGSize)size andMusica:(int)musica;

@end
