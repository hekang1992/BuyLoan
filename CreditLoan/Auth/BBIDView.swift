//
//  BBIDView.swift
//  CreditLoan
//
//  Created by apple on 2024/7/22.
//

import UIKit
import GKCycleScrollView

class BBIDView: BBCommonView {
    
    let imageArray: [String] = ["zhengque","cuowu","wuxiao"]
    
    let titleArray: [String] = ["All information on the ID must be legible!","All information on the ID must be legible!","All information on the ID must be legible!"]
    
    lazy var descLabel: PaddedLabel = {
        let descLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 12.alpix())!, textColor: UIColor.init(hex: "#007CFB"), textAlignment: .left)
        descLabel.numberOfLines = 0
        descLabel.text = "Your personal information will only be used for loan verification, and the system will ensure the security of your privacy."
        descLabel.backgroundColor = UIColor.init(hex: "#F2F6FF")
        descLabel.textInsets = UIEdgeInsets(top: 0, left: 30.alpix(), bottom: 0, right: 0)
        return descLabel
    }()
    
    lazy var zhengqueView: UIView = {
        let zhengqueView = UIView()
        zhengqueView.backgroundColor = UIColor.init(hex: "#F2F6FF")
        return zhengqueView
    }()
    
    lazy var bannerView: GKCycleScrollView = {
        let bannerView = GKCycleScrollView()
        bannerView.delegate = self
        bannerView.dataSource = self
        bannerView.autoScrollTime = 2.0
        bannerView.layer.cornerRadius = 20.alpix()
        bannerView.pageControl = pageCon
        bannerView.reloadData()
        return bannerView
    }()
    
    lazy var pageCon: GKPageControl  = {
        let pageCon = GKPageControl()
        pageCon.style = .rectangle
        pageCon.layer.cornerRadius = 1
        pageCon.pageIndicatorTintColor = UIColor.init(hex: "#DAEAFF");
        pageCon.currentPageIndicatorTintColor = UIColor.init(hex: "#007CFB");
        return pageCon
    }()
    
    lazy var leftView: UIView = {
        let leftView = UIView()
        leftView.backgroundColor = UIColor.init(hex: "#F2F3F5")
        leftView.layer.cornerRadius = 3.alpix()
        return leftView
    }()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "common")
        return icon
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(hex: "#B8C0C9")
        return lineView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#B8C0C9"), textAlignment: .center)
        titleLabel.numberOfLines = 0
        titleLabel.text = "Identity Verification"
        return titleLabel
    }()
    
    lazy var rightView: UIView = {
        let rightView = UIView()
        rightView.backgroundColor = UIColor.init(hex: "#F2F3F5")
        rightView.layer.cornerRadius = 3.alpix()
        return rightView
    }()
    
    lazy var iconTe: UIImageView = {
        let iconTe = UIImageView()
        iconTe.image = UIImage(named: "Mask_group")
        return iconTe
    }()
    
    lazy var lineView1: UIView = {
        let lineView1 = UIView()
        lineView1.backgroundColor = UIColor.init(hex: "#B8C0C9")
        return lineView1
    }()
    
    lazy var titleLabel1: UILabel = {
        let titleLabel1 = UILabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#B8C0C9"), textAlignment: .center)
        titleLabel1.numberOfLines = 0
        titleLabel1.text = "Face Recognition"
        return titleLabel1
    }()
    
    lazy var fadeImageView: UIImageView = {
        let fadeImageView = UIImageView()
        fadeImageView.image = UIImage(named: "Groupfade")
        return fadeImageView
    }()
    
    lazy var umidLabel: UILabel = {
        let umidLabel = UILabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#B8C0C9"), textAlignment: .left)
        umidLabel.text = "UMID"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(umidLabelClick))
        umidLabel.addGestureRecognizer(tapGesture)
        umidLabel.isUserInteractionEnabled = true
        return umidLabel
    }()
    
    lazy var rightImageView: UIImageView = {
        let rightImageView = UIImageView()
        rightImageView.image = UIImage(named: "Group_12")
        return rightImageView
    }()
    
    lazy var startBtn: UIButton = {
        let startBtn = UIButton(type: .custom)
        startBtn.layer.cornerRadius = 3
        startBtn.setTitle("Start", for: .normal)
        startBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        startBtn.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        startBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        return startBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollView.backgroundColor = .white
        scrollView.addSubview(descLabel)
        scrollView.addSubview(zhengqueView)
        zhengqueView.addSubview(bannerView)
        bannerView.addSubview(pageCon)
        scrollView.addSubview(leftView)
        leftView.addSubview(icon)
        leftView.addSubview(lineView)
        leftView.addSubview(titleLabel)
        scrollView.addSubview(rightView)
        rightView.addSubview(iconTe)
        iconTe.addSubview(fadeImageView)
        rightView.addSubview(lineView1)
        rightView.addSubview(titleLabel1)
        scrollView.addSubview(umidLabel)
        scrollView.addSubview(rightImageView)
        scrollView.addSubview(startBtn)
        descLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(88)
            make.height.equalTo(66.5)
        }
        zhengqueView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descLabel.snp.bottom).offset(15)
            make.left.equalToSuperview()
            make.height.equalTo(172)
        }
        bannerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageCon.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(CGSize(width: 60, height: 4))
        }
        leftView.snp.makeConstraints { make in
            make.top.equalTo(zhengqueView.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(30)
            make.size.equalTo(CGSize(width: 152.5, height: 222.5))
        }
        icon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(3)
            make.top.equalToSuperview().offset(34)
            make.size.equalTo(CGSize(width: 146.5, height: 85))
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(37.5)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lineView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(27)
        }
        rightView.snp.makeConstraints { make in
            make.top.equalTo(zhengqueView.snp.bottom).offset(30)
            make.right.equalTo(zhengqueView.snp.right).offset(-30)
            make.size.equalTo(CGSize(width: 152.5, height: 222.5))
        }
        iconTe.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20.5)
            make.size.equalTo(CGSize(width: 111.5, height: 111.5))
        }
        lineView1.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(24.5)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
        }
        titleLabel1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lineView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(22)
        }
        fadeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(14)
        }
        umidLabel.snp.makeConstraints { make in
            make.left.equalTo(leftView.snp.left)
            make.top.equalTo(leftView.snp.bottom).offset(12)
            make.height.equalTo(21.5)
        }
        rightImageView.snp.makeConstraints { make in
            make.left.equalTo(umidLabel.snp.right).offset(6)
            make.centerY.equalTo(umidLabel.snp.centerY)
            make.size.equalTo(CGSize(width: 8, height: 16))
        }
        startBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 315, height: 60))
            make.top.equalTo(leftView.snp.bottom).offset(128)
            make.bottom.equalToSuperview().offset(-60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.startFadeImageViewAnimation()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BBIDView: GKCycleScrollViewDataSource, GKCycleScrollViewDelegate {
    
    func numberOfCells(in cycleScrollView: GKCycleScrollView!) -> Int {
        return 3
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView, cellForViewAt index: Int) -> GKCycleScrollViewCell {
        let cell = zhengqueCell()
        cell.iconImageView.image = UIImage(named: imageArray[index])
        cell.descLabel.text = titleArray[index]
        return cell
    }
    
    private func startFadeImageViewAnimation() {
        UIView.animate(withDuration: 2.5,
                       delay: 0,
                       options: [.repeat, .curveLinear]) {
            self.fadeImageView.alpha = 0.3
            self.fadeImageView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(97.5)
            }
            self.iconTe.layoutIfNeeded()
        } completion: { _ in
            
        }
    }
    
    @objc func umidLabelClick() {
        
    }
    
}

class zhengqueCell: GKCycleScrollViewCell {
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "zhengque")
        return iconImageView
    }()
    
    lazy var descLabel: UILabel = {
        let descLabel = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 16.alpix())!, textColor: UIColor.init(hex: "#007CFB"), textAlignment: .center)
        descLabel.numberOfLines = 0
        descLabel.text = "All information on the ID must be legible!"
        return descLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        addSubview(descLabel)
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(7.5)
            make.size.equalTo(CGSize(width: 160, height: 100))
        }
        descLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).offset(7.5)
            make.left.equalToSuperview().offset(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class PaddedLabel: UILabel {
    
    var textInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + textInsets.left + textInsets.right,
                      height: size.height + textInsets.top + textInsets.bottom)
    }
    
}
