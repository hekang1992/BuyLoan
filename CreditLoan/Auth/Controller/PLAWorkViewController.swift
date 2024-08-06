//
//  PLAWorkViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/8/6.
//

import UIKit
import HandyJSON
import BRPickerView
import MBProgressHUD_WJExtension

class PLAWorkViewController: BaseViewController {
    
    var dizhiArray: [reliancemodel]?
    
    var modelArray: [visitingModel]?
    
    lazy var personView: PLAPersonalView = {
        let personView = PLAPersonalView()
        personView.scrollView.isHidden = true
        personView.nameLabel.text = "Fill out personal information"
        return personView
    }()
    
    var productID: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(personView)
        personView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        personView.backBlock = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        personView.dizhiBlock = { [weak self] inputField, model in
            self?.addressHH(vismodel: model, textField: inputField)
        }
        personView.saveInfoBlock = { [weak self] in
            self?.savePInfo()
        }
        getPersonDate()
    }

}

extension PLAWorkViewController {
    
    func getPersonDate() {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: ["trapesing": productID ?? ""], pageUrl: "/cll/anthonyMarkettown", method: .post) { [weak self] successModel in
            ViewHud.hideLoadView()
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                guard let model = JSONDeserializer<CrueltyModel>.deserializeFrom(dict: successModel.cruelty) else { return }
                self?.modelArray = model.visiting
                self?.personView.modelArray = model.visiting
                self?.personView.tableView.reloadData()
            }
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
    func addressHH(vismodel: visitingModel, textField: UITextField) {
        if let dizhiArray = self.dizhiArray, !dizhiArray.isEmpty {
            self.setupPickerView(model: vismodel, textField: textField, array: dizhiArray)
            return
        }
        dizhiApiInfo(vismodel, textField)
    }
    
    
    func dizhiApiInfo(_ vismodel: visitingModel, _ textField: UITextField) {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: ["type": "1"], pageUrl: "/cll/chapelForward", method: .get) { successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                guard let model = JSONDeserializer<CrueltyModel>.deserializeFrom(dict: successModel.cruelty), let array = model.reliance else { return }
                self.dizhiArray = array
                self.setupPickerView(model: vismodel, textField: textField, array: array)
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
    func setupPickerView(model: visitingModel, textField: UITextField, array: [reliancemodel]) {
        let stringPickerView = BRAddressPickerView()
        stringPickerView.pickerMode = .area
        let bridsArray = sanjiModel.getsanjiArr(dataSourceArr: array)
        stringPickerView.title = model.interfering ?? ""
        stringPickerView.dataSourceArr = bridsArray
        stringPickerView.selectIndexs = [0]
        stringPickerView.resultBlock = { province, city, area in
            textField.font = UIFont(name: Heavy_Mont, size: 20.alpix())
            textField.tintColor = UIColor.init(hex: "#0CE094")
            let provinceName = province?.name ?? ""
            let cityName = city?.name ?? ""
            let areaName = area?.name ?? ""
            let addressString = provinceName + " - " + cityName + " - " + areaName
            textField.text = addressString
            model.acerbities = addressString
        }
        let customStyle = BRPickerStyle()
        customStyle.pickerColor = UIColor(hex: "#FFFFFF")
        customStyle.pickerTextFont = UIFont(name: Heavy_Mont, size: 18.alpix())
        customStyle.selectRowTextFont = customStyle.pickerTextFont
        customStyle.selectRowTextColor = UIColor(hex: "#2C2C36")
        stringPickerView.pickerStyle = customStyle
        stringPickerView.show()
    }
    
    func savePInfo() {
        var dict: [String: Any]?
        if let modelArray = modelArray {
            dict = modelArray.reduce(into: [String: Any](), { partialResult, model in
                let type = model.indefatigable
                if type == "wqq1" || type == "wqq3" {
                    partialResult[model.forgets!] = model.acerbities
                }else {
                    partialResult[model.forgets!] = model.unless
                }
            })
            dict?["surmise"] = "1"
            dict?["trapesing"] = self.productID ?? ""
            dict?["isFear"] = "1"
            dict?["observe"] = "21"
            dict?["pronunciation"] = "true"
        }
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: dict, pageUrl: "/cll/remainedRacking", method: .post) { [weak self] successModel in
            let exile = successModel.exile ?? ""
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00, let self = self {
                JudgeConfig.productDetailInfo(self.productID ?? "", form: self)
            }
            ViewHud.hideLoadView()
            MBProgressHUD.wj_showPlainText(exile, view: nil)
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }

    }
    
}
