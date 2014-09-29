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


@end
