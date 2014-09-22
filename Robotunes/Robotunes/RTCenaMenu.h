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

@interface RTCenaMenu : SKScene


@property int numeroDeMusicas;
@property int musicaEscolhida;

@property SKSpriteNode *robotuneR1;
@property SKSpriteNode *robotuneB2;
@property SKSpriteNode *robotuneY3;

@property SKSpriteNode *fundo1;
@property SKSpriteNode *fundo2;
@property SKSpriteNode *fundo3;
@property SKSpriteNode *fundo4;

@property SKSpriteNode *titulo;
@property SKSpriteNode *btnFace;
@property SKSpriteNode *chao;

@property SKSpriteNode *nuvem1;
@property SKSpriteNode *nuvem2;


@end
