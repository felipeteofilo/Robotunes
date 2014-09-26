//
//  RTUteis.h
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 19/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <SpriteKit/SpriteKit.h>

@interface RTUteis : NSObject

//Classe usada para métodos genericos e de utilidade geral;
+(NSDate*)formataData:(NSDate*)data;
+(BOOL)possuiConexao;
+(BOOL)possuiConexaoServidor:(NSString*)urlServidor;
+(int)diasEntreDataInicial:(NSDate*)dataInicial andDate:(NSDate*)dataFinal;
+(int)sorteioIntEntre:(int)menorNum eMaiorNum:(int)maiorNum;
+(BOOL)sortearChanceSim:(float)chanceSim;
+(CGPathRef)pathForRectangleOfSize:(CGSize)size withAnchorPoint:(CGPoint)anchor;
+(NSMutableArray*)lerFrames :(SKTextureAtlas*)pastaFrames;
@end
