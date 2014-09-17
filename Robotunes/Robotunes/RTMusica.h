//
//  RTMusica.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTNota.h"

@interface RTMusica : NSObject

//NSMutableArray que armazena as notas da música
@property NSMutableArray *arrayDeNotas;

//NSString que armazena o nome da música
@property NSString *nome;

//Float que armazena o tempo total da música
@property float tempoTotal;

//Método que indica se a música acabou ou não
-(BOOL)acabou;

//Método que retorna a música atual de acordo com o tempo passado
-(RTNota *)notaAtual: (float)tempo;

@end
