//
//  BBLaunchView.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit

class BBLaunchView: BBCommonView {
    
    var block1: (() -> Void)?
    
    var block2: (() -> Void)?
    
    lazy var yellowView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.init(hex: "#FBDD01")
        return yellowView
    }()
    
    lazy var welLabel: UILabel = {
        let welLabel = UILabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 40)!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        welLabel.text = "Welcome to"
        return welLabel
    }()

    lazy var descLabel: UILabel = {
        let descLabel = UILabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 40)!, textColor: UIColor.init(hex: "#007CFB"), textAlignment: .left)
        descLabel.text = "Credit Loan!"
        return descLabel
    }()
    
    lazy var descLabel1: UILabel = {
        let descLabel1 = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16)!, textColor: UIColor.init(hex: "#505457"), textAlignment: .left)
        descLabel1.text = "To help you make the most of our app, please complete the following simple new user guide so we can better understand your needs."
        descLabel1.numberOfLines = 0
        return descLabel1
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "Group_1157")
        return bgImageView
    }()
    
    lazy var startBtn: UIButton = {
        let startBtn = UIButton(type: .custom)
        startBtn.setTitle("Let's get started!", for: .normal)
        startBtn.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        startBtn.layer.cornerRadius = 3
        startBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18)
        startBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        startBtn.addTarget(self, action: #selector(startBtnClick), for: .touchUpInside)
        return startBtn
    }()
    
    lazy var notBtn: UIButton = {
        let notBtn = UIButton(type: .custom)
        notBtn.setTitle("Not necessary at the moment", for: .normal)
        notBtn.setTitleColor(UIColor.init(hex: "#B8C0C9"), for: .normal)
        notBtn.layer.cornerRadius = 3
        notBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18)
        notBtn.backgroundColor = UIColor.init(hex: "#F2F3F5")
        notBtn.addTarget(self, action: #selector(notBtnClick), for: .touchUpInside)
        return notBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backBtn.isHidden = true
        whiteView.isHidden = true
        scrollView.addSubview(yellowView)
        scrollView.addSubview(welLabel)
        scrollView.addSubview(descLabel)
        scrollView.addSubview(descLabel1)
        scrollView.addSubview(bgImageView)
        scrollView.addSubview(startBtn)
        scrollView.addSubview(notBtn)
        yellowView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(195.5)
            make.size.equalTo(CGSize(width: 253, height: 12))
        }
        welLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.bottom.equalTo(yellowView.snp.top).offset(12)
            make.width.equalTo(312)
            make.height.equalTo(41.5)
        }
        descLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(welLabel.snp.bottom).offset(10)
            make.width.equalTo(312)
            make.height.equalTo(41.5)
        }
        descLabel1.snp.makeConstraints { make in
            make.left.equalTo(descLabel.snp.left)
            make.top.equalTo(descLabel.snp.bottom).offset(30)
            make.size.equalTo(CGSize(width: 315, height: 84))
        }
        bgImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(descLabel1.snp.bottom).offset(29)
            make.size.equalTo(CGSize(width: 256, height: 197))
        }
        startBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgImageView.snp.bottom).offset(52)
            make.left.equalToSuperview().offset(30)
            make.height.equalTo(60)
        }
        notBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(startBtn.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(30)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-60)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension BBLaunchView {
    
    @objc func startBtnClick() {
        self.block1?()
    }
    
    @objc func notBtnClick() {
        self.block2?()
    }
    
}
