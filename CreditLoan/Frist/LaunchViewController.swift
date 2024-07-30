//
//  LaunchViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit
import TYAlertController

class LaunchViewController: BaseViewController {
    
    lazy var launchView: BBLaunchView = {
        let launchView = BBLaunchView()
        return launchView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(launchView)
        launchView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        launchView.block1 = { [weak self] in
            let loginVc = LoginViewController()
            self?.navigationController?.pushViewController(loginVc, animated: true)
        }
        launchView.block2 = {
            exit(0)
        }
        
    }

}

extension LaunchViewController {
    
    
    
}
