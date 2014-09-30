//
//  RTFacebook.h
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 29/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface RTFacebook : NSObject


@property Boolean erro;

-(Boolean)mandarPontos :(int)pontos;

@end
