//
//  RTHUD.h
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 24/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface RTHUD : SKSpriteNode

//Array q conterá as barrinhas com cores diferentes
@property NSMutableArray *barrinhas;
//Padroniza o espaco entre as barrinhas
@property float espacoBarrinha;

//Mostra pontuacao e combo
@property SKLabelNode *pontuacao;
@property SKLabelNode *combo;


-(id)initHUD:(CGRect)frame;
@end
