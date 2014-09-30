//
//  RankingViewController.h
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface RTRankingViewController : UIViewController <UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tabelaRanking;
@property NSMutableDictionary *scores;
@end