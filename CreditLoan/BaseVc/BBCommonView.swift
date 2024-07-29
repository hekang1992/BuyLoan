//
//  BBCommonView.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit
import SnapKit

class BBCommonView: UIView {
    
    var backBlock: (() -> Void)?

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.init(hex: "#C5D7FB")
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var whiteView: UIView = {
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        return whiteView
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "backicon"), for: .normal)
        backBtn.adjustsImageWhenHighlighted = false
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        return backBtn
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 18)!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        addSubview(whiteView)
        whiteView.addSubview(nameLabel)
        whiteView.addSubview(backBtn)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        whiteView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(88)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(24)
            make.width.equalTo(220)
        }
        backBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 22, height: 22))
            make.left.equalToSuperview().offset(20)
            make.centerY.equalTo(nameLabel.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension BBCommonView {
    
    @objc func backBtnClick() {
        self.backBlock?()
    }
    
}
