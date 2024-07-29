//
//  CLNavigationViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit

class CLNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        if #available(iOS 14.0, *) {
            if self.viewControllers.count > 1 {
                self.topViewController?.hidesBottomBarWhenPushed = false
            }
        }
        return super.popToRootViewController(animated: animated)
    }

}
