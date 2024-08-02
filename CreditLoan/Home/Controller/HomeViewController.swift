//
//  HomeViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit

class HomeViewController: BaseViewController {
    
    lazy var oneView: HomeOneView = {
        let oneView = HomeOneView()
        return oneView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(oneView)
        oneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeData()
    }

}


extension HomeViewController {
    
    func homeData() {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: [:], pageUrl: "/cll/frontAmple", method: .get) { successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                print("successModel>>>>>>\(successModel.cruelty ?? [:])")
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }

    }
    
}
