//
//  ProfileView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/7.
//

import UIKit
import RxSwift

class ProfileView: UIView {
    
    let disp = DisposeBag()
    
    var block1: (() -> Void)?
    var block2: (() -> Void)?
    var block3: (() -> Void)?
    var block4: (() -> Void)?
    var block5: (() -> Void)?
    var block6: (() -> Void)?
    var block7: (() -> Void)?
    var block8: (() -> Void)?

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.init(hex: "#F5F5F5")
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var iconbtn: UIButton = {
        let iconbtn = UIButton(type: .custom)
        iconbtn.adjustsImageWhenHighlighted = false
        iconbtn.setBackgroundImage(UIImage(named: "Group_1206"), for: .normal)
        return iconbtn
    }()
    
    lazy var iconImageView1: UIImageView = {
        let iconImageView1 = UIImageView()
        iconImageView1.image = UIImage(named: "Group_1205")
        return iconImageView1
    }()
    
    lazy var phoneLabel: PaddedLabel = {
        let phoneLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 24.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        let phoneNum = UserDefaults.standard.object(forKey: CL_LOGIN) as? String ?? ""
        if !phoneNum.isEmpty {
            phoneLabel.text = "\(phoneNum)"
        }
        return phoneLabel
    }()
    
    lazy var welLabel: PaddedLabel = {
        let welLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#4B4A4F"), textAlignment: .left)
        welLabel.numberOfLines = 0
        welLabel.text = "Welcome to\nCredit Loan"
        return welLabel
    }()
    
    lazy var orderBtn: UIButton = {
        let orderBtn = UIButton(type: .custom)
        orderBtn.adjustsImageWhenHighlighted = false
        orderBtn.setBackgroundImage(UIImage(named: "Group_1197"), for: .normal)
        return orderBtn
    }()
    
    lazy var orderBtn1: UIButton = {
        let orderBtn = UIButton(type: .custom)
        orderBtn.adjustsImageWhenHighlighted = false
        orderBtn.setBackgroundImage(UIImage(named: "Group_1221"), for: .normal)
        return orderBtn
    }()
    
    lazy var orderBtn2: UIButton = {
        let orderBtn = UIButton(type: .custom)
        orderBtn.adjustsImageWhenHighlighted = false
        orderBtn.setBackgroundImage(UIImage(named: "Group_1222"), for: .normal)
        return orderBtn
    }()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.isUserInteractionEnabled = true
        icon.image = UIImage(named: "Group_1220")
        return icon
    }()
    
    lazy var orderBtn4: UIButton = {
        let orderBtn = UIButton(type: .custom)
        return orderBtn
    }()
    
    lazy var orderBtn5: UIButton = {
        let orderBtn = UIButton(type: .custom)
        return orderBtn
    }()
    
    lazy var orderBtn6: UIButton = {
        let orderBtn = UIButton(type: .custom)
        return orderBtn
    }()
    
    lazy var orderBtn7: UIButton = {
        let orderBtn = UIButton(type: .custom)
        return orderBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(iconbtn)
        iconbtn.addSubview(iconImageView1)
        scrollView.addSubview(phoneLabel)
        scrollView.addSubview(welLabel)
        scrollView.addSubview(orderBtn)
        scrollView.addSubview(orderBtn1)
        scrollView.addSubview(orderBtn2)
        scrollView.addSubview(icon)
        icon.addSubview(orderBtn4)
        icon.addSubview(orderBtn5)
        icon.addSubview(orderBtn6)
        icon.addSubview(orderBtn7)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        iconbtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60.alpix())
            make.left.equalToSuperview().offset(20.alpix())
            make.size.equalTo(CGSize(width: 100.alpix(), height: 100.alpix()))
        }
        iconImageView1.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.size.equalTo(CGSize(width: 29.alpix(), height: 29.alpix()))
        }
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(iconbtn.snp.top).offset(12.alpix())
            make.left.equalTo(iconbtn.snp.right).offset(30.alpix())
            make.height.equalTo(32.5.alpix())
        }
        welLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(6.alpix())
            make.left.equalTo(iconbtn.snp.right).offset(30.alpix())
            make.width.equalTo(205.alpix())
        }
        orderBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20.alpix())
            make.height.equalTo(60.alpix())
            make.top.equalTo(iconbtn.snp.bottom).offset(30.alpix())
        }
        orderBtn1.snp.makeConstraints { make in
            make.top.equalTo(orderBtn.snp.bottom).offset(20.alpix())
            make.left.equalToSuperview().offset(20.alpix())
            make.size.equalTo(CGSize(width: 157.5.alpix(), height: 90.5.alpix()))
        }
        orderBtn2.snp.makeConstraints { make in
            make.top.equalTo(orderBtn.snp.bottom).offset(20.alpix())
            make.right.equalTo(orderBtn.snp.right)
            make.size.equalTo(CGSize(width: 157.5.alpix(), height: 90.5.alpix()))
        }
        icon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20.alpix())
            make.top.equalTo(orderBtn2.snp.bottom).offset(20.alpix())
            make.height.equalTo(250.alpix())
            make.bottom.equalToSuperview().offset(-50.alpix())
        }
        orderBtn4.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(61.alpix())
        }
        orderBtn5.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(61.alpix())
            make.top.equalTo(orderBtn4.snp.bottom)
        }
        orderBtn6.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(61.alpix())
            make.top.equalTo(orderBtn5.snp.bottom)
        }
        orderBtn7.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(61.alpix())
            make.bottom.equalToSuperview()
        }
        
        iconbtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block1?()
        }).disposed(by: disp)
        orderBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block2?()
        }).disposed(by: disp)
        orderBtn1.rx.tap.subscribe(onNext: { [weak self] in
            self?.block3?()
        }).disposed(by: disp)
        orderBtn2.rx.tap.subscribe(onNext: { [weak self] in
            self?.block4?()
        }).disposed(by: disp)
        orderBtn4.rx.tap.subscribe(onNext: { [weak self] in
            self?.block5?()
        }).disposed(by: disp)
        orderBtn5.rx.tap.subscribe(onNext: { [weak self] in
            self?.block6?()
        }).disposed(by: disp)
        orderBtn6.rx.tap.subscribe(onNext: { [weak self] in
            self?.block7?()
        }).disposed(by: disp)
        orderBtn7.rx.tap.subscribe(onNext: { [weak self] in
            self?.block8?()
        }).disposed(by: disp)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
