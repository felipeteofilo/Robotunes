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

-(id)initHUD:(CGRect)frame;
-(void)atualizarBarraSangue;
-(void)atualizarPontos;
@end
