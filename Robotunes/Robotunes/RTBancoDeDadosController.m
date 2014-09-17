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

@end
