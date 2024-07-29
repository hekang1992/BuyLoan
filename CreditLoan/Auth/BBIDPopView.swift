//
//  BBIDPopView.swift
//  CreditLoan
//
//  Created by apple on 2024/7/22.
//

import UIKit

class BBIDPopView: UIView {

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.init(hex: "#FFFFFF")
        return bgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 275, height: 400))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension BBIDPopView {
    
    
    
}
