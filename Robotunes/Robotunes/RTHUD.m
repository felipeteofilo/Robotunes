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
        
        [self setSize:CGSizeMake(CGRectGetWidth(frame)*0.9f, CGRectGetHeight(frame)*0.3f)];
        self.espacoBarrinha=(CGRectGetWidth(self.frame)*0.0512f);
        
        //Verifica despositivo que esta rodando

        float fonteLabel=[RTUteis tamanhoFonteoIPad:50.0f fonteIPhone:25.0f];
        
        [self configuraLabelPontos:fonteLabel];
        [self configuraLabelCombo:fonteLabel];
        [self pintarHUD];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(atualizarBarraSangue:) name:@"NotificacaoMudancaSangue" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(atualizarPontos:) name:@"NotificacaoMudancaPontos" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(atualizaLabelCombo:) name:@"NotificacaoMudancaCombo" object:nil];
    }
    
    return self;
}
-(void)atualizaLabelCombo:(NSNotification*)notificacao{
    NSNumber *combo=[notificacao.userInfo valueForKey:@"combo"];
    
    [self.combo setText:[NSString stringWithFormat:@"x%i",[combo intValue]]];
}
-(void)configuraLabelCombo:(float)fonte{
    self.combo=[SKLabelNode labelNodeWithFontNamed:@"Noteworthy-Bold"];
    [self.combo setFontSize:fonte];
    [self.combo setPosition:CGPointMake(CGRectGetWidth(self.frame)*0.98f, CGRectGetHeight(self.frame)* -1.1f)];
    [self.combo setFontColor:[UIColor colorWithRed:255/255.0f green:193/255.0f blue:0/255.0f alpha:1]];
    [self.combo setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeRight];
    [self.combo setText:@"x1"];
    
    [self addChild:self.combo];
    
}
-(void)configuraLabelPontos:(float)fonte{
    //Configura pontuacao
    self.pontuacao=[SKLabelNode labelNodeWithFontNamed:@"Noteworthy-Bold"];
    
    [self.pontuacao setFontSize:fonte];
    [self.pontuacao setText:@"0"];
    [self.pontuacao setFontColor:[UIColor colorWithRed:255/255.0f green:193/255.0f blue:0/255.0f alpha:1]];
    [self.pontuacao setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    [self.pontuacao setName:@"pontos"];
    [self.pontuacao setPosition:CGPointMake(CGRectGetWidth(self.frame)*0.02f, CGRectGetHeight(self.frame)* -1.1f) ];
    
    [self addChild:self.pontuacao];
}
-(void)criaBarrinhasSangue:(int)nBarrinhas{
    CGPoint posicaoBarra=CGPointMake(CGRectGetWidth(self.frame)*0.095f,CGRectGetHeight(self.frame)* -0.126f);
    
    //Aloca array barrinha
    self.barrinhas=[NSMutableArray array];
    
    //TODO: melhorar integracao entre sangue e HUD
    for (int i=0; i<nBarrinhas; i++) {
        //Cria um spritenote
        SKSpriteNode *barra=[self novaBarrinha];
        
        [barra setName:@"barrinha"];
        [barra setPosition:posicaoBarra];
        posicaoBarra=CGPointMake(posicaoBarra.x + self.espacoBarrinha, posicaoBarra.y);
        
        [self addChild:barra];
    }
    [self pintarHUD];
}

-(SKSpriteNode*)novaBarrinha{
    CGSize tamanhoBarrinha=CGSizeMake(self.size.width*0.041f, self.size.height*0.683);
    
    SKSpriteNode *novaBarrinha=[SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:185/255.0f green:93/255.0f blue:219/255.0f alpha:1.0] size:tamanhoBarrinha];
    
    [novaBarrinha setAnchorPoint:CGPointMake(0, 1)];
    [novaBarrinha setZPosition:self.zPosition -1];
    
    [self.barrinhas addObject:novaBarrinha];
    
    return novaBarrinha;
}

-(void)atualizarBarraSangue:(NSNotification*)noticacao{
    NSNumber *valor=[noticacao.userInfo objectForKey:@"vida"];
    if ([self.barrinhas count]<=16) {
        //Limpa barrinhas
        for (SKNode *node in self.barrinhas) {
            [node removeFromParent];
        }
        
        [self criaBarrinhasSangue:[valor intValue]];
    }
}
-(void)pintarHUD{
    
    if ([self.barrinhas count] <=6) {
        [self pintaBarrinhasCor:[UIColor colorWithRed:209/255.0f green:51/255.0f blue:51/255.0f alpha:1]];
    }else if ([self.barrinhas count] <=10){
        [self pintaBarrinhasCor:[UIColor colorWithRed:233/255.0f green:120/255.0f blue:24/255.0f alpha:1]];
    }else if ([self.barrinhas count] <=13){
        [self pintaBarrinhasCor:[UIColor colorWithRed:255/255.0f green:193/255.0f blue:0/255.0f alpha:1]];
    }else if ([self.barrinhas count] <=15){
        [self pintaBarrinhasCor:[UIColor colorWithRed:93/255.0f green:219/255.0f blue:159/255.0f alpha:1]];
    }else{
        [self pintaBarrinhasCor:[UIColor colorWithRed:185/255.0f green:93/255.0f blue:219/255.0f alpha:1.0]];
    }
    
}

-(void)pintaBarrinhasCor:(UIColor*)novaCor{
    //Pinta a barra se entrar no swit
    for (SKSpriteNode *barra in self.barrinhas) {
        [barra setColor:novaCor];
    }
}

-(void)atualizarPontos:(NSNotification*)notificacao{
    NSNumber *pontos=[notificacao.userInfo valueForKey:@"pontos"];
    
    [self.pontuacao setText:[NSString stringWithFormat:@"%i",[pontos intValue]]];
}

//Remove o observador da HUD
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
