//
//  PLAPhoneConViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/8/6.
//

import UIKit

class PLAPhoneConViewController: BaseViewController {

    var productID: String?
    
    lazy var phoneView: PLAPersonalView = {
        let phoneView = PLAPersonalView()
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
    }

}
