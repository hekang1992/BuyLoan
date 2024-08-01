//
//  WenJuanTwoViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/8/1.
//

import UIKit
import HandyJSON
import BRPickerView

class WenJuanTwoViewController: BaseViewController {
    
    lazy var nameLabel: PaddedLabel = {
        let nameLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        nameLabel.text = "User Guide 2/3"
        return nameLabel
    }()
    
    lazy var iconMa: UIImageView = {
        let iconMa = UIImageView()
        iconMa.image = UIImage(named: "Group_1200")
        return iconMa
    }()
    
    lazy var iconbg: UIImageView = {
        let iconbg = UIImageView()
        iconbg.image = UIImage(named: "Group_1132")
        return iconbg
    }()
    
    lazy var desclabel: PaddedLabel = {
        let desclabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 20.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        desclabel.text = "What repayment term do you prefer?"
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
    
    lazy var juxingView: UIView = {
        let juxingView = UIView()
        juxingView.layer.borderColor = UIColor.init(hex: "#007CFB").cgColor
        juxingView.layer.borderWidth = 2.alpix()
        juxingView.layer.cornerRadius = 3.alpix()
        return juxingView
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
    
    lazy var homeLabel: PaddedLabel = {
        let homeLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        homeLabel.text = "3 Month"
        return homeLabel
    }()
    
    lazy var homeLabel1: PaddedLabel = {
        let homeLabel1 = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 14.alpix())!, textColor: UIColor.init(hex: "#B8C0C9"), textAlignment: .center)
        homeLabel1.text = "Selectable range is 1-12 months"
        return homeLabel1
    }()
    
    lazy var iconri: UIImageView = {
        let iconri = UIImageView()
        iconri.image = UIImage(named: "Group_40")
        return iconri
    }()
    
    lazy var clickBtn: UIButton = {
        let clickBtn = UIButton(type: .custom)
        return clickBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGuide()
    }
    
}

extension WenJuanTwoViewController {
    
    func setUpGuide() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(iconMa)
        view.addSubview(scrollView)
        scrollView.addSubview(iconbg)
        scrollView.addSubview(desclabel)
        scrollView.addSubview(juxingView)
        juxingView.addSubview(homeLabel)
        juxingView.addSubview(homeLabel1)
        juxingView.addSubview(iconri)
        juxingView.addSubview(clickBtn)
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
        juxingView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(desclabel.snp.bottom).offset(30.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(85.alpix())
        }
        homeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(18.alpix())
            make.height.equalTo(24.5.alpix())
        }
        homeLabel1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(homeLabel.snp.bottom).offset(6.alpix())
            make.left.equalToSuperview().offset(10.alpix())
            make.height.equalTo(18.5.alpix())
        }
        iconri.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22.alpix())
            make.right.equalToSuperview().offset(-16.5.alpix())
            make.size.equalTo(CGSize(width: 11.alpix(), height: 11.alpix()))
        }
        clickBtn.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(juxingView.snp.bottom).offset(271.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.height.equalTo(60.alpix())
            make.bottom.equalToSuperview().offset(-50.alpix())
        }
        clickBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.shujuqiniuq()
        }).disposed(by: disposeBag)
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.pushTeo()
        }).disposed(by: disposeBag)
    }
    
    func pushTeo() {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: ["type" : self.homeLabel.text ?? ""], pageUrl: "/cll/doorPeng", method: .post) { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                let wenVc = WenJuanThreeViewController()
                self?.navigationController?.pushViewController(wenVc, animated: false)
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
    func shujuqiniuq() {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: [:], pageUrl: "/cll/doorDang", method: .post) { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                if let model = JSONDeserializer<wenjuanModel>.deserializeFrom(dict: successModel.cruelty) {
                    self?.setupPickerView(model: model, textField: UITextField())
                }
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
    func setupPickerView(model: wenjuanModel, textField: UITextField) {
        guard let anxiety = model.anxiety else { return }
        let stringPickerView = BRAddressPickerView()
        stringPickerView.pickerMode = .province
        let bridsArray = oneModel.getyijiArr(dataSourceArr: anxiety)
        stringPickerView.dataSourceArr = bridsArray
        stringPickerView.title = "Month"
        stringPickerView.selectIndexs = [0]
        stringPickerView.resultBlock = { [weak self] province, city, area in
            self?.homeLabel.text = province?.name
            self?.homeLabel1.text = province?.code
        }
        let customStyle = BRPickerStyle()
        customStyle.pickerColor = UIColor.init(hex: "#FFFFFF")
        customStyle.pickerTextFont = UIFont(name: Heavy_Mont, size: 18.alpix())
        customStyle.selectRowTextFont = customStyle.pickerTextFont
        customStyle.selectRowTextColor = UIColor.init(hex: "#2C2C36")
        stringPickerView.pickerStyle = customStyle
        stringPickerView.show()
    }
}

