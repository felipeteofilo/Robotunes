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
        self.espacoBarrinha=(CGRectGetWidth(self.frame)*0.0512f);
        
        [self setAnchorPoint:CGPointMake(0, 1)];
        [self setPosition:CGPointMake(CGRectGetMinX(frame)+(CGRectGetWidth(frame)*0.035f),CGRectGetMaxY(frame)-(CGRectGetHeight(frame)*0.025f))];
        
        [self criaBarrinhasSangue];
        [self configuraLabelPontos];
        [self configuraLabelCombo];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(atualizarBarraSangue:) name:@"NotificacaoMudancaSangue" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(atualizarPontos:) name:@"NotificacaoMudancaPontos" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(atualizaLabelCombo:) name:@"NotificacaoMudancaCombo" object:nil];
        
        [self setScale:0.4];
    }
    
    return self;
}
-(void)atualizaLabelCombo:(NSNotification*)notificacao{
    NSNumber *combo=[notificacao.userInfo valueForKey:@"combo"];
    
    [self.combo setText:[NSString stringWithFormat:@"x%i",[combo intValue]]];
}
-(void)configuraLabelCombo{
    self.combo=[SKLabelNode labelNodeWithFontNamed:@"Noteworthy-Bold"];
    [self.combo setFontSize:150.0f];
    [self.combo setPosition:CGPointMake(CGRectGetWidth(self.frame)*0.98f, CGRectGetHeight(self.frame)* -1.2f)];
    [self.combo setFontColor:[UIColor colorWithRed:255/255.0f green:193/255.0f blue:0/255.0f alpha:1]];
    [self.combo setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeRight];
    [self.combo setText:@"x1"];
    
    [self addChild:self.combo];
    
}
-(void)configuraLabelPontos{
    
    //Configura pontuacao
    self.pontuacao =[SKLabelNode labelNodeWithFontNamed:@"Noteworthy-Bold"];
    [self.pontuacao setFontSize:100.0];
    [self.pontuacao setText:@"0"];
    [self.pontuacao setPosition:CGPointMake(CGRectGetWidth(self.frame)*0.02f, CGRectGetHeight(self.frame)* -1.1f) ];
    [self.pontuacao setFontColor:[UIColor colorWithRed:255/255.0f green:193/255.0f blue:0/255.0f alpha:1]];
    [self.pontuacao setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    [self addChild:self.pontuacao];
    
}
-(void)criaBarrinhasSangue{
    CGPoint posicaoBarra=CGPointMake(CGRectGetWidth(self.frame)*0.095f,CGRectGetHeight(self.frame)* -0.126f);
    
    //Aloca array barrinha
    self.barrinhas=[NSMutableArray array];
    
    for (int i=0; i<16; i++) {
        //Cria um spritenoteåß
        SKSpriteNode *barra=[self novaBarrinha];
        
        [barra setPosition:posicaoBarra];
        posicaoBarra=CGPointMake(posicaoBarra.x + self.espacoBarrinha, posicaoBarra.y);
        
        [self addChild:barra];
    }
}

-(SKSpriteNode*)novaBarrinha{
    CGSize tamanhoBarrinha=CGSizeMake(self.size.width*0.041f, self.size.height*0.683);
    
    SKSpriteNode *novaBarrinha=[SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:185/255.0f green:93/255.0f blue:219/255.0f alpha:1.0] size:tamanhoBarrinha];
    
    [novaBarrinha setAnchorPoint:CGPointMake(0, 1)];
    [novaBarrinha setZPosition:self.zPosition -1];
    
    [self.barrinhas addObject:novaBarrinha];
    
    return novaBarrinha;
}
-(void)atualizarBarraSangue:(NSNotification*)notificacao{
    //Pega o valor que atualizou o sangue
    NSDictionary *userInfo=notificacao.userInfo;
    NSNumber *valor=[userInfo valueForKey:@"valor"];
    
    //Verifica se cria ou remove uma barrinha de sangue
    if (([valor intValue]  > 0)&&([self.barrinhas count] < 16)) {
        //Cria barrinha
        SKSpriteNode *ultimaBarrinha=[self.barrinhas lastObject];
        
        SKSpriteNode *novaBarrinha=[self novaBarrinha];
        [novaBarrinha setPosition:CGPointMake( ultimaBarrinha.position.x +self.espacoBarrinha, ultimaBarrinha.position.y)];
        [novaBarrinha setScale:2.5];
        
        //Add no array
        [self.barrinhas addObject:novaBarrinha];
        
        //add na arvore de nodes
        [self addChild:novaBarrinha];
    }else if([valor intValue]< 0){
        //Verifica a qtde de sangue
        SKNode *barra=[self.barrinhas lastObject];
        [barra removeFromParent];
        [self.barrinhas removeLastObject];
    }
    
    switch ([self.barrinhas count]) {
        case 6:
            [self pintaBarrinhasCor:[UIColor colorWithRed:209/255.0f green:51/255.0f blue:51/255.0f alpha:1]];
            break;
            
        case 10:
            [self pintaBarrinhasCor:[UIColor colorWithRed:233/255.0f green:120/255.0f blue:24/255.0f alpha:1]];
            break;
            
        case 13:
            [self pintaBarrinhasCor:[UIColor colorWithRed:255/255.0f green:193/255.0f blue:0/255.0f alpha:1]];
            break;
            
        case 15:
            [self pintaBarrinhasCor:[UIColor colorWithRed:93/255.0f green:219/255.0f blue:159/255.0f alpha:1]];
            break;
            
        case 16:
            [self pintaBarrinhasCor:[UIColor colorWithRed:185/255.0f green:93/255.0f blue:219/255.0f alpha:1.0]];
            break;
            
        default:
            break;
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
