//
//  RTHUD.m
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 24/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTHUD.h"
#import "RTUteis.h"

@implementation RTHUD

-(id)initHUD:(CGRect)frame{
    if (self=[super initWithImageNamed:@"HUD_barrinha"]) {
        [self setAnchorPoint:CGPointMake(0, 1)];
        [self setPosition:CGPointMake(CGRectGetMinX(frame)+(CGRectGetWidth(frame)*0.035f),CGRectGetMaxY(frame)-(CGRectGetHeight(frame)*0.025f))];
        
        [self setPhysicsBody:[SKPhysicsBody bodyWithPolygonFromPath:[RTUteis pathForRectangleOfSize:self.size withAnchorPoint:self.anchorPoint]]];
        
        [self.physicsBody setDynamic:NO];
        
        
        
        
        //[self criaBarrinhaSangue];
        [self atualizarBarraSangue:10];
        //[self atualizarPontos];
        
        
        
        
        [self setScale:0.4];
        
    }
    
    return self;
}

-(void)criaBarrinhaSangue{
    CGSize tamanhoBarra=CGSizeMake(self.size.width*0.04f, self.size.height*0.68);
    CGPoint posicaoBarra=CGPointMake(CGRectGetMinX(self.frame),CGRectGetMinY(self.frame)* -0.128f);
    
    for (int i=0; i<10; i++) {
        //Cria um spritenote
        SKSpriteNode *barra=[SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:185/255.0f green:93/255.0f blue:219/255.0f alpha:1.0] size:tamanhoBarra];
        
        
        [barra setAnchorPoint:CGPointMake(0, 1)];
        
        [barra setPosition:posicaoBarra];
        
        [self addChild:barra];
    }
}
-(void)atualizarBarraSangue:(int)vidaJogo{
    //Verifica a qtde de sangue
    
}

-(void)atualizarPontos{
    
}
@end
