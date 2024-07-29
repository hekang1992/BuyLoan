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
            let idVc = BBIDViewController()
            self?.navigationController?.pushViewController(idVc, animated: true)
        }
        launchView.block2 = {
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
