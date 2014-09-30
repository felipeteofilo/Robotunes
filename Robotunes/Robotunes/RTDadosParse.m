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
    
    if (ultimoIDDB == ultimoIDServidor) {
        return NO;
    }else{
        return YES;
    }
}

//Aguarda um seg requisisão excedeu o limite
+(void)aguardarTempo:(SEL)seletorMetodoRetorno{
    //Timer para refazer a acao
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:seletorMetodoRetorno
                                   userInfo:nil
                                    repeats:NO];
}

+(int)ultimoIDMusica{
    //Cria uma query na tabela Musicas
    PFQuery *consultaMusicas=[[PFQuery alloc]initWithClassName:@"Musicas"];
    
    //Ordena decrescente e pega o primeiro
    [consultaMusicas orderByDescending:@"idMusica"];
    [consultaMusicas selectKeys:@[@"idMusica"]];
    
    //PEGA O PRIMEIRO OBJ DA QUERRY // PEGA O VALOR DA CHAVE ID // E TRANSFORMA EM INT
    return [[consultaMusicas getFirstObject][@"idMusica"] intValue];
}

//Loga no Parse
+(void)logarParse{
    
    //Pega as info basicas do user
    [PFFacebookUtils logInWithPermissions:@[@"publish_actions",@"user_games_activity",@"user_friends"] block:^(PFUser *user, NSError *error) {
        
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

+(BOOL)possuiConexaoParse{
    return [RTUteis possuiConexaoServidor:@"www.parse.com"];
}

//Atualiza musicas
+(void)atualizaMusicasCoreData{
    //Verifica se tem internet
    if ((![RTUteis possuiConexao]) || (![RTDadosParse possuiConexaoParse]) ) {
        return;
    }
    
    //Verifica se está no prazo de att
    NSDate *ultimaDataVerificacao=[RTBancoDeDadosController ultimaDataVerificacao];
    
    if (ultimaDataVerificacao) {
        if ([RTUteis diasEntreDataInicial:ultimaDataVerificacao andDate:[RTUteis formataData:[NSDate date]]] < 1) {
            return;
        }
    }
    
    //Pega o ID da ultima musica
    int ultimoIDMusicaDB=[RTBancoDeDadosController ultimaMusica];
    
    //Verifica se precisa baixar
    if ([RTDadosParse precisaAtualizar: ultimoIDMusicaDB]) {
        PFQuery *queryMusicasNovas=[[PFQuery alloc]initWithClassName:@"Musicas"];
        
        [queryMusicasNovas whereKey:@"idMusica" greaterThan:[NSNumber numberWithInt:ultimoIDMusicaDB]];
        
        //Configura a query p pegar apenas alguns campos da tabela
        [queryMusicasNovas selectKeys:@[@"idMusica",@"nomeMusica",@"notasMusica",@"Autor"]];
        
        //Tenta baixar as musicas, montando um array // usa um metodo separado p executar em uma nova thread
        [queryMusicasNovas findObjectsInBackgroundWithBlock:^(NSArray *retorno, NSError *error) {
            //Código de erro para quanto excede qtde n de requisições
            if (error.code == 155) {
                [RTDadosParse aguardarTempo:@selector(atualizaMusicasCoreData)];
            }else{
                if (![retorno count]==0) {
                    //Faz um for each e monta o array
                    NSMutableArray *novasMusicas=[NSMutableArray array];
                    NSMutableDictionary *infoMusica;
                    
                    for (PFObject *musica in retorno){
                        infoMusica=[NSMutableDictionary dictionary];
                        
                        [infoMusica setValue:musica[@"nomeMusica"] forKey:@"nomeMusica"];
                        [infoMusica setValue:musica[@"idMusica"] forKey:@"idMusica"];
                        [infoMusica setValue:[NSArray arrayWithArray:[musica objectForKey:@"notasMusica"]] forKey:@"notasMusica"];
                        [infoMusica setValue:musica[@"Autor"] forKey:@"autor"];
                        
                        [novasMusicas addObject:infoMusica];
                    }
                    
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
