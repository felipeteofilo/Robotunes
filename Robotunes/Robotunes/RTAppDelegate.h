//
//  RTAppDelegate.h
//  Robotunes
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 16/09/14.
//  Copyright (c) 2014 FELIPE TEOFILO SOUZA SANTOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTViewController.h"
#import "RTViewControllerTeste.h"
//#import <Parse/Parse.h>
//#import <FacebookSDK/FacebookSDK.h>


@interface RTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
