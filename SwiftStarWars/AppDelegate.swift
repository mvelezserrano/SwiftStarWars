//
//  AppDelegate.swift
//  SwiftStarWars
//
//  Created by Miguel Angel Vélez Serrano on 11/5/15.
//  Copyright (c) 2015 Miguel Ángel Vélez Serrano. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        
        // Creamos el StarWarsUniverseViewController
        var universe = StarWarsUniverse()
        var univVC = StarWarsUniverseViewController(model: universe)
        var navUniverse = UINavigationController(rootViewController: univVC)

        // Obtenemos, si existe ya, el último personaje seleccionado
        var section : Int?
        var row : Int?
        var lastSelectedCharacter: StarWarsCharacter
        var def: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let section = def.objectForKey("section") as? Int, let row = def.objectForKey("row") as? Int {
            if section == 0 {
                lastSelectedCharacter = universe.imperialAtIndex(row)
            } else {
                lastSelectedCharacter = universe.rebelAtIndex(row)
            }
        } else {
            lastSelectedCharacter = universe.imperialAtIndex(0)
        }
        
        // Creamos el CharacterViewController
        var charVC = CharacterViewController(model: lastSelectedCharacter)
        var navCharacter = UINavigationController(rootViewController: charVC)
        
        // Creamos el SplitViewController
        var splitVC = UISplitViewController()
        splitVC.viewControllers = [navUniverse, navCharacter]
        
        // Asignamos delegados
        univVC.delegate = charVC
        splitVC.delegate = charVC
        
        // Asignarlo como root
        window?.rootViewController = splitVC
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

