//
//  BBIDViewController.swift
//  CreditLoan
//
//  Created by apple on 2024/7/22.
//

import UIKit
import HandyJSON
import TYAlertController
import MBProgressHUD_WJExtension
import BRPickerView
import AVFoundation
import AAILivenessSDK
import AAILiveness

class BBIDViewController: BaseViewController {
    
    var productID: String?
    
    var weakStringArray: [String]?
    
    var model: CrueltyModel?
    
    lazy var popView: BBIDPopView = {
        let popView = BBIDPopView(frame: self.view.bounds)
        return popView
    }()
    
    lazy var popPhotoView: PLAPopPhotoView = {
        let popPhotoView = PLAPopPhotoView(frame: self.view.bounds)
        return popPhotoView
    }()
    
    lazy var popSuccessView: PopSuccessView = {
        let popSuccessView = PopSuccessView(frame: self.view.bounds)
        return popSuccessView
    }()
    
    lazy var idView: BBIDView = {
        let idView = BBIDView()
        idView.nameLabel.text = "ID Verification"
        return idView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(idView)
        idView.backBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        idView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        idView.leftBlock = { [weak self] in
            self?.popIdView()
        }
        idView.rightBlock = { [weak self] in
            self?.renlianixnxi()
        }
        idView.startBlock = { [weak self] in
            let str = self?.idView.umidLabel.text ?? ""
            if str.isEmpty {
                MBProgressHUD.wj_showPlainText("Please select your type of identification document", view: nil)
            }else {
                if self?.model?.divine?.flesh == "1" {
                    let dagged = self?.model?.dagged ?? ""
                    if !dagged.isEmpty {
                        JudgeConfig.productDetailInfo(self?.productID ?? "", form: self!)
                    }else {
                        self?.renlianixnxi()
                    }
                }else {
                    self?.popPhoView()
                }
            }
        }
        faceInfo()
    }
    
}

extension BBIDViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func renlianixnxi() {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: [:], pageUrl: "/cll/greatBrother", method: .post) { successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                let model = JSONDeserializer<CrueltyModel>.deserializeFrom(dict: successModel.cruelty)
                guard let model = model else { return }
                let lince = model.providing ?? ""
                self.takeTapFace(lince)
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }

    }
    
    func faceInfo() {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: ["trapesing": productID ?? "", "alterations": "isface"], pageUrl: "/cll/sorryChurchgoers", method: .get) { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00, let self = self {
                let model = JSONDeserializer<CrueltyModel>.deserializeFrom(dict: successModel.cruelty)
                guard let model = model else { return }
                self.model = model
                let dagged = model.dagged ?? ""
                let flesh = model.divine?.flesh ?? ""
                self.weakStringArray = model.weeks ?? [""]
                if flesh == "1" {
                    if !dagged.isEmpty {
                        self.idView.iconTe.kf.setImage(with: URL(string: dagged), placeholder: UIImage(named: "Mask_group"))
                    }
                    self.idView.leftView.isUserInteractionEnabled = false
                    self.idView.umidLabel.isUserInteractionEnabled = false
                    self.idView.umidLabel.text = model.divine?.fitted
                    self.idView.icon.kf.setImage(with: URL(string: model.divine?.dagged ?? ""), placeholder: UIImage(named: "common"))
                    self.idView.rightView.layer.borderWidth = 2.alpix()
                    self.idView.rightView.layer.borderColor = UIColor.init(hex: "#007CFB").cgColor
                }
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
    func popIdView() {
        let alertVc = TYAlertController(alert: popView, preferredStyle: .actionSheet)
        popView.modelArray = weakStringArray
        popView.tableView.reloadData()
        self.present(alertVc!, animated: true)
        popView.block = { [weak self] in
            self?.dismiss(animated: true)
        }
        popView.block1 = { [weak self] str in
            self?.dismiss(animated: true, completion: {
                self?.idView.umidLabel.text = str
            })
        }
    }
    
    func popPhoView() {
        let alertVc = TYAlertController(alert: popPhotoView, preferredStyle: .alert)
        self.present(alertVc!, animated: true)
        popPhotoView.block3 = { [weak self] in
            self?.dismiss(animated: true)
        }
        popPhotoView.block2 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                PAMediaManager.shared.presentCamera(from: self!, isfront: "0")
            })
        }
        popPhotoView.block1 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                PAMediaManager.shared.presentPhotoLibrary(from: self!)
            })
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let data = Data.yasuoQuality(image: image!, maxLength: 1800)
        picker.dismiss(animated: true) { [weak self] in
            self?.upIconImage(data!,image!)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func upIconImage(_ data: Data, _ image: UIImage) {
        ViewHud.addLoadView()
        wangluoManager.shared.uploadAPI(params: ["parenthetic": "1", "trapesing": productID ?? "", "acerbities": "11", "fitted": self.idView.umidLabel.text ?? ""], pageUrl: "/cll/proudDisturb", method: .post, data: data, complete: { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                let model = JSONDeserializer<CrueltyModel>.deserializeFrom(dict: successModel.cruelty)
                guard let model = model else { return }
                self?.popIdInfo(model)
            }
            ViewHud.hideLoadView()
        }, errorBlock: { error in
            ViewHud.hideLoadView()
        }, type: "image")
    }
    
    func popIdInfo(_ model: CrueltyModel) {
        self.model = model
        let alertVc = TYAlertController(alert: popSuccessView, preferredStyle: .actionSheet)
        popSuccessView.model = model
        self.present(alertVc!, animated: true)
        popSuccessView.block1 = { [weak self] in
            let timeStr = self?.popSuccessView.dateBtn.titleLabel?.text ?? ""
            if timeStr.isEmpty {
                self?.datePop(time: model.havin ?? "")
            }else {
                self?.datePop(time: timeStr)
            }
            
        }
        popSuccessView.block = { [weak self] in
            self?.saveIDInfo()
        }
    }
    
    func datePop(time: String) {
        let datePickerView = BRDatePickerView()
        datePickerView.pickerMode = .YMD
        datePickerView.title = "Date of Birth"
        let array = time.components(separatedBy: "/").compactMap { Int($0) }
        if array.count == 3 {
            datePickerView.selectDate = NSDate.br_setYear(array[2], month: array[1], day: array[0])
        }
        datePickerView.minDate = NSDate.br_setYear(1900, month: 10, day: 1)
        datePickerView.maxDate = Date()
        datePickerView.resultBlock = { [weak self] selectDate, selectValue in
            guard let selectValue = selectValue else { return }
            let timeArray = selectValue.components(separatedBy: "-")
            if timeArray.count == 3 {
                let dateStr = "\(timeArray[2])/\(timeArray[1])/\(timeArray[0])"
                self?.popSuccessView.dateBtn.setTitle(dateStr, for: .normal)
            }
        }
        let customStyle = BRPickerStyle()
        customStyle.pickerColor = UIColor(hex: "#FFFFFF")
        customStyle.pickerTextFont = UIFont(name: Heavy_Mont, size: 18.alpix())
        customStyle.selectRowTextFont = customStyle.pickerTextFont
        customStyle.selectRowTextColor = UIColor(hex: "#2C2C36")
        datePickerView.pickerStyle = customStyle
        datePickerView.show()
    }
    
    func saveIDInfo() {
        ViewHud.addLoadView()
        let time = popSuccessView.dateBtn.titleLabel?.text ?? ""
        let array = time.components(separatedBy: "/").compactMap { Int($0) }
        let timeStr = "\(array[2])/\(array[1])/\(array[0])"
        wangluoManager.shared.requestAPI(params: ["havin": timeStr,
                                                  "vocation": popSuccessView.nameField1.text ?? "",
                                                  "faults": popSuccessView.nameField.text ?? "",
                                                  "acerbities": "11",
                                                  "fitted": self.idView.umidLabel.text ?? ""], pageUrl: "/cll/ratherHackit", method: .post) { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                self?.dismiss(animated: true, completion: {
                    self?.faceInfo()
                })
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
    func takeTapFace(_ stands: String) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .notDetermined {
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.sync {
                        self.checkLicense(stands)
                    }
                }
            }
        } else if status == .denied || status == .restricted {
//            goCamera()
        } else {
            checkLicense(stands)
        }
    }
    
    func checkLicense(_ stands: String) {
        let checkResult = AAILivenessSDK.configLicenseAndCheck(stands)
        if checkResult == "SUCCESS" {
            let faceVc = AAILivenessViewController()
            faceVc.detectionSuccessBlk = { [weak self] rawVC, result in
                let livenessId = result.livenessId
                let bestImg = result.img
                let data: Data = Data.yasuoQuality(image: bestImg, maxLength: 1024)!
                self?.saveFaceInfo(data, livenessId, rawVC)
            }
            let navVc = BaseNavController(rootViewController: faceVc)
            navVc.modalPresentationStyle = .fullScreen
            self.present(navVc, animated: true)
        }else if checkResult == "LICENSE_EXPIRE"{
            
        }else if checkResult == "APPLICATION_ID_NOT_MATCH"{
            
        }else {
            
        }
    }
    
    func saveFaceInfo(_ data: Data, _ associated: String, _ vc: AAILivenessViewController) {
        ViewHud.addLoadView()
        wangluoManager.shared.uploadAPI(params: ["parenthetic": "2", "trapesing": productID ?? "", "acerbities": "10", "associated": associated, "risen": "2"], pageUrl: "/cll/proudDisturb", method: .post, data: data, complete: { [weak self] successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                UIView.animate(withDuration: 0.25) {
                    vc.navigationController?.dismiss(animated: true, completion: {
                        self?.faceInfo()
                    })
                }
            }
            ViewHud.hideLoadView()
        }, errorBlock: { error in
            ViewHud.hideLoadView()
        }, type: "image")
    }

}
