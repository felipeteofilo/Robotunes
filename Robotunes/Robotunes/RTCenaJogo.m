//
//  RTCenaJogo.m
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTCenaJogo.h"

@implementation RTCenaJogo

-(id)initWithSize:(CGSize)size andMusica:(RTMusica*)musica
{
    if(self = [super initWithSize:size]){
        //Acrescenta um fundo branco
        self.backgroundColor = [UIColor whiteColor];
        
        //Define a gravidade da Cena
        self.physicsWorld.gravity = CGVectorMake(0, -3);
        
        //Determina que o delegate para colisão é a própria cena
        self.physicsWorld.contactDelegate = self;
        
        //Inicia a inclinação como falsa
        self.inclinado = NO;
        
        //Cria as posições possiveis para o jogador
        [self criarPosicoes];
        
        //Inicia posição em 2 (no meio)
        self.posicaoAtual = 2;
        
        //Cria a imagem de fundo
        [self criarImagemFundo];
        
        //Cria o chão
        [self criarChao];
        
        //Cria o jogador
        [self criarJogador];
        
        self.musica = musica;
        
        //Cria o sistema do Acelerometro - NÃO USADO
        //[self criarAcelerometro];
        
        //Inicia propriedade p controle dos combos
        //Comeca com 1 pq ao atribuir a pontuacao do jogador ele multiplica pelo combo
        self.combo=1;
        
    }
    return self;
}

-(void)criarImagemFundo
{
    //Cria a imagem de fundo e define atributos
    SKSpriteNode *imagemFundo = [[SKSpriteNode alloc]initWithImageNamed:@"fundo"];
    imagemFundo.anchorPoint = CGPointZero;
    imagemFundo.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    imagemFundo.zPosition = -10;
    imagemFundo.alpha = 0.5f;
    
    //Adiciona a imagem de fundo
    [self addChild:imagemFundo];
}

-(void)criarChao
{
    //Cria o chão e define atributos
    SKSpriteNode *chao = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(self.size.width, self.size.height * 0.01)];
    //chao.anchorPoint = CGPointZero;
    chao.position = CGPointMake(CGRectGetMidX(self.frame),0);
    chao.zPosition = -1;
    
    //Cria o corpo físico do chão
    chao.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:chao.size];
    chao.physicsBody.affectedByGravity = NO;
    chao.physicsBody.restitution = 0;
    chao.physicsBody.collisionBitMask = ChaoCategoria;
    chao.physicsBody.contactTestBitMask = NotaCategoria;
    chao.physicsBody.usesPreciseCollisionDetection = YES;
    chao.physicsBody.dynamic = NO;
    
    //Adiciona o chão
    [self addChild:chao];
}


-(void)criarJogador
{
    //propriedades
    self.jogador = [[RTJogador alloc]initWithSize:CGSizeMake(self.frame.size.width * 0.2, self.frame.size.width * 0.2)];
    
    self.jogador.position = CGPointMake([[self.arrayPosicoes objectAtIndex:self.posicaoAtual] floatValue], self.frame.size.height * 0.01);
    self.jogador.zPosition = 10;
    
    //Com quais categorias ele colide
    self.jogador.physicsBody.categoryBitMask = JogadorCategoria;
    self.jogador.physicsBody.contactTestBitMask = NotaCategoria;
    
    //Adiciona o jogador na cena
    [self addChild:self.jogador];
}

//Metodo para criar as notas na tela
-(void)criarNotas{
    if (self.tempoInicial == 0) {
        self.tempoInicial = CACurrentMediaTime();
    }
    
    int posicao = arc4random() %4;
    
    RTNota* nota = [self.musica notaAtual:CACurrentMediaTime()- self.tempoInicial];
    if (nota != nil) {
        
//        
//        nota.size = CGSizeMake(self.frame.size.width * 0.08, self.frame.size.width * 0.08);
//        nota.position = CGPointMake([[self.arrayPosicoes objectAtIndex:posicao ]floatValue]+nota.size.width, self.frame.size.height * 1);
//        
//        [nota criarCorpoFisico];
//        nota.physicsBody.categoryBitMask = NotaCategoria;
//        nota.physicsBody.contactTestBitMask = ChaoCategoria;
//        
//        [self addChild:nota];
    }
}



//NÃO USADO
-(void)criarAcelerometro
{
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.1;
    if([self.motionManager isAccelerometerAvailable] == YES){
        [self.motionManager startAccelerometerUpdates];
    }
}


-(void)criarPosicoes
{
    //5 posicoes fixas onde o jogador pode ficar
    NSNumber *posicao1 = [[NSNumber alloc] initWithFloat:self.frame.size.width * 0.0];
    NSNumber *posicao2 = [[NSNumber alloc] initWithFloat:self.frame.size.width * 0.2];
    NSNumber *posicao3 = [[NSNumber alloc] initWithFloat:self.frame.size.width * 0.4];
    NSNumber *posicao4 = [[NSNumber alloc] initWithFloat:self.frame.size.width * 0.6];
    NSNumber *posicao5 = [[NSNumber alloc] initWithFloat:self.frame.size.width * 0.8];
    
    self.arrayPosicoes = [[NSMutableArray alloc]initWithObjects:posicao1, posicao2, posicao3, posicao4, posicao5, nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Se o toque for do lado direito
    if([touches.anyObject locationInNode:self].x > self.view.frame.size.width/2){
        //Se não estiver na posição 4, anda para a direita
        if(self.posicaoAtual != 4){
            self.posicaoAtual++;
            [self.jogador movimentarPara:@"Direita" naPosicao:[self.arrayPosicoes objectAtIndex:self.posicaoAtual]];
        }
    }
    
    //Senão, se o toque for do lado esquerdo
    else{
        //Se não estiver na posição 0, anda para a esquerda
        if(self.posicaoAtual != 0){
            self.posicaoAtual--;
            [self.jogador movimentarPara:@"Esquerda" naPosicao:[self.arrayPosicoes objectAtIndex:self.posicaoAtual]];
        }
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    // Organiza os corpos de acordo com o valor da categoria. Isto é feito para facilitar a comparação mais em baixo
    SKPhysicsBody *firstBody, *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    // Compara as máscaras de categoria com os valores que nós usamos para os objetos do jogo
    if ((firstBody.categoryBitMask & NotaCategoria)!=0) {
        if ((secondBody.categoryBitMask & ChaoCategoria) !=0) {
            
            NSLog(@"foi nota");
        }
        if ((secondBody.categoryBitMask & JogadorCategoria)!=0) {
            NSLog(@"foi player");
            
            [self.jogador atualizarPontos:10*[self combo]];
            
            self.notasCertasSeq++;
        }
    }
    
    //A categoria nota errada esta com um numero maior que o jogador
    if ((firstBody.categoryBitMask & JogadorCategoria )!=0) {
        
        //Verifica se colidiu com uma nota errada
        if ((secondBody.categoryBitMask & NotaErradaCategoria)!=0) {
            //TODO: tocar som errado
            
            [self.jogador atualizarVida:-10];
            //zerar contador de notas certas
            self.notasCertasSeq=0;
            
            //Volta p o primeito combo
            self.combo=1;
        }
    }
}


-(void)update:(NSTimeInterval)currentTime
{
    
    [self criarNotas];
    
    //Chama a verificação do combo
    [self atualizarCombo];
    
    //    //ACELEROMETRO! NÃO USADO
    //    //VERIFICAÇÃO DE MOVIMENTO
    //    //Se o jogador fizer um movimento para a direita...
    //    if(self.motionManager.accelerometerData.acceleration.y > 0.10){
    //        if(self.posicaoAtual != 4 && !self.inclinado){
    //            self.posicaoAtual++;
    //            [self.jogador movimentarPara:@"Direita" naPosicao:[self.arrayPosicoes objectAtIndex:self.posicaoAtual]];
    //        }
    //    }
    //
    //    //Senão, se o jogador fizer um movimento para a esquerda...
    //    else if(self.motionManager.accelerometerData.acceleration.y < -0.10){
    //        if(self.posicaoAtual != 0 && !self.inclinado){
    //            self.posicaoAtual--;
    //            [self.jogador movimentarPara:@"Esquerda" naPosicao:[self.arrayPosicoes objectAtIndex:self.posicaoAtual]];
    //        }
    //    }
    //
    //
    //    //VERIFICAÇÃO DE INCLINAÇÃO
    //    //Se ele inclinar mais de 0.25 ou menos de -0.25 -> inclinado = TRUE
    //    if(self.motionManager.accelerometerData.acceleration.y > 0.10 || self.motionManager.accelerometerData.acceleration.y < -0.10){
    //        self.inclinado = YES;
    //    }
    //
    //    //Se a inclinação estiver entre -0.20 e 0.20 -> inclinado = FALSE
    //    if(self.motionManager.accelerometerData.acceleration.y > -0.1 && self.motionManager.accelerometerData.acceleration.y < 0.1){
    //        self.inclinado = NO;
    //    }
    //
    //    NSLog(@"inclinado? %hhd", self.inclinado);
}

//Verifica se o jogador ja acertou N notas e atualiza o multiplicador dos pontos
-(void)atualizarCombo{
    //Aumenta a qtde de notas p gerar o combo
    if (self.notasCertasSeq >= (2 + self.combo)) {
        self.combo++;
        self.notasCertasSeq =0;
    }
}

@end
