//
//  BaseModel.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit
import HandyJSON

class BaseModel: NSObject, HandyJSON {
    required override init() {}
}

class CrueltyModel: BaseModel {
    var forgets: Int?
    var exile: String?
    var cruelty: [String: Any]?
}

class LoginModel: BaseModel {
    var earliest: String?
    var glazed: String?
    var declamation: String?
}

class wenjuanModel: BaseModel {
    var homeRe: [homeReModel]?
    var anxiety: [homeReModel]?
}

class homeReModel: BaseModel {
    var acerbities: String?
    var faults: String?
}
