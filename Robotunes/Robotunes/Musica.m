//
//  Musica.m
//  Robotunes
//
//  Created by Leonardo de Sousa Mendes on 19/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "Musica.h"


@implementation Musica

@dynamic idmusica;
@dynamic nome;
@dynamic notas;

@end

//Implementacao da interface ArrayNotas
@implementation ArrayNotas

//define o tipo de classe que deve ser retornado ao converter o obj
+(Class)transformedValueClass{
    return [NSArray class];
}

+(BOOL)allowsReverseTransformation{
    return YES;
}

-(id)transformedValue:(id)value{
    return [NSKeyedArchiver archivedDataWithRootObject:value];
}

-(id)reverseTransformedValue:(id)value{
    return [NSKeyedUnarchiver unarchiveObjectWithData:value];
}
@end
