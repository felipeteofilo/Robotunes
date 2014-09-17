//
//  RTJogador.h
//  Robotunes
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface RTJogador : SKNode

//Variável de controle do nível de vida do jogador
@property int vida;

//Variável do controle de pontos do jogador
@property int pontos;

//SKSpriteNode que armazena o sprite do jogador
@property SKSpriteNode *spriteNode;

//SKActions de todas as ações do personagem
@property SKAction *acaoAndarDireita; //Ao andar para a direita
@property SKAction *acaoAndarEsquerda; //Ao andar para a esperda
@property SKAction *acaoDancarDireita; //Ao andar para a direita - Dancinha de quem anda
@property SKAction *acaoDancarEsquerda; //Ao andar para a esperda - Dancinha de quem anda
@property SKAction *acaoPerder; //Ao perder toda a vida
@property SKAction *acaoGanhar; //Ao conseguir completar a música
@property SKAction *acaoDancarBem1; //Ao pegar uma nota
@property SKAction *acaoDancarBem2; //Ao pegar uma nota
@property SKAction *acaoDancarBem3; //Ao pegar uma nota
@property SKAction *acaoDancarMal1; //Ao perder ou pegar uma nota quebrada
@property SKAction *acaoDancarMal2; //Ao perder ou pegar uma nota quebrada

//Método que retorna YES se o jogador tiver perdido todas as vidas e NO se o jogador ainda estiver "vivo"
-(BOOL)morreu;

//Método que atualiza a vida do jogador dependendo do valor passado
-(void)atualizarVida: (int)valor;

//Método que atualiza os pontos do jogador dependendo do valor passado
-(void)atualizarPontos: (int)valor;

//Método que ativa as animações de movimento do personagem
-(void)movimentar: (NSString*)direcao;

//Método que ativa a animação de "Perdeu" do personagem
-(void)perder;

//Método que ativa a animação de "Ganhou" do personagem
-(void)ganhar;

//Método que ativa as animações de "Dançar bem" do personagem
-(void)dancarBem;

//Método que ativa as animações de "Dançar mal" do personagem
-(void)dancarMal;


@end
