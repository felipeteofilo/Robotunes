//
//  RTUteis.h
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 19/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface RTUteis : NSObject

+(NSDate*)formataData:(NSDate*)data;
+(BOOL)possuiConexao;
+(BOOL)possuiConexaoServidor:(NSString*)urlServidor;
+(int)diasEntreDataInicial:(NSDate*)dataInicial andDate:(NSDate*)dataFinal;
@end
