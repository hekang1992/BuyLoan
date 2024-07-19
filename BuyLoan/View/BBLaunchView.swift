//
//  BBLaunchView.swift
//  BuyLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit

class BBLaunchView: BBCommonView {

    lazy var descLabel: UILabel = {
        let descLabel = UILabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 40)!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        descLabel.text = "Welcome to\nXXX Loans!"
        descLabel.numberOfLines = 0
        return descLabel
    }()
    
    lazy var descLabel1: UILabel = {
        let descLabel1 = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16)!, textColor: UIColor.init(hex: "#505457"), textAlignment: .left)
        descLabel1.text = "To help you make the most of our app, please complete the following simple new user guide so we can better understand your needs."
        descLabel1.numberOfLines = 0
        return descLabel1
    }()
    
    lazy var startBtn: UIButton = {
        let startBtn = UIButton(type: .custom)
        startBtn.setTitle("Let's get started!", for: .normal)
        startBtn.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        startBtn.layer.cornerRadius = 3
        startBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18)
        startBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        return startBtn
    }()
    
    lazy var notBtn: UIButton = {
        let notBtn = UIButton(type: .custom)
        notBtn.setTitle("Not necessary at the moment", for: .normal)
        notBtn.setTitleColor(UIColor.init(hex: "#B8C0C9"), for: .normal)
        notBtn.layer.cornerRadius = 3
        notBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18)
        notBtn.backgroundColor = UIColor.init(hex: "#F2F3F5")
        return notBtn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollView.addSubview(descLabel)
        scrollView.addSubview(descLabel1)
        scrollView.addSubview(startBtn)
        scrollView.addSubview(notBtn)
        descLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(323)
            make.size.equalTo(CGSize(width: 312, height: 108))
        }
        descLabel1.snp.makeConstraints { make in
            make.left.equalTo(descLabel.snp.left)
            make.top.equalTo(descLabel.snp.bottom).offset(30)
            make.size.equalTo(CGSize(width: 315, height: 84))
        }
        startBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descLabel1.snp.bottom).offset(105)
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
