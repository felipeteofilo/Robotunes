//
//  RTViewController.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTViewController.h"

@implementation RTViewController

-(void)viewDidLoad{
    //Chma a classe mãe
    [super viewDidLoad];
    
    //Verifica se precisa atualizar as musicas do coredata
    [RTDadosParse atualizaMusicasCoreData];
    
}

-(void)viewDidLayoutSubviews{
    //Chama a classe mãe
    [super viewDidLayoutSubviews];
    
    //Inicia a view
    
    SKView *skView = [[SKView alloc]initWithFrame:self.view.bounds];
    skView.showsNodeCount = YES;
    skView.showsFPS=YES;
    skView.showsPhysics=YES;
    [self.view addSubview:skView];
    
    RTCenaMenu *menu = [[RTCenaMenu alloc]initWithSize:skView.bounds.size];
    menu.scaleMode = SKSceneScaleModeAspectFill;
    
    [skView presentScene:menu];
    
}

-(void)load{
    UIImageView *imagem = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    [imagem setFrame:self.view.frame];
    
    [self.view addSubview:imagem];
}
@end
