//
//  BaseNavController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/22.
//

import UIKit

class BaseNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.isHidden = true
        self.navigationBar.isTranslucent = false
        self.interactivePopGestureRecognizer?.isEnabled = false
    }

}
