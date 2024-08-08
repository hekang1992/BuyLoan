//
//  PLAPhoneConViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/8/6.
//

import UIKit
import HandyJSON

class PLAPhoneConViewController: BaseViewController {

    var productID: String?
    
    lazy var phoneView: PLAPhoneView = {
        let phoneView = PLAPhoneView()
        phoneView.scrollView.isHidden = true
        phoneView.nameLabel.text = "Emergency Contact"
        return phoneView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(phoneView)
        phoneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        phoneView.backBlock = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        phoneInfo()
    }

}

extension PLAPhoneConViewController {
    
    func phoneInfo() {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: ["trapesing": productID ?? "", "yovely": "2"], pageUrl: "/cll/experiencePsalm", method: .post) { [weak self] successModel in
            ViewHud.hideLoadView()
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                guard let model = JSONDeserializer<CrueltyModel>.deserializeFrom(dict: successModel.cruelty) else { return }
                let modelArray = model.smilingly?.reliance
                self?.phoneView.modelArray = modelArray
                self?.phoneView.tableView.reloadData()
            }
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }

    }
    
}
