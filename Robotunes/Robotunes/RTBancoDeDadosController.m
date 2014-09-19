//
//  RTBancoDeDadosController.m
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTBancoDeDadosController.h"

@implementation RTBancoDeDadosController

+(void)salvarUsuario:(NSString*)nome pontos:(float)pontos ultimaVerificacao:(NSDate*)data{
    
    RTAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newContact = [self procurarUsuario:nome];
    
    if (newContact == nil) {
        [newContact setValue:nome forKey:@"nome"];
    }
}

+(NSManagedObject*)procurarUsuario :(NSString*)nome{
    return nil;
}

+(NSManagedObject*)procurarUsuario{
    
    RTAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Usuario"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    if ([objects count] == 0) {
        return nil;
    }
    else{
        return [objects objectAtIndex:0];
    }
    
}
//Alterado para retornar a classe especifica da entidade Musica
//MUSICA = TABELA MUSICA COREDATA
+(Musica*)procurarMusica :(int)idMusica{
    NSManagedObjectContext *context = [RTBancoDeDadosController contextoApp];
    
    NSEntityDescription *descricaoEntidade =
    [NSEntityDescription entityForName:@"Musica"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:descricaoEntidade];
    
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"(idmusica = %d)",
     idMusica];
    [request setPredicate:predicate];
    
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    if ([objects count] == 0) {
        return nil;
    }
    else{
        return [objects objectAtIndex:0];
    }
}

+(int)ultimaMusica {
    RTAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *descricaoEntidade =
    [NSEntityDescription entityForName:@"Musica"
                inManagedObjectContext:context];
    
    NSFetchRequest *requisicao = [[NSFetchRequest alloc] init];
    [requisicao setEntity:descricaoEntidade];
    [requisicao setResultType:NSDictionaryResultType];
    
    NSExpression *keyDaExpressao = [NSExpression expressionForKeyPath:@"idmusica"];
    
    NSExpression *max = [NSExpression expressionForFunction:@"max:" arguments:[NSArray arrayWithObject:keyDaExpressao]];
    
    NSExpressionDescription *descricaoDaExpressao = [[NSExpressionDescription alloc]init];
    
    [descricaoDaExpressao setName:@"maxValue"];
    [descricaoDaExpressao setExpression:max];
    [descricaoDaExpressao setExpressionResultType:NSInteger64AttributeType];
    
    [requisicao setPropertiesToFetch:[NSArray arrayWithObject:descricaoDaExpressao]];
    
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:requisicao
                                              error:&error];
    
    if ([objects count] == 0) {
        return 0;
    } else {
        
        return [[[objects objectAtIndex:0]valueForKey:@"maxValue"]intValue];
    }
}

+(void)salvarMusica:(int)idMusica nome:(NSString*)nome notas:(NSArray*)notas{
    NSManagedObjectContext *context = [RTBancoDeDadosController contextoApp];
    
    //Alterado para usar a classe especifica da Entidade
    //MUSICA = TABELA MUSICA COREDATA
    Musica *novaMusicaSalvar=[self procurarMusica:idMusica];
    
    if (novaMusicaSalvar == nil) {
        novaMusicaSalvar = [NSEntityDescription
                            insertNewObjectForEntityForName:@"Musica"
                            inManagedObjectContext:context];
        
        [novaMusicaSalvar setIdmusica:[NSNumber numberWithInt:idMusica]];
        [novaMusicaSalvar setNome:nome];
    }
    [novaMusicaSalvar setNotas:notas];
    
    NSError *erro;
    [context save:&erro];
}

//Metodo recebe um array de dictionarys e para cada posicao salva uma nova musica no BD
+(void)salvarArrayMusicas:(NSArray*)arrayMusicas{
    for (int i=0; i < [arrayMusicas count]; i++) {
        NSDictionary *musicaDictionary=[arrayMusicas objectAtIndex:i];
        
        [RTBancoDeDadosController salvarMusica:[[musicaDictionary objectForKey:@"idMusica"]intValue] nome:[musicaDictionary valueForKey:@"nomeMusica"] notas:[musicaDictionary valueForKey:@"notasMusica"]];
    }
}
+(float)pontuacaoSalva{
    RTAppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *contexto=[appDelegate managedObjectContext];
    
    //Cria a requisicao
    NSFetchRequest *requisicao=[[NSFetchRequest alloc]initWithEntityName:@"Usuario"];
    [requisicao setPropertiesToFetch:@[@"pontos"]];
    
    [requisicao setResultType:NSDictionaryResultType];
    
    NSError *error;
    NSArray *objetos=[contexto executeFetchRequest:requisicao error:&error];
    
    if ([objetos count]==0) {
        return 0;
    }else{
        return [[[objetos objectAtIndex:0]valueForKey:@"pontos"]intValue];
    }
}

//Pega o contexto do app p manipular o BD
+(NSManagedObjectContext*)contextoApp{
    RTAppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    return [appDelegate managedObjectContext];
}

+(void)salvarPontuacaoUser:(float)pontos{
    NSManagedObjectContext *contexto=[RTBancoDeDadosController contextoApp];
    
    float ultimaPontuacao=[RTBancoDeDadosController pontuacaoSalva];
    
    //Só salva a pontuação se for maior q a anterior
    if (!pontos > ultimaPontuacao) {
        return;
    }
    
    NSManagedObject *infoUser=[RTBancoDeDadosController procurarUsuario];
    
    if (!infoUser) {
        //Não encontrou o user add novo registro
        infoUser=[NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:contexto];
        
        [infoUser setValue:[NSNumber numberWithFloat:pontos] forKey:@"pontos"];
        [infoUser setValue:[NSNumber numberWithBool:YES] forKey:@"sincronizarpontos"];
    }else{
        //Encontrou atualiza
        [infoUser setValue:[NSNumber numberWithFloat:pontos] forKey:@"pontos"];
        
        //Marca para sincronizar para tentar postar no FB na prox vez que tiver net
        [infoUser setValue:[NSNumber numberWithBool:YES] forKey:@"sincronizarpontos"];
    }
}

+(NSDictionary*)infoMusica:(int)idMusica{
    //MUSICA = TABELA MUSICA DO CORE DATA
    Musica *musicaSalva=[RTBancoDeDadosController procurarMusica:idMusica];
    
    NSMutableDictionary *infoMusica=[[NSMutableDictionary alloc]init];
    
    
    [infoMusica setValue:[musicaSalva nome] forKey:@"nome"];
    [infoMusica setValue:[musicaSalva notas] forKey:@"notas"];
    
    return infoMusica;
}
@end
