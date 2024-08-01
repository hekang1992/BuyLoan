//
//  LoginViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit
import MBProgressHUD_WJExtension
import HandyJSON

class LoginViewController: BaseViewController {
    
    var totalTime = 60
    
    var phoneStr: String = ""
    
    var countTimer: Timer!
    
    lazy var login: LoginView = {
        let login = LoginView()
        return login
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(login)
        login.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        login.block = { [weak self] btn in
            self?.sendcodeClick(btn)
        }
        login.block1 = { [weak self] btn in
            self?.loginOn()
        }
    }

}

extension LoginViewController {
    
    func sendcodeClick(_ btn: UIButton) {
        ViewHud.addLoadView()
        let phoneDict = ["desolate": self.login.phoneTx.text ?? "", "isLogin": "0"]
        wangluoManager.shared.requestAPI(params: phoneDict, pageUrl: "/cll/canopyMiracles", method: .post) { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                self?.startCode()
            }
            ViewHud.hideLoadView()
            MBProgressHUD.wj_showPlainText(successModel.exile ?? "", view: nil)
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }

    }
    
    func startCode() {
        self.login.sendCodeBtn.isEnabled = false
        countTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if totalTime > 0 {
            totalTime -= 1
            self.login.sendCodeBtn.setTitle("Resend code (\(self.totalTime)s)", for: .normal)
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        countTimer.invalidate()
        self.login.sendCodeBtn.isEnabled = true
        self.login.sendCodeBtn.setTitle("Resend code", for: .normal)
        totalTime = 60
    }
    
    func loginOn() {
        let glazed = self.login.phoneTx.text ?? ""
        let mastery = self.login.codeTx.text ?? ""
        let longest = "1"
        let dict = ["glazed": glazed, "mastery": mastery, "longest": longest]
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: dict, pageUrl: "/cll/whichWhere", method: .post) { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                if let model = JSONDeserializer<LoginModel>.deserializeFrom(dict: successModel.cruelty), let phone = model.glazed, let sess = model.declamation {
                    self?.pushEv()
                    LoginConfig.saveLoginInfo(phone, sess)
                }
            }
            ViewHud.hideLoadView()
            MBProgressHUD.wj_showPlainText(successModel.exile ?? "", view: nil)
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
    func pushEv() {
        let wenVc = WenJuanViewController()
        self.navigationController?.pushViewController(wenVc, animated: true)
    }
    
}
