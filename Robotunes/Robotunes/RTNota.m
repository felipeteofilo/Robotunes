//
//  RTNota.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTNota.h"

@implementation RTNota


//Método para inciar a nota
-(id)initComNome: (NSString *)nome tempo:(float)tempo posicao:(int)posicao
{
    if(self = [super initWithImageNamed:[self imagem:nome]]){
        
        self.anchorPoint = CGPointZero;
        
        self.nome = nome;
        self.tempo = tempo;
        self.posicao = posicao;
    }
    return self;
}

//Método para pegar uma imagem aleatoria de nota
-(NSString*)imagem :(NSString*)nome{
    
    NSString *imagemNota;
    
    if ([nome isEqualToString:@"nota"]) {
        int imagem = arc4random() % 6;
        imagemNota = [NSString stringWithFormat:@"notinha%d",imagem+1];
        return imagemNota;
    }
    else{
        int imagem = arc4random() % 5;
        imagemNota = [NSString stringWithFormat:@"quebrada%d",imagem];
        return imagemNota;
        
    }
        
}

//Metodo que cria o corpo fisico da nota
-(void)criarCorpoFisico{
    [self setPhysicsBody:[SKPhysicsBody bodyWithPolygonFromPath:[self pathForRectangleOfSize:self.size withAnchorPoint:self.anchorPoint]]];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.restitution = 0;
}


//Metodo para centralizar o corpo fisico da nota
- (CGPathRef)pathForRectangleOfSize:(CGSize)size withAnchorPoint:(CGPoint)anchor {
    CGPathRef path = CGPathCreateWithRect( CGRectMake(-size.width * anchor.x, -size.height * anchor.y,
                                                      size.width,   size.height), nil);
    return path;
}

@end
