//
//  RTNota.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface RTNota : SKSpriteNode

//NSString que armazena o nome da nota
@property NSString *nome;

//Float que armazena o tempo em que a nota está na música
@property float tempo;

//Int que armazena a posicao da nota
@property int posicao;

//INIT que recebe o nome da nota e a partir disso adquire suas informações
-(id)initComNome: (NSString *)nome tempo:(float)tempo posicao:(int)posicao;

//Criar corpo fisico da nota
-(void)criarCorpoFisico;

@end
