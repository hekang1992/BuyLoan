//
//  HomeBigCardCell.swift
//  CreditLoan
//
//  Created by apple on 2024/8/2.
//

import UIKit
import Kingfisher

class HomeBigCardCell: UITableViewCell {

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 3.alpix()
        return bgView
    }()

    lazy var bgIcon: UIImageView = {
        let bgIcon = UIImageView()
        return bgIcon
    }()
    
    lazy var applyBtn: UIButton = {
        let applyBtn = UIButton(type: .custom)
        applyBtn.layer.cornerRadius = 3.alpix()
        applyBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        applyBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        return applyBtn
    }()
    
    lazy var descLabel: PaddedLabel = {
        let descLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .right)
        descLabel.numberOfLines = 0
        return descLabel
    }()
    
    lazy var descLabel1: PaddedLabel = {
        let descLabel1 = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#B8C0C9"), textAlignment: .center)
        return descLabel1
    }()
    
    lazy var descLabel2: PaddedLabel = {
        let descLabel2 = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 45.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        return descLabel2
    }()
    
    lazy var descLabel3: PaddedLabel = {
        let descLabel3 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 12.alpix())!, textColor: UIColor.init(hex: "#007CFB"), textAlignment: .center)
        return descLabel3
    }()
    
    lazy var descLabel4: PaddedLabel = {
        let descLabel4 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 12.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        descLabel4.text = "Regulatory Authority"
        return descLabel4
    }()
    
    lazy var jianBtn: UIButton = {
        let jianBtn = UIButton(type: .custom)
        jianBtn.setBackgroundImage(UIImage(named: "Group_1210"), for: .normal)
        return jianBtn
    }()
    
    lazy var addBtn: UIButton = {
        let addBtn = UIButton(type: .custom)
        addBtn.setBackgroundImage(UIImage(named: "Group_1211"), for: .normal)
        return addBtn
    }()
    
    lazy var bgIcon1: UIImageView = {
        let bgIcon1 = UIImageView()
        return bgIcon1
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(bgIcon)
        bgView.addSubview(applyBtn)
        bgIcon.addSubview(descLabel)
        bgIcon.addSubview(descLabel1)
        bgIcon.addSubview(descLabel2)
        bgIcon.addSubview(descLabel3)
        bgIcon.addSubview(descLabel4)
        bgIcon.addSubview(jianBtn)
        bgIcon.addSubview(addBtn)
        bgView.addSubview(bgIcon1)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20.alpix(), bottom: 0, right: 20.alpix()))
        }
        bgIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5.alpix())
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(5.alpix())
            make.height.equalTo(331.alpix())
        }
        applyBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon.snp.bottom).offset(15.alpix())
            make.left.equalToSuperview().offset(20.alpix())
            make.height.equalTo(60.alpix())
        }
        descLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25.alpix())
            make.right.equalToSuperview().offset(-30.alpix())
            make.width.equalTo(187.alpix())
        }
        descLabel1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(121.alpix())
            make.height.equalTo(16.alpix())
        }
        descLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descLabel1.snp.bottom)
            make.height.equalTo(60.5.alpix())
        }
        descLabel3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descLabel2.snp.bottom).offset(43.alpix())
            make.height.equalTo(15.5.alpix())
        }
        jianBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-15.alpix())
            make.left.equalToSuperview().offset(15.alpix())
            make.size.equalTo(CGSize(width: 143.alpix(), height: 50.alpix()))
        }
        addBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-15.alpix())
            make.right.equalToSuperview().offset(-15.alpix())
            make.size.equalTo(CGSize(width: 143.alpix(), height: 50.alpix()))
        }
        descLabel4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20.alpix())
            make.top.equalTo(applyBtn.snp.bottom).offset(30.alpix())
            make.height.equalTo(21.alpix())
        }
        bgIcon1.snp.makeConstraints { make in
            make.top.equalTo(descLabel4.snp.bottom).offset(20.alpix())
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20.alpix())
            make.height.equalTo(113.5.alpix())
            make.bottom.equalToSuperview().offset(-30.alpix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: religionModel? {
        didSet {
            guard let model = model else { return }
            applyBtn.setTitle(model.literature ?? "", for: .normal)
            bgIcon.kf.setImage(with: URL(string: model.mai ?? ""))
            descLabel.text = model.visitor ?? ""
            descLabel1.text = "\(model.suspicions ?? "")(\(model.pitied ?? ""))"
            descLabel2.text = model.harvest ?? ""
            descLabel3.text = model.summer ?? ""
            bgIcon1.kf.setImage(with: URL(string: model.cred ?? ""))
        }
    }
    
}

extension HomeBigCardCell {
    
}
