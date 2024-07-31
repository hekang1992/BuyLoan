//
//  PerPopView.swift
//  CreditLoan
//
//  Created by apple on 2024/7/31.
//

import UIKit
import RxSwift

class PerPopView: UIView {
    
    var block: (() -> Void)?
    
    lazy var disposeBag = {
        return DisposeBag()
    }()

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 3.alpix()
        bgView.backgroundColor = .white
        return bgView
    }()
    
    lazy var descLabel: PaddedLabel = {
        let descLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        descLabel.text = "App permissions"
        return descLabel
    }()

    lazy var canBtn: UIButton = {
        let canBtn = UIButton(type: .custom)
        canBtn.setBackgroundImage(UIImage(named: "Group_cancel"), for: .normal)
        return canBtn
    }()
    
    lazy var confirmBtn: UIButton = {
        let confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        confirmBtn.setTitle("Confirm", for: .normal)
        confirmBtn.setTitleColor(.white, for: .normal)
        confirmBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        return confirmBtn
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.init(hex: "#F2F6FF")
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var icon1: UIImageView = {
        let icon1 = UIImageView()
        icon1.image = UIImage(named: "Group_1187")
        return icon1
    }()
    
    lazy var xiangjiLabel: PaddedLabel = {
        let xiangjiLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 20.alpix())!, textColor: UIColor(hex: "#2C2C36"), textAlignment: .left)
        xiangjiLabel.numberOfLines = 0
        xiangjiLabel.text = "Camera Permission"
        return xiangjiLabel
    }()
    
    lazy var xiangjiLabel1: PaddedLabel = {
        let xiangjiLabel1 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 14.alpix())!, textColor: UIColor(hex: "#B8C0C9"), textAlignment: .left)
        xiangjiLabel1.numberOfLines = 0
        xiangjiLabel1.text = "1.Photo Capturing and Facial Recognition: Recognizing facial information and ensuring the accuracy of identity information.\n2.Personalized Experience: Using facial information for identity verification purposes.\n3.Uploading Profile Photos: The feature allowing users to upload profile photos.\n4.Privacy Protection: Committing to strict protection of user privacy and data security to increase user trust in the application."
        return xiangjiLabel1
    }()
    
    lazy var icon2: UIImageView = {
        let icon2 = UIImageView()
        icon2.image = UIImage(named: "Group_1188")
        return icon2
    }()
    
    lazy var xiangjiLabel2: PaddedLabel = {
        let xiangjiLabel2 = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 20.alpix())!, textColor: UIColor(hex: "#2C2C36"), textAlignment: .left)
        xiangjiLabel2.numberOfLines = 0
        xiangjiLabel2.text = "Photo Library Permission"
        return xiangjiLabel2
    }()
    
    lazy var xiangjiLabel3: PaddedLabel = {
        let xiangjiLabel3 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 14.alpix())!, textColor: UIColor(hex: "#B8C0C9"), textAlignment: .left)
        xiangjiLabel3.numberOfLines = 0
        xiangjiLabel3.text = "1.Purpose: The main reason for requesting access to your photo gallery is to verify the accuracy of the identity information on the uploaded ID photo. We will carefully check to ensure the information is correct.\n2.Privacy Protection: We are committed to safeguarding your privacy. All uploaded information will be encrypted and access will be strictly controlled to enhance your confidence in our privacy protection."
        return xiangjiLabel3
    }()
    
    lazy var icon3: UIImageView = {
        let icon3 = UIImageView()
        icon3.image = UIImage(named: "Group_1189")
        return icon3
    }()
    
    lazy var xiangjiLabel4: PaddedLabel = {
        let xiangjiLabel4 = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 20.alpix())!, textColor: UIColor(hex: "#2C2C36"), textAlignment: .left)
        xiangjiLabel4.numberOfLines = 0
        xiangjiLabel4.text = "Location Permission"
        return xiangjiLabel4
    }()
    
    lazy var xiangjiLabel5: PaddedLabel = {
        let xiangjiLabel5 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 14.alpix())!, textColor: UIColor(hex: "#B8C0C9"), textAlignment: .left)
        xiangjiLabel5.numberOfLines = 0
        xiangjiLabel5.text = "1.Purpose: To provide more accurate products and services, we need to access your location information.\n2.Privacy Protection: We are committed to safeguarding your privacy and will not misuse your location data. If you have any questions or concerns, please feel free to contact us."
        return xiangjiLabel5
    }()
    
    lazy var icon4: UIImageView = {
        let icon4 = UIImageView()
        icon4.image = UIImage(named: "Group_1190")
        return icon4
    }()
    
    lazy var xiangjiLabel6: PaddedLabel = {
        let xiangjiLabel6 = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 20.alpix())!, textColor: UIColor(hex: "#2C2C36"), textAlignment: .left)
        xiangjiLabel6.numberOfLines = 0
        xiangjiLabel6.text = "Tracking Usage Permission"
        return xiangjiLabel6
    }()
    
    lazy var xiangjiLabel7: PaddedLabel = {
        let xiangjiLabel7 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 14.alpix())!, textColor: UIColor(hex: "#B8C0C9"), textAlignment: .left)
        xiangjiLabel7.numberOfLines = 0
        xiangjiLabel7.text = "1.Purpose: To provide more accurate product recommendations, we request your Advertising ID.\n2.Privacy Protection: We are committed to safeguarding your privacy and strictly adhere to all relevant laws and regulations. Your Advertising ID will be used solely to enhance our services."
        return xiangjiLabel7
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(descLabel)
        bgView.addSubview(canBtn)
        bgView.addSubview(confirmBtn)
        bgView.addSubview(scrollView)
        scrollView.addSubview(icon1)
        scrollView.addSubview(icon2)
        scrollView.addSubview(icon3)
        scrollView.addSubview(icon4)
        scrollView.addSubview(xiangjiLabel)
        scrollView.addSubview(xiangjiLabel1)
        scrollView.addSubview(xiangjiLabel2)
        scrollView.addSubview(xiangjiLabel3)
        scrollView.addSubview(xiangjiLabel4)
        scrollView.addSubview(xiangjiLabel5)
        scrollView.addSubview(xiangjiLabel6)
        scrollView.addSubview(xiangjiLabel7)
        bgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(480.alpix())
        }
        descLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18.5.alpix())
            make.left.equalToSuperview().offset(25.alpix())
            make.height.equalTo(23.5.alpix())
        }
        canBtn.snp.makeConstraints { make in
            make.centerY.equalTo(descLabel.snp.centerY)
            make.right.equalToSuperview().offset(-20.alpix())
            make.size.equalTo(CGSize(width: 22.alpix(), height: 22.alpix()))
        }
        confirmBtn.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(60.alpix())
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(20.alpix())
            make.left.right.equalToSuperview()
            make.bottom.equalTo(confirmBtn.snp.top)
        }
        icon1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.alpix())
            make.left.equalToSuperview().offset(25.alpix())
            make.size.equalTo(CGSize(width: 20.alpix(), height: 20.alpix()))
        }
        xiangjiLabel.snp.makeConstraints { make in
            make.top.equalTo(icon1.snp.top).offset(-2.alpix())
            make.left.equalTo(icon1.snp.right).offset(12.alpix())
            make.width.equalTo(238.alpix())
        }
        xiangjiLabel1.snp.makeConstraints { make in
            make.top.equalTo(xiangjiLabel.snp.bottom).offset(2.alpix())
            make.left.equalTo(icon1.snp.right).offset(12.alpix())
            make.width.equalTo(238.alpix())
        }
        icon2.snp.makeConstraints { make in
            make.top.equalTo(xiangjiLabel1.snp.bottom).offset(6.5.alpix())
            make.left.equalToSuperview().offset(25.alpix())
            make.size.equalTo(CGSize(width: 20.alpix(), height: 20.alpix()))
        }
        xiangjiLabel2.snp.makeConstraints { make in
            make.top.equalTo(icon2.snp.top).offset(-2.alpix())
            make.left.equalTo(icon1.snp.right).offset(12.alpix())
            make.width.equalTo(238.alpix())
        }
        xiangjiLabel3.snp.makeConstraints { make in
            make.top.equalTo(xiangjiLabel2.snp.bottom).offset(2.alpix())
            make.left.equalTo(icon1.snp.right).offset(12.alpix())
            make.width.equalTo(238.alpix())
        }
        icon3.snp.makeConstraints { make in
            make.top.equalTo(xiangjiLabel3.snp.bottom).offset(6.5.alpix())
            make.left.equalToSuperview().offset(25.alpix())
            make.size.equalTo(CGSize(width: 20.alpix(), height: 20.alpix()))
        }
        xiangjiLabel4.snp.makeConstraints { make in
            make.top.equalTo(icon3.snp.top).offset(-2.alpix())
            make.left.equalTo(icon1.snp.right).offset(12.alpix())
            make.width.equalTo(238.alpix())
        }
        xiangjiLabel5.snp.makeConstraints { make in
            make.top.equalTo(xiangjiLabel4.snp.bottom).offset(2.alpix())
            make.left.equalTo(icon1.snp.right).offset(12.alpix())
            make.width.equalTo(238.alpix())
        }
        icon4.snp.makeConstraints { make in
            make.top.equalTo(xiangjiLabel5.snp.bottom).offset(6.5.alpix())
            make.left.equalToSuperview().offset(25.alpix())
            make.size.equalTo(CGSize(width: 20.alpix(), height: 20.alpix()))
        }
        xiangjiLabel6.snp.makeConstraints { make in
            make.top.equalTo(icon4.snp.top).offset(-2.alpix())
            make.left.equalTo(icon1.snp.right).offset(12.alpix())
            make.width.equalTo(238.alpix())
        }
        xiangjiLabel7.snp.makeConstraints { make in
            make.top.equalTo(xiangjiLabel6.snp.bottom).offset(2.alpix())
            make.left.equalTo(icon1.snp.right).offset(12.alpix())
            make.width.equalTo(238.alpix())
            make.bottom.equalToSuperview().offset(-10.alpix())
        }
        canBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block?()
        }).disposed(by: disposeBag)
        confirmBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.block?()
        }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
