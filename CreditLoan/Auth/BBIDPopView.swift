//
//  BBIDPopView.swift
//  CreditLoan
//
//  Created by apple on 2024/7/22.
//

import UIKit
import RxSwift
import RxCocoa

class BBIDPopView: UIView {
    
    var modelArray: [String]?
    
    lazy var disp = DisposeBag()
    
    var block: (() -> Void)?
    
    var block1: ((String) -> Void)?

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.init(hex: "#FFFFFF")
        return bgView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .left)
        nameLabel.text = "select an ID type"
        return nameLabel
    }()
    
    lazy var canBtn: UIButton = {
        let canBtn = UIButton(type: .custom)
        canBtn.setBackgroundImage(UIImage(named: "Group_cancel"), for: .normal)
        return canBtn
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
        tableView.register(authCell.self, forCellReuseIdentifier: "authCell")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(nameLabel)
        bgView.addSubview(canBtn)
        bgView.addSubview(tableView)
        bgView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: 375.alpix(), height: 400.alpix()))
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(37.alpix())
            make.top.equalToSuperview().offset(20.alpix())
            make.height.equalTo(23.5.alpix())
        }
        canBtn.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.size.equalTo(CGSize(width: 22.alpix(), height: 22.alpix()))
            make.right.equalToSuperview().offset(-20.alpix())
        }
        tableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.bottom.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(15.alpix())
        }
        canBtn.rx.tap.subscribe(onNext: { [weak self] in
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

extension BBIDPopView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "authCell", for: indexPath) as? authCell  else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.titleLabel.textColor = UIColor.init(hex: "#2C2C36")
        cell.titleLabel.text = modelArray?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.alpix()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01.alpix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? authCell
        cell?.titleLabel.textColor = UIColor.init(hex: "#007CFB")
        delayTime.delay(0.25) { [weak self] in
            self?.block1?(cell?.titleLabel.text ?? "")
        }
    }
    
}


class authCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.chuangjianLabel(font: UIFont(name: Heavy_Mont, size: 18.alpix())!, textColor: UIColor.init(hex: "#2C2C36"), textAlignment: .center)
        titleLabel.text = "fdasf"
        return titleLabel
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(hex: "#F2F3F5")
        return lineView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lineView)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        lineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(2.alpix())
            make.left.equalToSuperview().offset(30.alpix())
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
