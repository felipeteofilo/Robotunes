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
        NSURL *urlSom = [[NSBundle mainBundle]URLForResource:self.nome withExtension:@"mp3"];
        NSError *error;
        self.som = [[AVAudioPlayer alloc]initWithContentsOfURL:urlSom error:&error];
        
        [self criarNotas:[musica valueForKey:@"notas"]];
        
        
    }
    return self;
}

//Método que cria as notas de acordo com o array passado
-(void)criarNotas:(NSArray*)notas{
    
    self.arrayDeNotas = [[NSMutableArray alloc]init];
    //percorre o array passado e cria as notas com nome, tempo e posicao e o add no array das notas
    for (int i =0; i < notas.count; i+=2) {
        
        float tempoNota = [[notas objectAtIndex:i]floatValue];
        int posicaoNota = [[notas objectAtIndex:i+1]intValue];
        
        RTNota *nota = [[RTNota alloc]initComNome:@"nota" tempo:tempoNota posicao:posicaoNota];
        
        [self.arrayDeNotas addObject:nota];
        
    }
    
}

-(Boolean)podeNotaQuebrada{
    if (self.notaAtual !=0 && self.notaAtual < self.arrayDeNotas.count) {
        RTNota * notaAnterior = [self.arrayDeNotas objectAtIndex:self.notaAtual-1];
        RTNota * proximaNota = [self.arrayDeNotas objectAtIndex:self.notaAtual];
        
        
        if (proximaNota.tempo - notaAnterior.tempo > 1.3) {
            return true;
        }
    }
    
    return false;
}

-(BOOL)acabou
{
    if (![self.som isPlaying]) {
        return YES;
    }
    return NO;
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
