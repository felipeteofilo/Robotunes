//
//  RTViewTesteViewController.m
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import "RTViewControllerTeste.h"
#import "RTAppDelegate.h"

@interface RTViewControllerTeste ()
@property (strong, nonatomic) IBOutlet UITextField *texto;
@property (strong, nonatomic) IBOutlet UILabel *retorno;

@end

@implementation RTViewControllerTeste



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"foi");
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gravar:(id)sender {
    
    RTAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Usuario"
                  inManagedObjectContext:context];
    
    [newContact setValue:self.texto.text forKey:@"nome"];
    NSError *error;
    [context save:&error];
    
    [self.texto resignFirstResponder];
}

- (IBAction)verificar:(id)sender {
    RTAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Usuario"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(nome = %@)",
     _texto.text];
    [request setPredicate:pred];
    
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    if ([objects count] == 0) {
        [self.retorno setText: @"No matches"];
    } else {
        
        for (int i = 0; i< objects.count; i++) {
            NSLog([[objects objectAtIndex:i]valueForKey:@"nome"]);
        }
        
        [self.retorno setText:[NSString stringWithFormat:
                        @"%lu matches found", (unsigned long)[objects count]]];
    }
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
