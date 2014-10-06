//
//  RankingViewController.m
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "RTRankingViewController.h"
#import "RTDadosParse.h"

@interface RTRankingViewController ()

@end

@implementation RTRankingViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    UIImageView *fundo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fundoRank"]];
    
    [fundo setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    UIImageView *molduraRank = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"RANKS"]];
    
    
    
    [molduraRank setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    
    self.tabelaRanking =[[UITableView alloc]initWithFrame:CGRectMake(self.view.bounds.size.height * 0.29, self.view.bounds.size.width * 0.115, self.view.bounds.size.height * 0.744, self.view.bounds.size.width * 0.54)style:UITableViewStylePlain];
    
    [self.tabelaRanking setUserInteractionEnabled:YES];
    
   
    
    [self.tabelaRanking setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:0.3]];
    
    [self.tabelaRanking.backgroundView setTintColor:[UIColor blackColor]];
    
    [self.tabelaRanking setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    [self.tabelaRanking setDataSource:self];
    [self.tabelaRanking setDelegate:self];
    
    [self.view addSubview:fundo];
    
    [self.view addSubview:molduraRank];
    
    [self.view addSubview:self.tabelaRanking];
    
    UIButton *botaoVoltar = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.42, self.view.bounds.size.height*0.91, self.view.bounds.size.width *0.165, self.view.bounds.size.height * 0.07)];
    
    
    
    [botaoVoltar addTarget:self action:@selector(voltarMenu) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:botaoVoltar];
    
    
    
    self.fotos = [[NSMutableArray alloc]init];
    
    [FBProfilePictureView class];
    [FBRequestConnection startWithGraphPath:@"677025905716549/scores"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error) {
         self.scores = result;
         
         [self.tabelaRanking reloadData];
         
     }];
}


-(void)voltarMenu{
    [self dismissViewControllerAnimated:NO completion:nil];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}
- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.bounds.size.width * 0.08;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.view.bounds.size.width * 0.015; // you can have your own choice, of course
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([[self.scores objectForKey:@"data"]count] > 7) {
        return 7;
    }
    return [[self.scores objectForKey:@"data"]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Creates each cell for the table view.
    
    static NSString *cellID =  @"CELLID" ;
    
    UITableViewCell *cell = [self.tabelaRanking dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    NSString *nomeDoUsuario = [[[[self.scores objectForKey:@"data"]objectAtIndex:indexPath.section ] objectForKey:@"user"]objectForKey:@"name"];
    int scoreDoUsuario =[[[[self.scores objectForKey:@"data"]objectAtIndex:indexPath.section] objectForKey:@"score"]intValue];
    
    NSString *usuario = [NSString stringWithFormat:@"%d: %@ : %d",indexPath.section+1,nomeDoUsuario,scoreDoUsuario];
    
    NSString *idDoUsuario= [[[[self.scores objectForKey:@"data"]objectAtIndex:indexPath.section] objectForKey:@"user"]objectForKey:@"id"];
    
    
    if (self.fotos.count > indexPath.section) {
        [cell.imageView setImage:[self.fotos objectAtIndex:indexPath.section]];
    }
    else{
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?width=200&height=200", idDoUsuario]];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *fotoPerfil = [UIImage imageWithData:data];
        [self.fotos addObject:fotoPerfil];
        [cell.imageView setImage:fotoPerfil];
    }
    [cell.contentView setBackgroundColor:[UIColor blackColor]];
    
    [cell.textLabel setText:usuario];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


@end
