//
//  PLAPhoneCell.swift
//  CreditLoan
//
//  Created by apple on 2024/8/8.
//

import UIKit

class PLAPhoneCell: UITableViewCell {

    lazy var titleLabel: PaddedLabel = {
        let titleLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        return titleLabel
    }()
    
    lazy var bgimageView: UIImageView = {
        let bgimageView = UIImageView()
        bgimageView.image = UIImage(named: "Group_1226")
        return bgimageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bgimageView)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(21.alpix())
        }
        bgimageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(155.alpix())
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: reliancemodel? {
        didSet {
            guard let model = model else { return }
            titleLabel.text = model.installation ?? ""
        }
    }
    
}
