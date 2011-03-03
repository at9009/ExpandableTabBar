//
//  ExpandableTabBarAppDelegate.m
//
//  Created by Brendan Dixon on 2/14/11.
//  Copyright 2011 cultured inspiration. All rights reserved.
//

#import "ExpandableTabBarAppDelegate.h"
#import "CiColorController.h"
#import "CiExpandableTabBarController.h"

@implementation ExpandableTabBarAppDelegate

#pragma mark - Properties
@synthesize window=_window;


#pragma mark - Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // TODO:
  // - Is this code better executed in awakeFromNib?
  // - Create controllers as determined by preferences, one per section in a loop
  // - Move code into notification handler for when preferences change?

  NSMutableArray* viewControllers = [[NSMutableArray alloc] init];
  UIViewController* controller;
  
  NSArray* names = [NSArray arrayWithObjects:@"Red", @"Green", @"Blue", @"Orange", @"Yellow", nil];
  NSArray* colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor], nil];
  NSArray* images = [NSArray arrayWithObjects:@"Airplane.png", @"Bookmark.png", @"Breifcase.png", @"Chat.png", @"Clock.png", nil];
  for (NSUInteger i=0; i < 100; i++) {
    controller = [[CiColorController alloc] init];
    [viewControllers addObject:controller];

    ((CiColorController*)controller).color = [colors objectAtIndex:(i % [colors count])];

    UIImage* image = [UIImage imageNamed:[images objectAtIndex:(i % [images count])]];
    UITabBarItem* tabBarItem = [[UITabBarItem alloc] initWithTitle:[names objectAtIndex:(i % [names count])] image:image tag:0];
    
    [controller setTabBarItem:tabBarItem];
    [tabBarItem release];
    [controller release];
  }

  controller = [[CiExpandableTabBarController alloc] initWithViewControllers:viewControllers];
  self.window.rootViewController = controller;

  [controller release];
  [viewControllers release];

  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end