//
//  RTDadosParse.m
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 17/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTDadosParse.h"


@implementation RTDadosParse

//Verifica se tem tem novas musicas
+(BOOL)precisaAtualizar:(int)ultimoIDDB{

    int ultimoIDServidor=[self ultimoIDMusica];
    ultimoIDDB=1;
    
    if (ultimoIDDB == ultimoIDServidor) {
        return NO;
    }else{
        return YES;
    }
}

//Baixa novas musicas

//Aguarda um seg requisisão excedeu o limite
+(void)aguardarTempo:(SEL)seletorMetodoRetorno{
    
}

+(int)ultimoIDMusica{
    //Cria uma query na tabela Musicas
    PFQuery *consultaMusicas=[[PFQuery alloc]initWithClassName:@"Musicas"];

    //Ordena decrescente e pega o primeiro
    [consultaMusicas orderByDescending:@"idMusica"];
    return (int)[consultaMusicas getFirstObject];
}

//Loga no Parse
+(void)logarParse{
    
    //Pega as info basicas do user
    [PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {

        //Não logou
        if (!user) {
            if (!error) {
                UIAlertView *alerta=[[UIAlertView alloc]initWithTitle:@"Login" message:@"Usuário Cancelou o Login!" delegate:nil cancelButtonTitle:@"Fechar" otherButtonTitles:nil];
                
                [alerta show];
            }else{
                NSLog(@"Erro Conectar: %@",[error localizedDescription]);
            }
        }
        //Logou
        else{
            NSLog(@"User logado");
        }
    }];
}

//Atualiza musicas
+(void)atualizaMusicasCoreData{
    //Pega o ID da ultima musica
    int ultimoIDMusicaDB=[RTBancoDeDadosController ultimaMusica];
    
    //Verifica se precisa baixar
    if ([RTDadosParse precisaAtualizar: ultimoIDMusicaDB]) {
        PFQuery *musicasNovas=[[PFQuery alloc]initWithClassName:@"Musicas"];
        [musicasNovas whereKey:@"idMusica" greaterThan:[NSNumber numberWithInt:ultimoIDMusicaDB]];
        
        
        
        //Tenta baixar as musicas, montando um array // usa um metodo separado p executar em uma nova thread
        [musicasNovas findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            //Código de erro para quanto excede qtde n de requisições
            if (error.code == 155) {
                [RTDadosParse aguardarTempo:@selector(atualizaMusicasCoreData)];
            }else{
                
                //Salva as musicas baixadas em um array
                
            }
        }];
        
        //Tenta salvar o array no core data
        
    }
}
+(void)salvar
+(void)processaQuerry:(PFQuery*)querry{
    
}
@end
