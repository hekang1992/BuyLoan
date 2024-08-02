//
//  HomeOneView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/2.
//

import UIKit

class HomeOneView: UIView {
    
    var bannerModel: feminineModel?
    
    var bigCardModel: surmisesModel?
    
    var reqModel: feminineModel?
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.init(hex: "#2C2C36")
        return bgView
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "Sliceonebg")
        return bgImageView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(HomeBannerCell.self, forCellReuseIdentifier: "HomeBannerCell")
        tableView.register(HomeBigCardCell.self, forCellReuseIdentifier: "HomeBigCardCell")
        tableView.register(HomeReqCell.self, forCellReuseIdentifier: "HomeReqCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(bgImageView)
        bgView.addSubview(tableView)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bgImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(88.alpix())
            make.size.equalTo(CGSize(width: 335.alpix(), height: 118.alpix()))
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: CLTabBarConfig.tabBarHeight, right: 0))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HomeOneView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (0...1).contains(section) {
            return 1
        }else {
            return reqModel?.religion?.count ?? 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0, 0): 
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBannerCell", for: indexPath) as? HomeBannerCell {
                cell.model = bannerModel
                cell.selectionStyle = .none
                cell.backgroundColor = .clear
                return cell
            }
        case (1, 0):
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBigCardCell", for: indexPath) as? HomeBigCardCell {
                cell.model = bigCardModel?.religion
                cell.selectionStyle = .none
                cell.backgroundColor = .clear
                return cell
            }
        case (2, 0):
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeReqCell", for: indexPath) as? HomeReqCell {
                cell.layer.cornerRadius = 3.alpix()
                cell.selectionStyle = .none
                cell.backgroundColor = .clear
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 40.alpix()
        }else if section == 1 {
            return 40.alpix()
        }else {
            return 40.alpix()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
}



