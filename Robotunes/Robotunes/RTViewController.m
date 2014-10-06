//
//  RTViewController.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTViewController.h"
#import "RTCenaMenu.h"
#import "RTFacebook.h"

@implementation RTViewController

-(void)viewDidLoad{
    //Chma a classe mãe
    [super viewDidLoad];
    
    //Verifica se precisa atualizar as musicas do coredata
    [RTDadosParse atualizaMusicasCoreData];
    
    //Registra p receber notificações da Scene de Menu
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tocarMusica:) name:@"NotificacaoTocarMusica" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pararMusica:) name:@"NotificacaoPararMusica" object:nil];
    
}

-(void)tocarMusica:(NSNotification*)notificacao{
    NSURL *urlSom = [[NSBundle mainBundle]URLForResource:[notificacao.userInfo valueForKey:@"nomeMusica"] withExtension:@"mp3"];
    NSError *error;
    
    self.playerMusica = [[AVAudioPlayer alloc]initWithContentsOfURL:urlSom error:&error];
    
    [self.playerMusica prepareToPlay];
    [self.playerMusica setNumberOfLoops:-1];
    [self.playerMusica play];
}
-(void)pararMusica:(NSNotification*)notificacao{
    [self.playerMusica stop];
}
-(void)viewDidLayoutSubviews{
    //Chama a classe mãe
    [super viewDidLayoutSubviews];
    
    //Inicia a view
    
    SKView *skView = [[SKView alloc]initWithFrame:self.view.bounds];
    
    

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
