//
//  PerPopView.swift
//  CreditLoan
//
//  Created by apple on 2024/7/31.
//

import UIKit

class PerPopView: UIView {

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 3.alpix()
        bgView.backgroundColor = .white
        return bgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(480.alpix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
