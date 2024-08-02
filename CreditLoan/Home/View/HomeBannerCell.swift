//
//  HomeBannerCell.swift
//  CreditLoan
//
//  Created by apple on 2024/8/2.
//

import UIKit
import Kingfisher
import GKCycleScrollView

class HomeBannerCell: UITableViewCell {

    lazy var bannerView: GKCycleScrollView = {
        let bannerView = GKCycleScrollView()
        bannerView.minimumCellAlpha = 0.0;
        bannerView.delegate = self
        bannerView.dataSource = self
        bannerView.layer.cornerRadius = 3.alpix()
        return bannerView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bannerView)
        bannerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(120.alpix())
            make.left.equalToSuperview().offset(20.alpix())
            make.top.equalToSuperview().offset(10.alpix())
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: feminineModel? {
        didSet {
            guard let model = model else { return }
            bannerView.reloadData()
        }
    }
    
}


extension HomeBannerCell: GKCycleScrollViewDelegate, GKCycleScrollViewDataSource {
    
    func numberOfCells(in cycleScrollView: GKCycleScrollView!) -> Int {
        return model?.religion?.count ?? 0
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView, cellForViewAt index: Int) -> GKCycleScrollViewCell {
        let cell = GKCycleScrollViewCell()
        if let model = model?.religion?[index], let picUrl = model.heared {
            cell.imageView.kf.setImage(with: URL(string: picUrl))
        }
        return cell
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView, didSelectCellAt index: Int) {
        
    }
    
//    var model: LikethatModel? {
//        didSet {
//            bannerView.reloadData()
//        }
//    }
    
}
