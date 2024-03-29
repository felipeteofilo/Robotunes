//
//  RTViewController.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTViewController.h"

@implementation RTViewController

- (void)viewDidLoad
{
    //Chama a classe mãe
    [super viewDidLoad];

    //Inicia a view
    SKView *skView = [[SKView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width)];
    [self.view addSubview:skView];
    skView.showsNodeCount = YES;
    
    //Cria a cena de menu
    RTCenaMenu *menu = [[RTCenaMenu alloc]initWithSize:skView.bounds.size];
    menu.scaleMode = SKSceneScaleModeAspectFill;
    
    //Mostra a cena de menu
    [skView presentScene:menu];

}


@end
