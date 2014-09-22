//
//  RTDadosParse.h
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 17/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "RTBancoDeDadosController.h"
#import "RTUteis.h"

@interface RTDadosParse : NSObject


+(void)logarParse;
+(void)logout;
+(void)atualizaMusicasCoreData;

+(void)teste;
@end
