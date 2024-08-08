//
//  BillsView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/8.
//

import UIKit
import RxSwift

class BillsView: UIView {
    
    let disp = DisposeBag()
    
    var block1: (() -> Void)?
    var block2: (() -> Void)?
    var block3: (() -> Void)?
    var block4: (() -> Void)?
    var block5: (() -> Void)?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.init(hex: "#F5F5F5")
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    lazy var icon1: UIImageView = {
        let icon1 = UIImageView()
        icon1.image = UIImage(named: "Group_1223")
        return icon1
    }()
    
    lazy var icon2: UIImageView = {
        let icon2 = UIImageView()
        icon2.isUserInteractionEnabled = true
        icon2.image = UIImage(named: "Frame_12")
        return icon2
    }()
    
    lazy var orderBtn: UIButton = {
        let orderBtn = UIButton(type: .custom)
        orderBtn.adjustsImageWhenHighlighted = false
        orderBtn.setBackgroundImage(UIImage(named: "Group_1197"), for: .normal)
        return orderBtn
    }()
    
    lazy var btn1: UIButton = {
        let btn = UIButton(type: .custom)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton(type: .custom)
        return btn
    }()
    
    lazy var btn3: UIButton = {
        let btn = UIButton(type: .custom)
        return btn
    }()
    
    lazy var btn4: UIButton = {
        let btn = UIButton(type: .custom)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(icon1)
        scrollView.addSubview(icon2)
        scrollView.addSubview(orderBtn)
        icon2.addSubview(btn1)
        icon2.addSubview(btn2)
        icon2.addSubview(btn3)
        icon2.addSubview(btn4)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        icon1.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(112.alpix())
        }
        icon2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(icon1.snp.bottom).offset(20.alpix())
            make.left.equalToSuperview().offset(20.alpix())
            make.height.equalTo(300.alpix())
        }
        orderBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20.alpix())
            make.height.equalTo(60.alpix())
            make.top.equalTo(icon2.snp.bottom).offset(20.alpix())
            make.bottom.equalToSuperview().offset(-50.alpix())
        }
        btn1.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(60.alpix())
        }
        btn2.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(btn1.snp.bottom).offset(20.alpix())
            make.height.equalTo(60.alpix())
        }
        btn3.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(btn2.snp.bottom).offset(20.alpix())
            make.height.equalTo(60.alpix())
        }
        btn4.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(btn3.snp.bottom).offset(20.alpix())
            make.height.equalTo(60.alpix())
        }
        btn1.rx.tap.subscribe(onNext: { [weak self] in
            self?.block1?()
        }).disposed(by: disp)
        btn2.rx.tap.subscribe(onNext: { [weak self] in
            self?.block2?()
        }).disposed(by: disp)
        btn3.rx.tap.subscribe(onNext: { [weak self] in
            self?.block3?()
        }).disposed(by: disp)
        btn4.rx.tap.subscribe(onNext: { [weak self] in
            self?.block4?()
        }).disposed(by: disp)
        orderBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block5?()
        }).disposed(by: disp)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

