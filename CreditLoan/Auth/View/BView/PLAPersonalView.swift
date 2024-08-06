//
//  PLAPersonalView.swift
//  CreditLoan
//
//  Created by apple on 2024/8/6.
//

import UIKit
import BRPickerView

class PLAPersonalView: BBCommonView {
    
    var dizhiBlock: ((UITextField, visitingModel) -> Void)?
    
    var modelArray: [visitingModel]?
    
    var saveInfoBlock: (() -> Void)?
    
    lazy var descLabel: PaddedLabel = {
        let descLabel = PaddedLabel.chuangjianLabel(font: UIFont(name: Regular_Mont, size: 12.alpix())!, textColor: UIColor.init(hex: "#007CFB"), textAlignment: .left)
        descLabel.backgroundColor = UIColor.init(hex: "#F2F6FF")
        descLabel.numberOfLines = 0
        descLabel.text = "Your personal information will only be used for loan verification, and the system will ensure the security of your privacy!"
        descLabel.textInsets = UIEdgeInsets(top: 0, left: 30.alpix(), bottom: 0, right: 30.alpix())
        return descLabel
    }()
    
    lazy var confirmBtn: UIButton = {
        let confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = UIColor.init(hex: "#007CFB")
        confirmBtn.setTitle("Submit", for: .normal)
        confirmBtn.setTitleColor(.white, for: .normal)
        confirmBtn.layer.cornerRadius = 3.alpix()
        confirmBtn.titleLabel?.font = UIFont(name: Heavy_Mont, size: 18.alpix())
        return confirmBtn
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
        tableView.register(PLAInputCell.self, forCellReuseIdentifier: "PLAInputCell")
        tableView.register(PLASelectCell.self, forCellReuseIdentifier: "PLASelectCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(descLabel)
        addSubview(tableView)
        descLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalTo(whiteView.snp.bottom)
            make.height.equalTo(66.5.alpix())
        }
        tableView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(descLabel.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PLAPersonalView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        if modelArray != nil {
            view.addSubview(confirmBtn)
            confirmBtn.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-30.alpix())
                make.left.equalToSuperview().offset(30.alpix())
                make.height.equalTo(60.alpix())
            }
            confirmBtn.rx.tap.subscribe(onNext: { [weak self] in
                self?.saveInfoBlock?()
            }).disposed(by: disposeBag)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if modelArray != nil {
            return 200.alpix()
        }else {
            return 0.01.alpix()
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let modelArray = modelArray else { return UITableViewCell() }
        let model = modelArray[indexPath.row] as visitingModel
        if model.indefatigable == "wqq2" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PLAInputCell", for: indexPath) as? PLAInputCell {
                cell.backgroundColor = .clear
                cell.selectionStyle = .none
                cell.model = model
                return cell
            }
        }else if model.indefatigable == "wqq1" || model.indefatigable == "wqq3" {
            let forgets = model.forgets ?? ""
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PLASelectCell", for: indexPath) as? PLASelectCell {
                cell.backgroundColor = .clear
                cell.selectionStyle = .none
                cell.model = model
                cell.block = { [weak self] inputField in
                    if forgets == "contemplation" || forgets == "indian" {
                        self?.dizhiBlock?(inputField, model)
                    }else if forgets == "character" {
                        self?.popOneView(textField: inputField, model: model)
                    }else {
                        self?.popOneView(textField: inputField, model: model)
                    }
                    
                }
                return cell
            }
        }else {}
        return UITableViewCell()
    }
    
    func popOneView(textField: UITextField, model: visitingModel) {
        setupPickerView(model: model, textField: textField)
    }
    
    func setupPickerView(model: visitingModel, textField: UITextField) {
        guard let brids = model.unfavourable else { return }
        let stringPickerView = BRAddressPickerView()
        if model.forgets == "character" {
            stringPickerView.pickerMode = .city
            let bridsArray = erjiModel.geterjiArr(dataSourceArr: brids)
            stringPickerView.dataSourceArr = bridsArray
        }else {
            stringPickerView.pickerMode = .province
            let bridsArray = yijiModel.getyijiArr(dataSourceArr: brids)
            stringPickerView.dataSourceArr = bridsArray
        }
        stringPickerView.title = model.interfering ?? ""
        stringPickerView.selectIndexs = [0]
        stringPickerView.resultBlock = { province, city, area in
            textField.font = UIFont(name: Heavy_Mont, size: 20.alpix())
            textField.tintColor = UIColor.init(hex: "#0CE094")
            let cityName: String = city?.name ?? ""
            let provinceName: String = province?.name ?? ""
            if cityName.isEmpty {
                textField.text = provinceName
                model.unless = province?.name
                model.acerbities = province?.code
            }else {
                textField.text = provinceName + " - " + cityName
                model.unless = provinceName + " - " + cityName
                model.acerbities = (province?.code ?? "") + " | " + (city?.code ?? "")
            }
        }
        let customStyle = BRPickerStyle()
        customStyle.pickerColor = UIColor(hex: "#FFFFFF")
        customStyle.pickerTextFont = UIFont(name: Heavy_Mont, size: 18.alpix())
        customStyle.selectRowTextFont = customStyle.pickerTextFont
        customStyle.selectRowTextColor = UIColor(hex: "#2C2C36")
        stringPickerView.pickerStyle = customStyle
        stringPickerView.show()
    }
    
}
