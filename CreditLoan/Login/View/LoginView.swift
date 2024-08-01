//
//  LoginView.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit
import MBProgressHUD_WJExtension

typealias sendCodeBlock = ((UIButton) -> Void)
class LoginView: BBCommonView {
    
    var block: sendCodeBlock?
    
    var block1: sendCodeBlock?
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "AppIcon")
        return icon
    }()
    
    lazy var phoneView: UIView = {
        let phoneView = UIView()
        phoneView.backgroundColor = UIColor.init(hex: "#EEF3FF")
        phoneView.layer.cornerRadius = 3.alpix()
        return phoneView
    }()
    
    lazy var clabel: UILabel = {
        let clabel = UILabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        clabel.text = "+63"
        return clabel
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(hex: "#2C2C36")
        return lineView
    }()
    
    lazy var rightView: UIView = {
        let rightImageView = UIImageView(frame: CGRectMake(5.alpix(), 19.alpix(), 22.alpix(), 22.alpix()))
        rightImageView.image = UIImage(named: "Group_cancel")
        rightImageView.contentMode = .center
        rightImageView.isUserInteractionEnabled = true
        let rightView = UIView(frame: CGRectMake(0, 0, 40.alpix(), 60.alpix()))
        rightView.addSubview(rightImageView)
        rightView.isHidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(delTapped))
        rightImageView.addGestureRecognizer(tapGesture)
        return rightView
    }()
    
    lazy var phoneTx: NoCopyField = {
        let phoneTx = NoCopyField()
        phoneTx.keyboardType = .numberPad
        let attrString = NSMutableAttributedString(string: "Phone Number", attributes: [
            .foregroundColor: UIColor.init(hex: "#B8C0C9") as Any,
            .font: UIFont(name: Heavy_Mont, size: 18.alpix())!
        ])
        phoneTx.attributedPlaceholder = attrString
        phoneTx.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        phoneTx.textColor = UIColor.init(hex: "#2C2C36")
        phoneTx.rightView = rightView
        phoneTx.rightViewMode = .always
        phoneTx.text = "1243214"
        return phoneTx
    }()
    
    lazy var codeView: UIView = {
        let codeView = UIView()
        codeView.backgroundColor = UIColor.init(hex: "#EEF3FF")
        codeView.layer.cornerRadius = 3.alpix()
        return codeView
    }()
    
    lazy var codeTx: NoCopyField = {
        let codeTx = NoCopyField()
        codeTx.keyboardType = .numberPad
        let attrString = NSMutableAttributedString(string: "verification code", attributes: [
            .foregroundColor: UIColor.init(hex: "#B8C0C9") as Any,
            .font: UIFont(name: Heavy_Mont, size: 18.alpix())!
        ])
        codeTx.textAlignment = .center
        codeTx.attributedPlaceholder = attrString
        codeTx.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        codeTx.textColor = UIColor.init(hex: "#2C2C36")
        codeTx.text = "912911"
        return codeTx
    }()
    
    lazy var sureBtn: UIButton = {
        let sureBtn = UIButton(type: .custom)
        sureBtn.setBackgroundImage(UIImage(named: "Group_yinying"), for: .normal)
        
        return sureBtn
    }()
    
    lazy var miaosLabel: UILabel = {
        let miaosLabel = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 12.alpix())!, textColor: UIColor.init(hex: "#1C200D"), textAlignment: .left)
        miaosLabel.numberOfLines = 0
        miaosLabel.isUserInteractionEnabled = true
        let attributedText = NSMutableAttributedString(string: "Logging in signifies your acceptance of the ")
        let userAgreement = NSMutableAttributedString(string: "Privacy Policy", attributes: [
            .foregroundColor: UIColor.init(hex: "#007CFB"),
        ])
        attributedText.append(userAgreement)
        miaosLabel.attributedText = attributedText
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userTapped))
        miaosLabel.addGestureRecognizer(tapGesture)
        return miaosLabel
    }()
    
    lazy var sendCodeBtn: UIButton = {
        let sendCodeBtn = UIButton(type: .custom)
        sendCodeBtn.layer.cornerRadius = 3.alpix()
        sendCodeBtn.layer.borderWidth = 2.alpix()
        sendCodeBtn.layer.borderColor = UIColor.init(hex: "#007CFB").cgColor
        sendCodeBtn.setTitleColor(UIColor.init(hex: "#007CFB"), for: .normal)
        sendCodeBtn.backgroundColor = UIColor.init(hex: "#F9FAFE")
        sendCodeBtn.setTitle("Send Code", for: .normal)
        sendCodeBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        return sendCodeBtn
    }()
    
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(type: .custom)
        loginBtn.layer.cornerRadius = 3.alpix()
        loginBtn.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        loginBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        loginBtn.setTitle("LOGIN", for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        return loginBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension LoginView {
    
    func setUI() {
        whiteView.backgroundColor = UIColor.init(hex: "#F9FAFE")
        scrollView.backgroundColor = UIColor.init(hex: "#F9FAFE")
        backBtn.isHidden = true
        scrollView.addSubview(icon)
        scrollView.addSubview(phoneView)
        phoneView.addSubview(clabel)
        phoneView.addSubview(lineView)
        phoneView.addSubview(phoneTx)
        scrollView.addSubview(codeView)
        codeView.addSubview(codeTx)
        scrollView.addSubview(sureBtn)
        scrollView.addSubview(miaosLabel)
        scrollView.addSubview(sendCodeBtn)
        scrollView.addSubview(loginBtn)
        
        icon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(88.alpix())
            make.size.equalTo(CGSize(width: 70.alpix(), height: 70.alpix()))
        }
        phoneView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(icon.snp.bottom).offset(86.5.alpix())
            make.size.equalTo(CGSize(width: 315.alpix(), height: 60.alpix()))
        }
        clabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(25.alpix())
            make.height.equalTo(24.5.alpix())
        }
        lineView.snp.makeConstraints { make in
            make.left.equalTo(clabel.snp.right).offset(15.alpix())
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 2.alpix(), height: 13.alpix()))
        }
        phoneTx.snp.makeConstraints { make in
            make.left.equalTo(lineView.snp.right).offset(15.alpix())
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-10.alpix())
        }
        codeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneView.snp.bottom).offset(20.alpix())
            make.size.equalTo(CGSize(width: 315.alpix(), height: 60.alpix()))
        }
        codeTx.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        sureBtn.snp.makeConstraints { make in
            make.top.equalTo(codeView.snp.bottom).offset(60.alpix())
            make.left.equalToSuperview().offset(36.alpix())
            make.size.equalTo(CGSize(width: 18.alpix(), height: 18.alpix()))
        }
        miaosLabel.snp.makeConstraints { make in
            make.top.equalTo(sureBtn.snp.top)
            make.left.equalTo(sureBtn.snp.right).offset(14.alpix())
            make.width.equalTo(281.alpix())
        }
        sendCodeBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(30.alpix())
            make.top.equalTo(miaosLabel.snp.bottom).offset(22.5.alpix())
            make.height.equalTo(60.alpix())
        }
        loginBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(30.alpix())
            make.top.equalTo(sendCodeBtn.snp.bottom).offset(12.alpix())
            make.height.equalTo(60.alpix())
            make.bottom.equalToSuperview().offset(-50.alpix())
        }
        phoneTx.rx.text.orEmpty
            .distinctUntilChanged()
            .map { $0.prefix(10) }
            .subscribe(onNext: { [weak self] value in
                if let self = self {
                    self.phoneTx.text = String(value)
                    self.rightView.isHidden = value.count == 0
                    if value.count == 10 {
                        self.phoneTx.resignFirstResponder()
                    }
                }
            }).disposed(by: disposeBag)
        codeTx.rx.text.orEmpty
            .distinctUntilChanged()
            .map { $0.prefix(6) }
            .subscribe(onNext: { [weak self] value in
                if let self = self {
                    self.codeTx.text = String(value)
                    if value.count == 6 {
                        self.codeTx.resignFirstResponder()
                    }
                }
            }).disposed(by: disposeBag)
        sendCodeBtn.rx.tap.subscribe(onNext: { [weak self] in
            if let self = self {
                if self.phoneTx.text?.count != 0 {
                    self.block?(self.sendCodeBtn)
                }else {
                    MBProgressHUD.wj_showPlainText("Please enter your phone number", view: nil)
                }
            }
        }).disposed(by: disposeBag)
        sureBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.sureBtn.isSelected.toggle()
            let imageName = self.sureBtn.isSelected ? "Group_yinyingxuanz" : "Group_yinying"
            self.sureBtn.setBackgroundImage(UIImage(named: imageName), for: .normal)
        }).disposed(by: disposeBag)
        loginBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                guard self.sureBtn.isSelected else {
                    MBProgressHUD.wj_showPlainText("Please take a moment to thoroughly review the privacy agreement before login", view: nil)
                    return
                }
                guard let codeText = self.codeTx.text, !codeText.isEmpty else {
                    MBProgressHUD.wj_showPlainText("Please enter your verification code", view: nil)
                    return
                }
                self.block1?(self.loginBtn)
            })
            .disposed(by: disposeBag)
    }
    
    @objc func delTapped() {
        phoneTx.text = ""
        rightView.isHidden = true
    }
    
    @objc func userTapped() {
        MBProgressHUD.wj_showPlainText("隐私协议", view: nil)
    }
    
}
