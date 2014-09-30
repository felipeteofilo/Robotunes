//
//  RTBotao.m
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 29/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTBotao.h"

@implementation RTBotao

-(id)initBotao:(NSString*)atlasAnimacao comSel:(SEL)seletor eDelegate:(id)delegate eTamanho:(CGSize)size{
    if (self=[super init]) {

        
        [self setAcaoRealizar:seletor];
        [self setDelegateBotao:delegate];
        
        [self setAtlasAnimacao:atlasAnimacao];
        
       //Define como imagem o 1 frame da animacao
        [self setTexture:[[SKTextureAtlas atlasNamed:self.atlasAnimacao]textureNamed:@"1"]];
        
        [self setSize:size];
        
        //Ativa a interacao do User
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //Faz a animacao do botao
    [self runAction:[SKAction animateWithTextures:[RTUteis lerFrames:[SKTextureAtlas atlasNamed:self.atlasAnimacao]] timePerFrame:0.07 resize:NO restore:YES]completion:^{
        
        if ([self.delegateBotao respondsToSelector:self.acaoRealizar]) {
            [self.delegateBotao performSelector:self.acaoRealizar];
        }
    }];
    
    
}
@end
