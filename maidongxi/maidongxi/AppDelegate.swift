//
//  AppDelegate.swift
//  maidongxi
//
//  Created by Noah_Shan on 2018/9/27.
//  Copyright © 2018 Inspur. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        guard userActivity.activityType == NSStringFromClass(TestIntent.self)  else {
                //os_log("Can't continue unknown NSUserActivity type %@", userActivity.activityType)
                return false
        }
        
        guard let window = window,
            let rootViewController = window.rootViewController as? UINavigationController else {
                //os_log("Failed to access root view controller.")
                return false
        }
        
        restorationHandler(rootViewController.viewControllers)
        
        return true
    }


}

