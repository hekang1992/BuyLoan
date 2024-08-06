//
//  PLAInputCell.swift
//  CreditLoan
//
//  Created by apple on 2024/8/6.
//

import UIKit

class PLAInputCell: UITableViewCell {

    lazy var descLabel: UILabel = {
        let descLabel = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        return descLabel
    }()
    
    lazy var nameField: UITextField = {
        let nameField = UITextField()
        nameField.textAlignment = .center
        nameField.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        nameField.textColor = UIColor.init(hex: "#2C2C36")
        nameField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return nameField
    }()
    
    lazy var icon2: UIImageView = {
        let icon2 = UIImageView()
        icon2.isUserInteractionEnabled = true
        icon2.image = UIImage(named: "Group_41")
        return icon2
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(icon2)
        contentView.addSubview(descLabel)
        contentView.addSubview(nameField)
        descLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(21.alpix())
        }
        nameField.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-25.alpix())
            make.top.equalTo(descLabel.snp.bottom).offset(15.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.centerX.equalToSuperview()
        }
        icon2.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-15.alpix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 315.alpix(), height: 78.alpix()))
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: visitingModel? {
        didSet {
            guard let model = model else { return }
            let unless = model.unless ?? ""
            let commanding = model.commanding ?? ""
            descLabel.text = model.interfering ?? ""
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.init(hex: "#DDE2E6"),
                .font: UIFont(name: Heavy_Mont, size: 18.alpix())!
            ]
            nameField.attributedPlaceholder = NSAttributedString(string: model.livers ?? "", attributes: attributes)
            if unless.isEmpty {
                nameField.text = ""
            }else {
                nameField.text = unless
            }
            if commanding == "1" {
                nameField.keyboardType = .numberPad
            }else {
                nameField.keyboardType = .default
            }
        }
    }
    
    @objc func textFieldEditingChanged(_ textField: UITextField) {
        if textField == nameField {
            if let model = model {
                model.unless = nameField.text
            }
        }
    }
    
}
