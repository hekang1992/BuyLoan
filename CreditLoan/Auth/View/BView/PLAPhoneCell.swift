//
//  PLAPhoneCell.swift
//  CreditLoan
//
//  Created by apple on 2024/8/8.
//

import UIKit
import RxSwift

class PLAPhoneCell: UITableViewCell {
    
    let disp = DisposeBag()
    
    var block1: ((UIButton) -> Void)?
    
    var block2: ((UIButton) -> Void)?

    lazy var titleLabel: PaddedLabel = {
        let titleLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        return titleLabel
    }()
    
    lazy var bgimageView: UIImageView = {
        let bgimageView = UIImageView()
        bgimageView.isUserInteractionEnabled = true
        bgimageView.image = UIImage(named: "Group_1226")
        return bgimageView
    }()
    
    lazy var btn1: UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.contentHorizontalAlignment = .left
        btn1.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30.alpix(), bottom: 0, right: 0)
        btn1.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        btn1.setTitleColor(UIColor.init(hex: "#B8C0C9"), for: .normal)
        btn1.setTitle("Relationship", for: .normal)
        return btn1
    }()
    
    lazy var nameLabel: PaddedLabel = {
        let nameLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#B8C0C9"), textAlignment: .left)
        nameLabel.text = "Name"
        nameLabel.textInsets = UIEdgeInsets(top: 0, left: 30.alpix(), bottom: 0, right: 0)
        return nameLabel
    }()
    
    lazy var pLabel: PaddedLabel = {
        let pLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 14.alpix())!, textColor: UIColor.init(hex: "#B8C0C9"), textAlignment: .left)
        pLabel.text = "+63 123 456 7890"
        pLabel.textInsets = UIEdgeInsets(top: 0, left: 30.alpix(), bottom: 0, right: 0)
        return pLabel
    }()
    
    lazy var btn2: UIButton = {
        let btn2 = UIButton(type: .custom)
        return btn2
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bgimageView)
        bgimageView.addSubview(btn1)
        bgimageView.addSubview(nameLabel)
        bgimageView.addSubview(pLabel)
        bgimageView.addSubview(btn2)
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
        btn1.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(60.alpix())
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(88.alpix())
            make.height.equalTo(24.5.alpix())
        }
        pLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(6.alpix())
            make.height.equalTo(19.alpix())
        }
        btn2.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(80.alpix())
        }
        
        btn1.rx.tap.subscribe(onNext: { [weak self] in
            if let self = self {
                self.block1?(self.btn1)
            }
        }).disposed(by: disp)
        
        btn2.rx.tap.subscribe(onNext: { [weak self] in
            if let self = self {
                self.block2?(self.btn2)
            }
        }).disposed(by: disp)
        
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
