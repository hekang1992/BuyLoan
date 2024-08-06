//
//  PopSuccessView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/5.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class PopSuccessView: UIView {
    
    let disp = DisposeBag()
    
    var block: (() -> Void)?
    
    var block1: (() -> Void)?
    
    var model: CrueltyModel? {
        didSet {
            icon.kf.setImage(with: URL(string: model?.dagged ?? ""))
            nameField.text = model?.faults ?? ""
            nameField1.text = model?.vocation ?? ""
            dateBtn.setTitle(model?.havin ?? "", for: .normal)
        }
    }
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 6.alpix()
        icon.image = UIImage(named: "common")
        return icon
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        return bgView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.init(hex: "#FFFFFF")
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var icon1: UIImageView = {
        let icon1 = UIImageView()
        icon1.isUserInteractionEnabled = true
        icon1.image = UIImage(named: "Group_44")
        return icon1
    }()
    
    lazy var descLabel: UILabel = {
        let descLabel = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        descLabel.text = "Name"
        return descLabel
    }()
    
    lazy var nameField: UITextField = {
        let nameField = UITextField()
        nameField.textAlignment = .center
        nameField.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        nameField.textColor = UIColor.init(hex: "#2C2C36")
        return nameField
    }()
    
    lazy var icon2: UIImageView = {
        let icon2 = UIImageView()
        icon2.isUserInteractionEnabled = true
        icon2.image = UIImage(named: "Group_44")
        return icon2
    }()
    
    lazy var descLabel1: UILabel = {
        let descLabel = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        descLabel.text = "Number"
        return descLabel
    }()
    
    lazy var nameField1: UITextField = {
        let nameField = UITextField()
        nameField.textAlignment = .center
        nameField.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        nameField.textColor = UIColor.init(hex: "#2C2C36")
        return nameField
    }()
    
    lazy var icon3: UIImageView = {
        let icon3 = UIImageView()
        icon3.isUserInteractionEnabled = true
        icon3.image = UIImage(named: "Group_44")
        return icon3
    }()
    
    lazy var descLabel2: UILabel = {
        let descLabel = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        descLabel.text = "Date"
        return descLabel
    }()
    
    lazy var dateBtn: UIButton = {
        let dateBtn = UIButton(type: .custom)
        dateBtn.setTitleColor(UIColor.init(hex: "#2C2C36"), for: .normal)
        dateBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        return dateBtn
    }()
    
    lazy var confirmBtn: UIButton = {
        let confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        confirmBtn.setTitle("Confirm", for: .normal)
        confirmBtn.setTitleColor(.white, for: .normal)
        confirmBtn.layer.cornerRadius = 3.alpix()
        confirmBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        return confirmBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(icon)
        bgView.addSubview(scrollView)
        scrollView.addSubview(icon1)
        icon1.addSubview(descLabel)
        icon1.addSubview(nameField)
        scrollView.addSubview(icon2)
        icon2.addSubview(descLabel1)
        icon2.addSubview(nameField1)
        scrollView.addSubview(icon3)
        icon3.addSubview(descLabel2)
        icon3.addSubview(dateBtn)
        scrollView.addSubview(confirmBtn)
        bgView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(500.alpix())
        }
        icon.snp.makeConstraints { make in
            make.top.equalTo(bgView.snp.top).offset(-40.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.size.equalTo(CGSize(width: 200.alpix(), height: 116.alpix()))
        }
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(100.alpix())
        }
        icon1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 315.alpix(), height: 78.alpix()))
        }
        descLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalTo(21.alpix())
        }
        nameField.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10.alpix())
            make.top.equalTo(descLabel.snp.bottom).offset(15.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.centerX.equalToSuperview()
        }
        icon2.snp.makeConstraints { make in
            make.top.equalTo(icon1.snp.bottom).offset(20.alpix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 315.alpix(), height: 78.alpix()))
        }
        descLabel1.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalTo(21.alpix())
        }
        nameField1.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10.alpix())
            make.top.equalTo(descLabel1.snp.bottom).offset(15.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.centerX.equalToSuperview()
        }
        icon3.snp.makeConstraints { make in
            make.top.equalTo(icon2.snp.bottom).offset(20.alpix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 315.alpix(), height: 78.alpix()))
        }
        descLabel2.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalTo(21.alpix())
        }
        dateBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10.alpix())
            make.top.equalTo(descLabel2.snp.bottom).offset(15.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.centerX.equalToSuperview()
        }
        confirmBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 315.alpix(), height: 60.alpix()))
            make.top.equalTo(icon3.snp.bottom).offset(60.alpix())
            make.bottom.equalToSuperview().offset(-30.alpix())
        }
        dateBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block1?()
        }).disposed(by: disp)
        confirmBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block?()
        }).disposed(by: disp)
        DispatchQueue.main.async {
            self.bgView.roundCorners(corners: [.topLeft, .topRight], radius: 3.alpix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
