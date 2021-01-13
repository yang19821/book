//
//  SceneDelegate.m
//  notePod
//
//  Created by Choice on 2021/1/12.
//

#import "SceneDelegate.h"
#import "userViewController.h"
#import "homePageViewController.h"
#import "tubiaoViewController.h"
#import "rijiViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    //home
    homePageViewController *homeVc = [[homePageViewController alloc] init];
    homeVc.title = @"主页";
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVc];
    UIImage *homeImage = [UIImage imageNamed:@"home"];
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:homeImage selectedImage:homeImage];
    homeVc.tabBarItem = homeItem;
    //图表
    tubiaoViewController *tubiaoVC = [[tubiaoViewController alloc] init];
    tubiaoVC.title = @"图表";
    UINavigationController *tubiaoNav = [[UINavigationController alloc] initWithRootViewController:tubiaoVC];
    UITabBarItem *tubiaoItem = [[UITabBarItem alloc] initWithTitle:@"图表" image:[UIImage imageNamed:@"tubiao"] selectedImage:[UIImage imageNamed:@"tubiao"]];
    tubiaoNav.tabBarItem = tubiaoItem;
    //日记
    rijiViewController *rijiVC = [[rijiViewController alloc] init];
    rijiVC.title = @"每日一记";
    UINavigationController *rijiNav = [[UINavigationController alloc] initWithRootViewController:rijiVC];
    UITabBarItem *rijiItem = [[UITabBarItem alloc] initWithTitle:@"日记" image:[UIImage imageNamed:@"riji"] selectedImage:[UIImage imageNamed:@"riji"]];
    rijiNav.tabBarItem = rijiItem;
    //我的
    userViewController *mineVC = [[userViewController alloc] init];
    mineVC.title = @"个人中心";
    UINavigationController *userNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    UITabBarItem *mineItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"user"] selectedImage:[UIImage imageNamed:@"user"]];
    userNav.tabBarItem = mineItem;
    
    //定制tabbar
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = @[homeNav,tubiaoNav,rijiNav,userNav];
    tabbar.selectedViewController = homeNav;
    tabbar.tabBar.tintColor = [UIColor colorWithRed:31/255.0 green:185/255.0 blue:34/255.0 alpha:1.0];//文字颜色
    tabbar.tabBar.barTintColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];//底部tabbar的背景颜色
    //window
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
  
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
