//
//  RTCenaMenu.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RTCenaJogo.h"
#import <FacebookSDK/FacebookSDK.h>
#import "RTDadosParse.h"
#import "RTBancoDeDadosController.h"
#import "RTNuvem.h"
#import "RTUteis.h"
#import "RTBotao.h"
#import "RTMusica.h"

@interface RTCenaMenu : SKScene

@property float tempo;
@property int fundoAtual;

@property SKSpriteNode *robotuneR1;
@property SKSpriteNode *robotuneR1Cabeca;
@property SKSpriteNode *robotuneR1Corpo;
@property SKSpriteNode *robotuneB2Cabeca;
@property SKSpriteNode *robotuneB2Corpo;
@property SKSpriteNode *robotuneY3;

//Botoes de Play e navegacao
@property RTBotao *botaoPlay;
@property RTBotao *navegacaoDir;
@property RTBotao *navegacaoEsq;
@property SKLabelNode *nomeMusica;

//Toca a musica selecionada
@property AVAudioPlayer *playerMusica;

//Transicao entre musicas
@property NSArray *musicasDisponiveis;
@property int idMusicaAtual;

//Timer para criação das nuvens
@property (nonatomic) NSTimeInterval intervaloNuvens;

@property SKSpriteNode *fundo;
@property SKSpriteNode *fundo2;

@property SKAction *acaoFundoFadeIn;
@property SKAction *acaoFundoFadeOut;

@property SKSpriteNode *titulo;
@property SKSpriteNode *btnFace;
@property SKSpriteNode *chao;

@end
