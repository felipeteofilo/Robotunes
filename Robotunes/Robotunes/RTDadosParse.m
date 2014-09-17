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
    //Cria uma thread
    
    //da sleep de 1 seg
    
        //Executa metodo
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

+(void)logout{
    [PFUser logOut];
}

//Atualiza musicas
+(void)atualizaMusicasCoreData{
    //Pega o ID da ultima musica
    int ultimoIDMusicaDB=[RTBancoDeDadosController ultimaMusica];
    
    //Verifica se precisa baixar
    if ([RTDadosParse precisaAtualizar: ultimoIDMusicaDB]) {
        PFQuery *queryMusicasNovas=[[PFQuery alloc]initWithClassName:@"Musicas"];
        [queryMusicasNovas whereKey:@"idMusica" greaterThan:[NSNumber numberWithInt:ultimoIDMusicaDB]];
        
        //Configura a query p pegar apenas alguns campos da tabela
        [queryMusicasNovas selectKeys:@[@"idMusica",@"nomeMusica",@"notas"]];
        
        //Tenta baixar as musicas, montando um array // usa um metodo separado p executar em uma nova thread
        [queryMusicasNovas findObjectsInBackgroundWithBlock:^(NSArray *novasMusicas, NSError *error) {
            //Código de erro para quanto excede qtde n de requisições
            if (error.code == 155) {
                [RTDadosParse aguardarTempo:@selector(atualizaMusicasCoreData)];
            }else{
                if (![novasMusicas count]==0) {
                    //Tenta salvar o array no core data
                    [RTBancoDeDadosController salvarArrayMusicas:novasMusicas];
                }
            }
        }];
    }
}
+(void)processaQuerry:(PFQuery*)querry{
    
}
@end
