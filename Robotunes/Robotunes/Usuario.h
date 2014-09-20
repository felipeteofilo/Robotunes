//
//  Usuario.h
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 19/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Usuario : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * pontos;
@property (nonatomic, retain) NSNumber * sincronizarpontos;
@property (nonatomic, retain) NSDate * ultimaverificacao;

@end
