//
//  RTMusica.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTMusica.h"

@implementation RTMusica

-(id)initMusica :(Musica*)musica
{
    if(self = [super init]){
        
        self.nome = [musica valueForKey:@"nome"];
        self.autor =[musica valueForKey:@"autor"];
        
        
        
        
        
    }
    return self;
}

-(void)criarNotas:(NSArray*)notas{
    
    for (int i =0; i < notas.count; i+=3) {
        NSString * nomeNota = [notas objectAtIndex:i];
        float tempoNota = 
        
        
    }
    
}

-(BOOL)acabou
{
    //TODO
    return NO;
}

-(RTNota *)notaAtual: (float)tempo
{
    //TODO
    return nil;
}


@end
