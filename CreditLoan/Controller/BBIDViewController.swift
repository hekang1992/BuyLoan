//
//  BBIDViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/22.
//

import UIKit

class BBIDViewController: BaseViewController {
    
    lazy var idView: BBIDView = {
        let idView = BBIDView()
        idView.nameLabel.text = "ID Verification"
        return idView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(idView)
        idView.backBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        idView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
