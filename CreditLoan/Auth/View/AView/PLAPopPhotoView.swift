//
//  PLAPopPhotoView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/5.
//

import UIKit
import RxSwift
import RxCocoa

class PLAPopPhotoView: UIView {
    
    let disg = DisposeBag()
    
    var block1: (() -> Void)?
    var block2: (() -> Void)?
    var block3: (() -> Void)?
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "Group_1215")
        return bgImageView
    }()
    
    lazy var btn1 = UIButton()
    lazy var btn2 = UIButton()
    lazy var btn3 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        bgImageView.addSubview(btn1)
        bgImageView.addSubview(btn2)
        bgImageView.addSubview(btn3)
        bgImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 315.alpix(), height: 380.alpix()))
        }
        btn1.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(189.alpix())
        }
        btn2.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(btn1.snp.bottom)
            make.bottom.equalTo(btn3.snp.top)
        }
        btn3.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(60.alpix())
        }
        btn1.rx.tap.subscribe(onNext: { [weak self] in
            self?.block1?()
        }).disposed(by: disg)
        btn2.rx.tap.subscribe(onNext: { [weak self] in
            self?.block2?()
        }).disposed(by: disg)
        btn3.rx.tap.subscribe(onNext: { [weak self] in
            self?.block3?()
        }).disposed(by: disg)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
