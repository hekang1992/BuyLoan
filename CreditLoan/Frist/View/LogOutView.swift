//
//  LogOutView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/1.
//

import UIKit
import RxSwift

class LogOutView: UIView {

    var block1: (() -> Void)?
    
    var block2: (() -> Void)?
    
    let dis = DisposeBag()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 3.alpix()
        return bgView
    }()
    
    lazy var descLabel: PaddedLabel = {
        let descLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 18.alpix())!, textColor: UIColor(hex: "#2C2C36"), textAlignment: .left)
        descLabel.text = "Exit the app"
        return descLabel
    }()
    
    lazy var descLabel1: PaddedLabel = {
        let descLabel1 = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 20.alpix())!, textColor: UIColor(hex: "#2C2C36"), textAlignment: .left)
        descLabel1.numberOfLines = 0
        descLabel1.text = "Are you sure you want to exit the app?"
        return descLabel1
    }()
    
    lazy var outBtn: UIButton = {
        let outBtn = UIButton(type: .custom)
        outBtn.setTitle("Sure", for: .normal)
        outBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        outBtn.setTitleColor(UIColor.init(hex: "#B8C0C9"), for: .normal)
        outBtn.backgroundColor = UIColor(hex: "#F2F3F5")
        return outBtn
    }()
    
    lazy var canBtn: UIButton = {
        let canBtn = UIButton(type: .custom)
        canBtn.setTitle("Cancel", for: .normal)
        canBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        canBtn.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        canBtn.backgroundColor = UIColor(hex: "#007CFB")
        return canBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(descLabel)
        bgView.addSubview(descLabel1)
        bgView.addSubview(outBtn)
        bgView.addSubview(canBtn)
        bgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 315.alpix(), height: 257.alpix()))
        }
        descLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(23.5.alpix())
        }
        descLabel1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30.alpix())
            make.top.equalTo(descLabel.snp.bottom).offset(30.alpix())
            make.centerX.equalToSuperview()
        }
        outBtn.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview()
            make.height.equalTo(60.alpix())
            make.right.equalTo(bgView.snp.centerX)
        }
        canBtn.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview()
            make.height.equalTo(60.alpix())
            make.left.equalTo(bgView.snp.centerX)
        }
        outBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block1?()
        }).disposed(by: dis)
        canBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block2?()
        }).disposed(by: dis)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
