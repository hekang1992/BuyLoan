//
//  AppDelegate.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    lazy var launchVc: LaunchViewController = {
        let launchVc = LaunchViewController()
        return launchVc
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = BaseNavController(rootViewController: launchVc)
        window?.makeKeyAndVisible()
        return true
    }

}

