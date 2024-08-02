//
//  HomeViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit
import HandyJSON

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
        wangluoManager.shared.requestAPI(params: [:], pageUrl: "/cll/frontAmple", method: .get) { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                if let model = JSONDeserializer<CrueltyModel>.deserializeFrom(dict: successModel.cruelty) {
                    self?.oneView.bannerModel = model.feminine
                    self?.oneView.bigCardModel = model.surmises
                    self?.oneView.reqModel = model.lilyvi
                    self?.oneView.tableView.reloadData()
                }
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }

    }
    
}
