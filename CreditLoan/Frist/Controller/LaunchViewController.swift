//
//  LaunchViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit
import TYAlertController
import RxSwift
import RxCocoa

class LaunchViewController: BaseViewController {
    
    lazy var launchView: BBLaunchView = {
        let launchView = BBLaunchView()
        return launchView
    }()
    
    lazy var perView: PerPopView = {
        let perView = PerPopView(frame: self.view.bounds)
        return perView
    }()
    
    lazy var outView: LogOutView = {
        let outView = LogOutView(frame: self.view.bounds)
        return outView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(launchView)
        launchView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        launchView.block1 = { [weak self] in
            if IS_LOGIN {
                //go home
                NotificationCenter.default.post(name: NSNotification.Name(HOME_VC), object: nil)
            }else {
                let loginVc = LoginViewController()
                self?.navigationController?.pushViewController(loginVc, animated: true)
            }
            
        }
        launchView.block2 = { [weak self] in
            self?.outPer()
        }
        delayTime.delay(0.5) { [weak self] in
            self?.popPer()
        }
        
    }

}

extension LaunchViewController {
    
    func popPer() {
        let alertVc = TYAlertController(alert: perView, preferredStyle: .alert)
        self.present(alertVc!, animated: true)
        perView.block = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func outPer() {
        let alertVc = TYAlertController(alert: outView, preferredStyle: .alert)
        self.present(alertVc!, animated: true)
        outView.block1 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                exit(0)
            })
        }
        outView.block2 = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
}
