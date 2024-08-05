//
//  JudgeConfig.swift
//  CreditLoan
//
//  Created by apple on 2024/8/5.
//

import UIKit
import Foundation
import HandyJSON

class JudgeConfig: NSObject {
    
    static func judue(_ str: String?, from vc: UIViewController) {
        guard let str = str,
              let url = URL(string: str),
              let sch = url.scheme else { return }
        if sch.hasPrefix("http")  {
            
        }else if sch.hasPrefix("cll") {
            let path = url.path
            if path.contains("/petfireIrisT") {// 产品详情
                guard let query = url.query else { return }
                let arr = query.components(separatedBy: "=")
                let trapesing = arr.last ?? ""
                productDetailInfo(trapesing, form: vc)
            }
        }
    }
    
    static func productDetailInfo(_ productID: String, form vc: UIViewController) {
        ViewHud.addLoadView()
        wangluoManager.shared.requestAPI(params: ["trapesing": productID, "filly": "1", "meddling": "1"], pageUrl: "/cll/humouringBuild", method: .post) { successModel in
            if let forgets = successModel.forgets, forgets == 0 || forgets == 00 {
                let model = JSONDeserializer<CrueltyModel>.deserializeFrom(dict: successModel.cruelty)
                guard let model = model else { return }
                let nextStep = model.benefits?.enthusiastic ?? ""
                if !nextStep.isEmpty {
                    nextStepVc(nextStep, productID, form: vc)
                }
            }
            ViewHud.hideLoadView()
        } errorBlock: { error in
            ViewHud.hideLoadView()
        }
    }
    
    static func nextStepVc(_ type: String, _ productID: String, form vc: UIViewController) {
        switch type {
        case "kpp1":
            let idVc = BBIDViewController()
            idVc.productID = productID
            idVc.hidesBottomBarWhenPushed = true
            vc.navigationController?.pushViewController(idVc, animated: true)
            break
        case "kpp2":
            break
        case "kpp3":
            break
        case "kpp4":
            break
        case "kpp5":
            break
        case "kpp6":
            break
        default:
            break
        }
    }
    
}
