//
//  RTFacebook.m
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 29/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTFacebook.h"

@implementation RTFacebook

-(Boolean)mandarPontos :(int)pontos{
    
    [FBRequestConnection startWithGraphPath:@"me/scores"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error) {
         if (error) {
             self.erro = true;
         }
         else{
             int pontosAtuais =[[[[result objectForKey:@"data"]objectAtIndex:0]objectForKey:@"score"]intValue];
             
             
             NSDictionary *pontosEnviar = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",pontos+ pontosAtuais],@"score",nil];
             
             [FBRequestConnection startWithGraphPath:@"me/scores"
                                          parameters:pontosEnviar
                                          HTTPMethod:@"POST"
                                   completionHandler:
              ^(FBRequestConnection *connection, id result, NSError *error) {
                  if (error) {
                      self.erro = true;
                  }
                  else {
                      self.erro = false;
                  }
                  
              }];
         }
     }];
    
    return self.erro;
}

+(BOOL)estaLogadoFB{
    if ([FBSession activeSession].state == FBSessionStateOpen) {
        return YES;
    }else{
        return NO;
    }
}

+(void)sincronisaPontosFB{
    RTFacebook *facebook=[[RTFacebook alloc]init];
    
    //Verifica se esta locago
    if ([RTFacebook estaLogadoFB]) {
        [facebook mandarPontos:[RTBancoDeDadosController pontuacaoSalva]];
        
        [RTBancoDeDadosController marcaSincronizado];
    }
}
+(void)deletaScoreApp{
    [FBRequestConnection startWithGraphPath:@"me/scores" parameters:nil HTTPMethod:@"DELETE" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (error) {
            NSLog(@"erro");
        }
        else{
            NSLog(@"sem erro");
        }
    }];
}

+(void)logarFace{
    FBSession *session = [[FBSession alloc] initWithPermissions:@[@"publish_actions",@"user_games_activity",@"user_friends"]];
    if (FBSession.activeSession.state == FBSessionStateOpen
        || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
        [FBSession.activeSession closeAndClearTokenInformation];
    }
    // Initialize a session object
    else{
        
        
        [FBSession setActiveSession:session];
        
        // Open the session
        [session openWithBehavior:FBSessionLoginBehaviorForcingWebView
                completionHandler:^(FBSession *session,
                                    FBSessionState status,
                                    NSError *error) {
                    
                    if(error == nil)
                    {
                        NSLog(@"login successful");
                        
                    }
                    else
                    {
                        NSLog(@"login unsuccessful");
                    }
                    
                }];
    }
    
}
@end
