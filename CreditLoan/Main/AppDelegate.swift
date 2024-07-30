//
//  AppDelegate.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit
import IQKeyboardManagerSwift

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
        window?.rootViewController = LoginViewController()
        kkanager()
        window?.makeKeyAndVisible()
        return true
    }

}


extension AppDelegate {
    
    func kkanager(){
        let manager = IQKeyboardManager.shared
        manager.keyboardDistanceFromTextField = 5.alpix()
        manager.shouldResignOnTouchOutside = true
        manager.enable = true
    }
    
}
