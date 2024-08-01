//
//  WenJuanThreeViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/8/1.
//

import UIKit

class WenJuanThreeViewController: BaseViewController {
    
    lazy var nameLabel: PaddedLabel = {
        let nameLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        nameLabel.text = "User Guide 3/3"
        return nameLabel
    }()
    
    lazy var iconMa: UIImageView = {
        let iconMa = UIImageView()
        iconMa.image = UIImage(named: "Group_1201")
        return iconMa
    }()
    
    lazy var iconbg: UIImageView = {
        let iconbg = UIImageView()
        iconbg.image = UIImage(named: "Group_1132")
        return iconbg
    }()
    
    lazy var desclabel: PaddedLabel = {
        let desclabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 20.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        desclabel.text = "What amount of loan are you looking to apply for?"
        desclabel.numberOfLines = 0
        return desclabel
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.init(hex: "#FFFFFF")
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var pesoLabel: PaddedLabel = {
        let pesoLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        pesoLabel.text = "₱"
        return pesoLabel
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(hex: "#007CFB")
        return lineView
    }()
    
    lazy var neironTe: UITextField = {
        let neironTe = UITextField()
        neironTe.keyboardType = .numberPad
        let attrString = NSMutableAttributedString(string: "Please enter the amount", attributes: [
            .foregroundColor: UIColor.init(hex: "#DDE2E6") as Any,
            .font: UIFont(name: Heavy_Mont, size: 18.alpix())!
        ])
        neironTe.attributedPlaceholder = attrString
        neironTe.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        neironTe.textColor = UIColor.init(hex: "#2C2C36")
        return neironTe
    }()
    
    lazy var amLabel: PaddedLabel = {
        let amLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 14.alpix())!, textColor: UIColor.init(hex: "#007CFB"), textAlignment: .center)
        amLabel.text = "Amount range is 2000-50000"
        return amLabel
    }()
    
    lazy var amLabel1: PaddedLabel = {
        let amLabel1 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 14.alpix())!, textColor: UIColor.init(hex: "#007CFB"), textAlignment: .center)
        amLabel1.numberOfLines = 0
        amLabel1.text = "We support both bank cards and e-wallets for receiving and making payments."
        return amLabel1
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        nextBtn.layer.cornerRadius = 3.alpix()
        nextBtn.setTitle("Got it, next!", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        nextBtn.setTitleColor(.white, for: .normal)
        return nextBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGuide()
    }
    
}

extension WenJuanThreeViewController {
    
    func setUpGuide() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(iconMa)
        view.addSubview(scrollView)
        scrollView.addSubview(iconbg)
        scrollView.addSubview(desclabel)
        scrollView.addSubview(pesoLabel)
        scrollView.addSubview(lineView)
        scrollView.addSubview(neironTe)
        scrollView.addSubview(amLabel)
        scrollView.addSubview(amLabel1)
        scrollView.addSubview(nextBtn)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(23.5.alpix())
            make.top.equalToSuperview().offset(52.5.alpix())
        }
        iconMa.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(12.alpix())
            make.height.equalTo(4.alpix())
        }
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(iconMa.snp.bottom).offset(1.alpix())
        }
        iconbg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 161.alpix(), height: 134.alpix()))
            make.top.equalToSuperview().offset(42.alpix())
        }
        desclabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconbg.snp.bottom).offset(30.alpix())
            make.left.equalToSuperview().offset(20.alpix())
        }
        pesoLabel.snp.makeConstraints { make in
            make.top.equalTo(desclabel.snp.bottom).offset(30.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(23.5.alpix())
        }
        lineView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pesoLabel.snp.bottom).offset(11.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(2.alpix())
        }
        neironTe.snp.makeConstraints { make in
            make.top.equalTo(desclabel.snp.bottom).offset(30.alpix())
            make.bottom.equalTo(lineView.snp.top).offset(-10.alpix())
            make.left.equalTo(pesoLabel.snp.right).offset(33.alpix())
            make.right.equalToSuperview().offset(50.alpix())
        }
        amLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10.alpix())
            make.centerX.equalToSuperview()
            make.height.equalTo(18.5.alpix())
        }
        amLabel1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(amLabel.snp.bottom).offset(248.alpix())
            make.left.equalToSuperview().offset(30.alpix())
        }
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(amLabel1.snp.bottom).offset(20.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(60.alpix())
            make.bottom.equalToSuperview().offset(-50.alpix())
        }
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.pushTeo()
        }).disposed(by: disposeBag)
        neironTe.rx.text
            .orEmpty
            .map { text -> String in
                let updatedText = text
                if updatedText.isEmpty {
                    return updatedText
                } else if updatedText.count > 5 {
                    return String(updatedText.prefix(5))
                } else if let number = Int(updatedText), number > 50000 {
                    return "50000"
                }
                return updatedText
            }
            .bind(to: neironTe.rx.text)
            .disposed(by: disposeBag)
    }
    
    func pushTeo() {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: ["type" : self.neironTe.text ?? ""], pageUrl: "/cll/doorPeng", method: .post) { successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                //go home
                
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
}
