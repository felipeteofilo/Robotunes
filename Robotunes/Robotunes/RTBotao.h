//
//  RTBotao.h
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 29/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RTUteis.h"

@interface RTBotao : SKSpriteNode

@property SEL acaoRealizar;
@property id delegateBotao;
@property NSString *atlasAnimacao;

-(id)initBotao:(NSString*)iconeBotao comSel:(SEL)seletor eDelegate:(id)delegate eAnimacao:(NSString*)atlasAnimacao;
@end
