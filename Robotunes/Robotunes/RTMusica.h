//
//  RTMusica.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTNota.h"
#import "Musica.h"



@interface RTMusica : NSObject

//NSMutableArray que armazena as notas da música
@property NSMutableArray *arrayDeNotas;

//NSString que armazena o nome da música
@property NSString *nome;

//NSString que armazena o nome do autor
@property NSString *autor;

//Float que armazena o tempo total da música
@property float tempoTotal;

//Int que armazena a nota atual
@property int notaAtual;


@property AVAudioPlayer *som;

//Método que indica se a música acabou ou não
-(BOOL)acabou;

//Método que retorna a música atual de acordo com o tempo passado
-(RTNota *)nota: (float)tempo;


//Método init da musica que recebe o objeto do banco de dados
-(id)initMusica :(Musica*)musica;
@end
