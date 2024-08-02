//
//  HomeOneView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/2.
//

import UIKit

class HomeOneView: UIView {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.init(hex: "#2C2C36")
        return bgView
    }()

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "Sliceonebg")
        return bgImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(bgImageView)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bgImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(88.alpix())
            make.size.equalTo(CGSize(width: 335.alpix(), height: 118.alpix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
