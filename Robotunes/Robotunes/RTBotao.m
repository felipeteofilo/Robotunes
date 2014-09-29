//
//  RTBotao.m
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 29/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTBotao.h"

@implementation RTBotao

-(id)initBotao:(NSString*)iconeBotao comSel:(SEL)seletor eDelegate:(id)delegate eAnimacao:(NSString*)atlasAnimacao{
    if (self=[super initWithImageNamed:iconeBotao]) {
        [self setAcaoRealizar:seletor];
        [self setDelegateBotao:delegate];
        
        [self setAtlasAnimacao:atlasAnimacao];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //Faz a animacao do botao
    [self runAction:[SKAction animateWithTextures:[RTUteis lerFrames:[SKTextureAtlas atlasNamed:self.atlasAnimacao]] timePerFrame:0.05]];
    
    if ([self.delegateBotao respondsToSelector:self.acaoRealizar]) {
        [self.delegateBotao performSelector:self.acaoRealizar];
    }
    
}
@end
