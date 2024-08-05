//
//  HomeReqCell.swift
//  CreditLoan
//
//  Created by apple on 2024/8/2.
//

import UIKit

class HomeReqCell: UITableViewCell {
    
    var previousView: UIView?
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        return bgView
    }()
    
    lazy var titleLabel: PaddedLabel = {
        let titleLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 16.alpix())!, textColor: UIColor(hex: "#2C2C36"), textAlignment: .left)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "Group_40")
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(titleLabel)
        bgView.addSubview(icon)
        bgView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20.alpix())
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-50.alpix())
            make.left.equalToSuperview().offset(20.alpix())
            make.top.equalToSuperview()
        }
        icon.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 11.alpix(), height: 11.alpix()))
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-23.alpix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: religionModel? {
        didSet {
            guard let model = model else { return }
            titleLabel.text = model.interfering ?? ""
            createViews(for: model.religion!)
        }
    }
    
}

extension HomeReqCell {
    
    func createViews(for items: [religionModel]) {
        for (index, item) in items.enumerated() {
            let view = PLAReqView()
            view.backgroundColor = .random()
            bgView.addSubview(view)
            view.snp.makeConstraints { make in
                if let previous = previousView {
                    make.top.equalTo(previous.snp.bottom).offset(10.alpix())
                } else {
                    make.top.equalTo(titleLabel.snp.bottom).offset(15.alpix())
                }
                make.centerX.equalToSuperview()
                make.left.equalToSuperview().offset(20.alpix())
                make.height.equalTo(10.alpix())
                make.bottom.equalToSuperview()
            }
            previousView = view
        }
        if let lastView = previousView {
            lastView.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-20.alpix())
            }
        }
    }
    
    
}
