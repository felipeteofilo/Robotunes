//
//  RTCenaJogo.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTCenaJogo.h"

@implementation RTCenaJogo

-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        NSLog(@"Você está no Jogo");
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
