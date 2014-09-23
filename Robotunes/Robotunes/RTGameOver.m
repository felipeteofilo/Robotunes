//
//  RTGameOver.m
//  Robotunes
//
//  Created by LEONARDO DE SOUSA MENDES on 23/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTGameOver.h"

@implementation RTGameOver


-(id)initWithSize:(CGSize)size eGanhou:(BOOL)ganhou{
    if (self=[super initWithSize:size]) {
        [self configuraTela];
    }
    return self;
}

-(void)configuraTela{
    
}
@end
