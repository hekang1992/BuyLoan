//
//  GeRenViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit
import MBProgressHUD_WJExtension

class GeRenViewController: BaseViewController {
    
    lazy var profileView: ProfileView = {
        let profileView = ProfileView()
        return profileView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        profileView.block1 = {
            MBProgressHUD.wj_showPlainText("1", view: nil)
        }
        profileView.block2 = {
            MBProgressHUD.wj_showPlainText("2", view: nil)
        }
        profileView.block3 = {
            MBProgressHUD.wj_showPlainText("3", view: nil)
        }
        profileView.block4 = {
            MBProgressHUD.wj_showPlainText("4", view: nil)
        }
        profileView.block5 = {
            MBProgressHUD.wj_showPlainText("5", view: nil)
        }
        profileView.block6 = {
            MBProgressHUD.wj_showPlainText("6", view: nil)
        }
        profileView.block7 = {
            MBProgressHUD.wj_showPlainText("7", view: nil)
        }
        profileView.block8 = {
            MBProgressHUD.wj_showPlainText("8", view: nil)
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
