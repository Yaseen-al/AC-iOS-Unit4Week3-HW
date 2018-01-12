//
//  AppDelegate.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q  on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {let cellSpacing: CGFloat = 12
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //setUp the viewHirarchy
        //1. setupWindow
        window = UIWindow(frame: UIScreen.main.bounds)
        //2. setup the root controller
        let weatherViewController = WeatherViewController()
        // this is how to add a name and image for the controller of a tabBar
        let weatherTabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "magnifier"), tag: 1)
        // adding the tabBarItem to the weather controller
        weatherViewController.tabBarItem = weatherTabBarItem
        // adding the tabBarItem to the favoriteController
        let favoriteViewController = FavoriteViewController()
        let favoriteTabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "downloads"), tag: 1)
        favoriteViewController.tabBarItem = favoriteTabBarItem
        
        // adding the tabBarItem to the mapView Controller
        let mapViewController = MapViewController()
        let mapViewControllerItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "map"), tag: 1)
        let mapViewControllerNavigation = UINavigationController(rootViewController: mapViewController)
        mapViewController.tabBarItem = mapViewControllerItem
        // add a navigation controller
        let weatherNavigationController = UINavigationController(rootViewController: weatherViewController)
        //add a tabBarController
        let tabController = UITabBarController()
        tabController.setViewControllers([weatherNavigationController,mapViewControllerNavigation, favoriteViewController], animated: true)
        window?.rootViewController = tabController
        //3. present it by make it  appear on the screen
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

