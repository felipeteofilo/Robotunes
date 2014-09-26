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
    [self.view addSubview:skView];
    skView.showsNodeCount = YES;
    skView.showsFPS=YES;
    skView.showsPhysics=YES;
    
    
    __weak RTViewController *weakself = self;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        //Background thread
        //Load scene here
        
        SKView *skView = [[SKView alloc]initWithFrame:self.view.bounds];
        [weakself.view addSubview:skView];
        skView.showsNodeCount = YES;
        skView.showsFPS=YES;
        skView.showsPhysics=YES;
        [self load];
        RTCenaMenu *menu = [[RTCenaMenu alloc]initWithSize:skView.bounds.size];
        menu.scaleMode = SKSceneScaleModeAspectFill;
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [skView presentScene:menu];
            
        });
    });
}

-(void)load{
    UIImageView *imagem = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    [imagem setFrame:self.view.frame];
    
    [self.view addSubview:imagem];
}
@end
