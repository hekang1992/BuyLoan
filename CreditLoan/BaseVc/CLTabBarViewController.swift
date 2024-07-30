//
//  CLTabBarViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit

class CLTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVc = HomeViewController()
        let billVc = BillsViewController()
        let gereVc = GeRenViewController()
        setupTabBarController(with: [homeVc, billVc, gereVc])
    }
}

extension CLTabBarViewController {
    
    func setupTabBarController(with viewControllers: [UIViewController]) {
        guard viewControllers.count == 3 else {
            fatalError("You must provide exactly three view controllers.")
        }
        
        let titles = ["Home", "Bills", "Profile"]
        let images = ["Group_nohome", "Group_nobills", "Group_noprofile"]
        let selectedImages = ["Group_home", "Group_bills", "Group_profile"]
        
        var controllers = [UIViewController]()
        
        for (index, viewController) in viewControllers.enumerated() {
            let navController = UINavigationController(rootViewController: viewController)
            let tabBarItem = UITabBarItem(
                title: titles[index],
                image: UIImage(named: images[index])?.withRenderingMode(.alwaysOriginal),
                selectedImage: UIImage(named: selectedImages[index])?.withRenderingMode(.alwaysOriginal)
            )
            tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
            navController.tabBarItem = tabBarItem
            controllers.append(navController)
        }
        
        self.viewControllers = controllers
        
        let anormal = [NSAttributedString.Key.font: UIFont(name: Heavy_Mont, size: 14.alpix()) as Any]
        let aselected = [NSAttributedString.Key.font: UIFont(name: Heavy_Mont, size: 14.alpix()) as Any]
        
        UITabBarItem.appearance().setTitleTextAttributes(anormal, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(aselected, for: .selected)
        
        self.tabBar.tintColor = UIColor(hex: "#2C2C36")
        self.tabBar.unselectedItemTintColor = UIColor(hex: "#B8C0C9")
        self.tabBar.backgroundColor = .white
        self.tabBar.barStyle = .default
    }
    
}
