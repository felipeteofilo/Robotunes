//
//  RTBancoDeDadosController.h
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTAppDelegate.h"

@interface RTBancoDeDadosController : NSObject



+(void)salvarUsuario:(NSString*)nome pontos:(float)pontos ultimaVerificacao:(NSDate*)data;
+(void)salvarMusica :(int)idMusica nome:(NSString*)nome notas:(NSArray*)notas;
+(void)salvarArrayMusicas:(NSArray*)arrayMusicas;
+(int)ultimaMusica ;

@end
