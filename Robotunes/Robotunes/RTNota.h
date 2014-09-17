//
//  RTNota.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTNota : NSObject

//NSString que armazena o nome da nota
@property NSString *nome;

//Float que armazena o tempo em que a nota está na música
@property float tempo;

//INIT que recebe o nome da nota e a partir disso adquire suas informações
-(id)initComNome: (NSString *)nome;

@end
