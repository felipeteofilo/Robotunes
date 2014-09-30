//
//  RTBancoDeDadosController.h
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTAppDelegate.h"
#import "RTUteis.h"
//Classes para acessar as entidades
#import "Musica.h"
#import "Usuario.h"

@interface RTBancoDeDadosController : NSObject

+(void)salvarUsuario:(NSString*)nome pontos:(float)pontos ultimaVerificacao:(NSDate*)data;
+(void)salvarMusica:(int)idMusica nome:(NSString*)nome notas:(NSArray*)notas autor:(NSString*)autor;
+(void)salvarArrayMusicas:(NSArray*)arrayMusicas;
+(int)ultimaMusica ;
+(float)pontuacaoSalva;
+(void)salvarPontuacaoUser:(float)pontos;
+(NSDictionary*)infoMusica:(int)idMusica;
+(void)atualizarDataVerificacao;
+(NSDate*)ultimaDataVerificacao;
+(Musica*)procurarMusica :(int)idMusica;
+(NSArray*)todasMusicas;
@end
