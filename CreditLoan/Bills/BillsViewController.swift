//
//  BillsViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit
import MBProgressHUD_WJExtension

class BillsViewController: BaseViewController {
    
    lazy var billsView: BillsView = {
        let billsView = BillsView()
        return billsView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(billsView)
        billsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        billsView.block1 = { [weak self] in
            MBProgressHUD.wj_showPlainText("1", view: nil)
        }
        billsView.block2 = { [weak self] in
            MBProgressHUD.wj_showPlainText("2", view: nil)
        }
        billsView.block3 = { [weak self] in
            MBProgressHUD.wj_showPlainText("3", view: nil)
        }
        billsView.block4 = { [weak self] in
            MBProgressHUD.wj_showPlainText("4", view: nil)
        }
        billsView.block5 = { [weak self] in
            MBProgressHUD.wj_showPlainText("5", view: nil)
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
