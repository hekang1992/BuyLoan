//
//  PLAReqView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/4.
//

import UIKit

class PLAReqView: UIView {

    lazy var titleLabel1: PaddedLabel = {
        let titleLabel1 = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 16.alpix())!, textColor: UIColor(hex: "#B8C0C9"), textAlignment: .left)
        return titleLabel1
    }()
    
    lazy var titleLabel2: PaddedLabel = {
        let titleLabel2 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 14.alpix())!, textColor: UIColor(hex: "#B8C0C9"), textAlignment: .left)
        titleLabel2.numberOfLines = 0
        return titleLabel2
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel1)
        addSubview(titleLabel2)
        titleLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20.alpix())
            make.height.equalTo(21.5.alpix())
        }
        titleLabel2.snp.makeConstraints { make in
            make.top.equalTo(titleLabel1.snp.bottom).offset(5.alpix())
            make.left.equalToSuperview().offset(20.alpix())
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
