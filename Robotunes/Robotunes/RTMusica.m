//
//  RTMusica.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTMusica.h"

@implementation RTMusica


//funcao init da musica que recebe o objeto do banco de dados
-(id)initMusica :(Musica*)musica
{
    if(self = [super init]){
        
        
        self.notaAtual = 0;
        
        self.nome = [musica valueForKey:@"nome"];
        self.autor =[musica valueForKey:@"autor"];
        
        
        [self criarNotas:[musica valueForKey:@"notas"]];
        
        
    }
    return self;
}

//Método que cria as notas de acordo com o array passado
-(void)criarNotas:(NSArray*)notas{
    
    self.arrayDeNotas = [[NSMutableArray alloc]init];
    //percorre o array passado e cria as notas com nome, tempo e posicao e o add no array das notas
    for (int i =0; i < notas.count; i+=3) {
        NSString * nomeNota = [notas objectAtIndex:i];
        float tempoNota = [[notas objectAtIndex:i+1]floatValue];
        int posicaoNota = [[notas objectAtIndex:i+2]intValue];
        
        RTNota *nota = [[RTNota alloc]initComNome:nomeNota tempo:tempoNota posicao:posicaoNota];
        
        [self.arrayDeNotas addObject:nota];
        
    }
    
}

-(BOOL)acabou
{
    //TODO
    return YES;
}

//Método que retorna a nota pelo tempo
-(RTNota *)nota: (float)tempo
{   if(self.notaAtual < self.arrayDeNotas.count){
    RTNota *nota = [self.arrayDeNotas objectAtIndex:self.notaAtual];
    
    if (tempo >= nota.tempo ) {
        self.notaAtual++;
        return nota;
    }
}
    
    return nil;
}


@end
