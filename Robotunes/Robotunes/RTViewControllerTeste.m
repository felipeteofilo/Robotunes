//
//  RTViewTesteViewController.m
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTViewControllerTeste.h"
#import "RTAppDelegate.h"
#import "RTBancoDeDadosController.h"

@interface RTViewControllerTeste ()
@property (strong, nonatomic) IBOutlet UITextField *texto;
@property (strong, nonatomic) IBOutlet UILabel *retorno;


@end

@implementation RTViewControllerTeste



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    FBLoginView *login=[[FBLoginView alloc]init];
    
    [self.view addSubview:login];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gravar:(id)sender {
    
    NSArray *array = [NSArray arrayWithObjects:@"foi",@"mano", nil];
    
    [RTBancoDeDadosController salvarMusica:10 nome:@"MinhaMusica" notas:array];
    
    [self.texto resignFirstResponder];
}

- (IBAction)verificar:(id)sender {
//    RTAppDelegate *appDelegate =
//    [[UIApplication sharedApplication] delegate];
//    
//    NSManagedObjectContext *context =
//    [appDelegate managedObjectContext];
//    
//    NSEntityDescription *entityDesc =
//    [NSEntityDescription entityForName:@"Musica"
//                inManagedObjectContext:context];
//    
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    [request setEntity:entityDesc];
//    
////    NSPredicate *pred =
////    [NSPredicate predicateWithFormat:@"(nome = %@)",
////     @"MinhaMusica"];
////    [request setPredicate:pred];
//    
//    [request setResultType:NSDictionaryResultType];
//    
//    NSExpression *keyDaExpressao = [NSExpression expressionForKeyPath:@"idmusica"];
//    
//    NSExpression *max = [NSExpression expressionForFunction:@"max:" arguments:[NSArray arrayWithObject:keyDaExpressao]];
//    
//    NSExpressionDescription *descricaoDaExpressao = [[NSExpressionDescription alloc]init];
//    
//    [descricaoDaExpressao setName:@"maxValue"];
//    [descricaoDaExpressao setExpression:max];
//    [descricaoDaExpressao setExpressionResultType:NSInteger64AttributeType];
//    
//    [request setPropertiesToFetch:[NSArray arrayWithObject:descricaoDaExpressao]];
//    
//    
//    NSError *error;
//    NSArray *objects = [context executeFetchRequest:request
//                                              error:&error];
//    
//    if ([objects count] == 0) {
//        [self.retorno setText: @"No matches"];
//    } else {
//        
//        for (int i = 0; i< objects.count; i++) {
//            NSLog(@"Valor maximo: %@",[[objects objectAtIndex:i]valueForKey:@"maxValue"]);
//            //NSLog([objects objectAtIndex:i]valueForKey:@"max"])
//        }
//        
//        [self.retorno setText:[NSString stringWithFormat:
//                        @"%lu matches found", (unsigned long)[objects count]]];
//    }
    
    NSLog(@"%d",[RTBancoDeDadosController ultimaMusica]);
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
