//
//  RTFacebook.h
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 29/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

#import "RTBancoDeDadosController.h"

@interface RTFacebook : NSObject <FBLoginViewDelegate>

@property Boolean erro;

-(Boolean)mandarPontos :(int)pontos;
+(BOOL)estaLogadoFB;
+(void)sincronisaPontosFB;
+(void)deletaScoreApp;
+(void)logarFace;
@end
