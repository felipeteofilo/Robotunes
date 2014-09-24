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

    
}
-(void)viewDidLayoutSubviews{
    //Chama a classe mãe
    [super viewDidLoad];
    
    //Verifica se precisa atualizar musicas
    [RTDadosParse atualizaMusicasCoreData];
    
    //Inicia a view
    SKView *skView = [[SKView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:skView];
    skView.showsNodeCount = YES;
    skView.showsFPS=YES;
    skView.showsPhysics=YES;
    
    //RTCenaJogo *menu =[[RTCenaJogo alloc]initWithSize:skView.bounds.size andMusica:[[RTMusica alloc]init]];
    // skView.showsPhysics =YES;
    
    //Cria a cena de menu
    RTCenaMenu *menu = [[RTCenaMenu alloc]initWithSize:skView.bounds.size];
    
    // RTCenaJogo *menu =[[RTCenaJogo alloc]initWithSize:skView.bounds.size];

    menu.scaleMode = SKSceneScaleModeAspectFill;
    
    
    //Mostra a cena de menu
    [skView presentScene:menu];
}
@end
