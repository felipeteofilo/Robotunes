//
//  RTCenaMenu.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTCenaMenu.h"
#import "RTFacebook.h"
#define tempoParaMudar 300;

@implementation RTCenaMenu


-(id)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]){
        //Variaveis para controle da mudança no menu
        self.tempo = -80;
        self.fundoAtual = 1;
        
        //Cria e adiciona o fundo
        [self criarFundos];
        
        //Cria e adiciona o título
        [self criarTitulo];
        
        //Cria o Botão do Facebook
        [self criarFace];
        
        //Cria e adiciona o chão
        [self criarChao];
        
        //Cria e adiciona o robo de venda
        [self criarRobotuneR1];
        
        //Cria e adiciona o robo de play
        [self criarRobotuneB2];
        
        //Cria e adiciona o robo principal - só a imagem
        [self criarRobotuneY3];
        
        //Alimenta array com os nomes da musica
        [self configuraMusicasAtuais];
    }
    return self;
}

-(void)tocaMusicaSelecionada{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificacaoTocarMusica" object:nil userInfo:[NSDictionary dictionaryWithObject:self.nomeMusica.text forKey:@"nomeMusica"]];
}

-(void)paraMusica{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificacaoPararMusica" object:nil];
}

-(void)configuraMusicasAtuais{
    self.musicasDisponiveis=[RTBancoDeDadosController todasMusicas];
    
    //Converto a posicao ao iniciar a tela
    self.idMusicaAtual=0;
    
    [self atualizarLabelMusica];
}
-(void)criarFundos
{
    SKTextureAtlas * fundos = [SKTextureAtlas atlasNamed:@"Fundos"];
    SKTextureAtlas * fundos2 = [SKTextureAtlas atlasNamed:@"Fundos1"];
    
    self.fundo = [[SKSpriteNode alloc]initWithImageNamed:@"1fundos"];
    self.fundo.anchorPoint = CGPointZero;
    self.fundo.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.fundo.zPosition = -17;
    
    self.fundo2 = [[SKSpriteNode alloc]initWithImageNamed:@"1fundos1"];
    self.fundo2.anchorPoint = CGPointZero;
    self.fundo2.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.fundo2.zPosition = -17;
    
    self.fundo2.alpha = 0;
    
    NSArray *framesFundo1 = [RTUteis lerFrames:fundos nome:@"fundos"];
    
    NSMutableArray *framesFundo2 = [RTUteis lerFrames:fundos2 nome:@"fundos1"];
    
    NSMutableArray *framesPrimeiraParte = (NSMutableArray*)framesFundo1;
    framesFundo1 = [[framesFundo1 reverseObjectEnumerator] allObjects];
    
    [framesPrimeiraParte removeObjectAtIndex:1];
    [self.fundo runAction:[SKAction animateWithTextures:framesPrimeiraParte timePerFrame:15]completion:^{
        [self.fundo runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:framesFundo1 timePerFrame:30 resize:NO restore:YES]]];
    }];
    
    [self.fundo2 runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:framesFundo2 timePerFrame:30 resize:NO restore:YES]]];
    
    
    SKAction *acaoFadeOut = [SKAction fadeOutWithDuration:15];
    SKAction *acaoFadeIn = [SKAction fadeInWithDuration:15];
    
    
    [self.fundo runAction:[SKAction repeatActionForever:[SKAction sequence:@[acaoFadeOut,acaoFadeIn]]]];
    [self.fundo2 runAction:[SKAction repeatActionForever:[SKAction sequence:@[acaoFadeIn,acaoFadeOut]]]];
    
    
    [self addChild:self.fundo];
    [self addChild:self.fundo2];
    
}

-(void)criarTitulo
{
    self.titulo = [[SKSpriteNode alloc]initWithImageNamed:@"logo"];
    self.titulo.anchorPoint = CGPointZero;
    self.titulo.size = self.frame.size;
    self.titulo.zPosition = -10;
    self.titulo.name = @"titulo";
    [self addChild:self.titulo];
}

-(void)criarFace
{
    self.btnFace = [[SKSpriteNode alloc]initWithImageNamed:@"btnFace"];
    self.btnFace.anchorPoint = CGPointZero;
    self.btnFace.size = CGSizeMake(self.frame.size.width * 0.1, self.frame.size.width * 0.1);
    self.btnFace.position = CGPointMake(self.frame.size.width * 0.85, self.frame.size.height * 0.85);
    self.btnFace.zPosition = -9;
    self.btnFace.name = @"face";
    [self addChild:self.btnFace];
}

-(void)criarChao
{
    self.chao = [[SKSpriteNode alloc]initWithImageNamed:@"chao"];
    self.chao.anchorPoint = CGPointZero;
    self.chao.size = CGSizeMake(self.frame.size.width, self.frame.size.height * 0.035);
    self.chao.position = CGPointZero;
    [self addChild:self.chao];
}

-(void)criarRobotuneR1
{
    self.robotuneR1Corpo = [[SKSpriteNode alloc]initWithImageNamed:@"R1_corpo"];
    self.robotuneR1Corpo.anchorPoint = CGPointZero;
    self.robotuneR1Corpo.size = CGSizeMake(self.frame.size.width * 0.24, self.frame.size.height * 0.39);
    self.robotuneR1Corpo.position = CGPointMake(self.frame.size.width * 0.7, 5);
    [self addChild:self.robotuneR1Corpo];
    
    self.robotuneR1Cabeca = [[SKSpriteNode alloc]initWithImageNamed:@"R1_cabeca"];
    self.robotuneR1Cabeca.anchorPoint = CGPointZero;
    self.robotuneR1Cabeca.size = CGSizeMake(self.frame.size.width * 0.32, self.frame.size.height * 0.32);
    self.robotuneR1Cabeca.position = CGPointMake(self.frame.size.width * 0.66, self.frame.size.height * 0.314);
    
    [self addChild:self.robotuneR1Cabeca];
    
    NSArray *framesAnimacao=[RTUteis lerFrames:[SKTextureAtlas atlasNamed:@"animacaoR1"]];
    
    [self.robotuneR1Cabeca runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:framesAnimacao timePerFrame:0.14]]];
}

-(void)criarRobotuneB2
{
    self.robotuneB2Corpo = [[SKSpriteNode alloc]initWithImageNamed:@"B2_Body"];
    self.robotuneB2Corpo.anchorPoint = CGPointZero;
    self.robotuneB2Corpo.size = CGSizeMake(self.frame.size.width * 0.36, self.frame.size.height*0.58);
    self.robotuneB2Corpo.position = CGPointMake(self.frame.size.width * 0.299, 5);
    [self addChild:self.robotuneB2Corpo];
    
    //Configura cabeca
    self.robotuneB2Cabeca =[SKSpriteNode node];
    [self.robotuneB2Cabeca setTexture:[[SKTextureAtlas atlasNamed:@"B2_Animacao"]textureNamed:@"1"]];
    
    [self.robotuneB2Cabeca setPosition:CGPointMake(CGRectGetMidX(self.robotuneB2Corpo.frame), CGRectGetHeight(self.robotuneB2Corpo.frame)*1.12f
                                                   )];
    [self.robotuneB2Cabeca setSize:CGSizeMake(self.frame.size.width * 0.36, self.frame.size.height*0.18)];
    
    [self addChild:self.robotuneB2Cabeca];
    
    //Anima cabeça B2
    NSArray *framesAnimacao=[RTUteis lerFrames:[SKTextureAtlas atlasNamed:@"B2_Animacao"]];
    
    [self.robotuneB2Cabeca runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:framesAnimacao timePerFrame:0.1]]];
    
    //Define tamanho do botao play
    [self criaBotaoPlay];
    
    ;
    [self criaBotoesNavegacao];
    
    [self criaLabelNomeMusica];
    
}
-(void)criaBotaoPlay{
    //Cria o botao
    self.botaoPlay=[[RTBotao alloc]initBotao:@"botaoPlay" comSel:@selector(playMusica) eDelegate:self eTamanho:CGSizeMake(CGRectGetWidth(self.robotuneB2Corpo.frame)*0.45, CGRectGetWidth(self.robotuneB2Corpo.frame)*0.45)];
    
    //Posiciona o botao
    [self.botaoPlay setPosition:CGPointMake(CGRectGetWidth(self.robotuneB2Corpo.frame)*0.486, CGRectGetHeight(self.robotuneB2Corpo.frame)*0.29)];
    [self.botaoPlay setZPosition:100];
    
    //Add na arvore
    [self.robotuneB2Corpo addChild:self.botaoPlay];
}

-(void)criaBotoesNavegacao{
    CGSize tamanho=CGSizeMake(CGRectGetHeight(self.robotuneB2Corpo.frame)*0.1, CGRectGetHeight(self.robotuneB2Corpo.frame)*0.1);
    
    self.navegacaoDir=[[RTBotao alloc]initBotao:@"botaoDireita" comSel:@selector(musicaSeguinte) eDelegate:self eTamanho:tamanho];
    
    [self.navegacaoDir setPosition:CGPointMake(CGRectGetWidth(self.robotuneB2Corpo.frame)*0.865,CGRectGetHeight(self.robotuneB2Corpo.frame)*0.688)];
    [self.navegacaoDir setZPosition:100];
    
    [self.robotuneB2Corpo addChild:self.navegacaoDir];
    
    
    self.navegacaoEsq=[[RTBotao alloc]initBotao:@"botaoEsquerda" comSel:@selector(musicaAnterior) eDelegate:self eTamanho:tamanho];
    
    [self.navegacaoEsq setPosition:CGPointMake(CGRectGetWidth(self.robotuneB2Corpo.frame)*0.138,CGRectGetHeight(self.robotuneB2Corpo.frame)*0.688)];
    [self.navegacaoEsq setZPosition:100];
    [self.robotuneB2Corpo addChild:self.navegacaoEsq];
}

-(void)atualizarLabelMusica{
    if (self.musicasDisponiveis) {
        
        [self.nomeMusica setText:[[self.musicasDisponiveis objectAtIndex:self.idMusicaAtual]objectForKey:@"nomeMusica"]];
        [self tocaMusicaSelecionada];
    }
}
//Metodo para dar play na musica
-(void)playMusica{
    [self paraMusica];
    [self carregarJogo:self.idMusicaAtual+1];
    
}


//Metodo p navegacao entre musicas
-(void)musicaSeguinte{
    if (self.idMusicaAtual+1 > [self.musicasDisponiveis count]-1) {
        self.idMusicaAtual=0;
    }else{
        self.idMusicaAtual++;
    }
    
    [self atualizarLabelMusica];
}

-(void)musicaAnterior{
    if (self.idMusicaAtual-1 < 0) {
        self.idMusicaAtual=(int)[self.musicasDisponiveis count]-1;
    }else{
        self.idMusicaAtual--;
    }
    
    [self atualizarLabelMusica];
}

-(void)criaLabelNomeMusica{
    self.nomeMusica=[SKLabelNode labelNodeWithFontNamed:[RTUteis fonteApp]];
    [self.nomeMusica setFontSize:[RTUteis tamanhoFonteoIPad:30.0f fonteIPhone:14.0f]];
    
    [self.nomeMusica setZPosition:100];
    
    [self.nomeMusica setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [self.nomeMusica setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
    
    [self.nomeMusica setPosition:CGPointMake(CGRectGetWidth(self.robotuneB2Corpo.frame)*0.5, CGRectGetHeight(self.robotuneB2Corpo.frame)*0.679)];
    
    [self.robotuneB2Corpo addChild:self.nomeMusica];
}
//Faz o load do jogo passado a musica que ira tocar
-(void)carregarJogo :(int)musica{
    
    //Faz a animacao de load na thread secundaria
    __weak RTCenaMenu *weakself = self;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        //Background thread
        //Load scene here
        [weakself removeAllChildren];
        NSArray * frames =[RTUteis lerFrames:[SKTextureAtlas atlasNamed:@"Loading"] nome:@"loading"];
        SKSpriteNode * node = [[SKSpriteNode alloc]initWithTexture:[frames objectAtIndex:0]];
        
        
        node.size = weakself.size ;
        node.anchorPoint =CGPointZero;
        node.name = @"load";
        [weakself addChild:node];
        RTCenaJogo *jogo = [[RTCenaJogo alloc]initWithSize:weakself.size andMusica:musica];
        
        SKAction *loading = [SKAction repeatAction:[SKAction animateWithTextures:frames timePerFrame:0.25] count:2];
        
        //assim que ele terminar de executar a animacao ele ira carregar o jogo na thread principal
        [node runAction:loading completion:^{
            
            [weakself runAction:[SKAction runBlock:^{
                [weakself.view presentScene:jogo];
            } queue:(dispatch_get_main_queue())]];
        }];
    });
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *toque=[touches anyObject];
    
    CGPoint posToqueNoMenu =[toque locationInNode:self];
    
    //Pega o node na posicao do toque
    SKNode *nodeTocadoNoMenu=[self nodeAtPoint:posToqueNoMenu];
    
    if ([nodeTocadoNoMenu.name isEqualToString:@"face"]) {
        if ([RTFacebook estaLogadoFB]) {
           // [RTFacebook deletaScoreApp];
        }else {
            [RTFacebook logarFace];
        }
        
    }
    if ([nodeTocadoNoMenu.name isEqualToString:@"titulo"]){
        UIStoryboard *storyBoard =[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]];
        
        RTRankingViewController *ranking = [storyBoard instantiateInitialViewController];
        [self.view.window.rootViewController presentViewController:ranking animated:NO completion:nil];
    }
}


-(void)criarRobotuneY3
{
    self.robotuneY3 = [[SKSpriteNode alloc]initWithImageNamed:@"RobotuneY3"];
    self.robotuneY3.anchorPoint = CGPointZero;
    self.robotuneY3.size = CGSizeMake(self.frame.size.width * 0.176, self.frame.size.height * 0.25);
    self.robotuneY3.position = CGPointMake(self.frame.size.width * 0.056, 5);
    [self addChild:self.robotuneY3];
}

-(void)update:(NSTimeInterval)currentTime
{
    if(!self.musicasDisponiveis){
        [self configuraMusicasAtuais];
    }
    
    //COISAS PARA A NUVEM
    //Tempo desde ultimo update
    CFTimeInterval ultimoUpdate = currentTime - self.intervaloNuvens;

    //A cada meio segundo tenta criar uma nuvem
    if (ultimoUpdate > 0.4) {
        if ([RTUteis sortearChanceSim:15]) {
            //Cria a nuvem
            RTNuvem *nuvem=[[RTNuvem alloc]initNuvem:CGRectGetMidY(self.frame) :CGRectGetMaxY(self.frame)+50 frameTela:self.frame];
            
            //add na arvore de nodes
            [self addChild:nuvem];
        }
        
        //Atualiza o contador
        self.intervaloNuvens =currentTime;
    }
}

@end
