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
       // [newContact setValue: forKey:@"pontos"];
        
    }
}

+(NSManagedObject*)procurarUsuario :(NSString*)nome{
    
    RTAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Usuario"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(nome = %@)",
     nome];
    [request setPredicate:pred];
    
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    if ([objects count] == 0) {
        return nil;
    }
    else{
        return [objects objectAtIndex:1];
    }
    
}
+(NSManagedObject*)procurarMusica :(int)idMusica{
    
    RTAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
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
    RTAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *novaMusica = [self procurarMusica:idMusica];
    if (novaMusica == nil) {
        novaMusica = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Musica"
                      inManagedObjectContext:context];
        [novaMusica setValue:[NSNumber numberWithInt:idMusica] forKey:@"idmusica"];
        [novaMusica setValue:nome forKey:@"nome"];
    }
    [novaMusica setValue:notas forKey:@"notas"];
    
    NSError *erro;
    [context save:&erro];
}

@end
