//
//  Musica.h
//  Robotunes
//
//  Created by Leonardo de Sousa Mendes on 19/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

//Essa classe representa a Entidade Musica do core Data
//Esta com o nome Musica pq ele copia o nome da Entidade
@interface Musica : NSManagedObject

@property (nonatomic, retain) NSNumber * idmusica;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) id notas;

@end

//Interface usada para converter a propriedade Transformable da Entidade p NSArray e vice versa
@interface  ArrayNotas: NSValueTransformer

@end
