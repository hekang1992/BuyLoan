//
//  LoginViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit

class LoginViewController: BaseViewController {
    
    var totalTime = 60
    
    var phoneStr: String = ""
    
    var countdownTimer: Timer!
    
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
    }

}

extension LoginViewController {
    
    func sendcodeClick(_ btn: UIButton) {
        startTimer()
    }
    
    func startTimer() {
        self.login.sendCodeBtn.isEnabled = false
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
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
        countdownTimer.invalidate()
        self.login.sendCodeBtn.isEnabled = true
        self.login.sendCodeBtn.setTitle("Resend code", for: .normal)
        totalTime = 60
    }
    
}
