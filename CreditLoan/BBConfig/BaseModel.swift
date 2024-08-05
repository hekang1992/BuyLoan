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
    var forgets: Int?
    var exile: String?
    var cruelty: [String: Any]?
}

class CrueltyModel: BaseModel {
    var feminine: feminineModel?
    var surmises: surmisesModel?
    var lilyvi: feminineModel?
    var benefits: benefitsModel?
    var divine: divineModel?
    var became: becameModel?
    var weeks: [String]?
    var dagged: String?
    var faults: String?
    var vocation: String?
    var havin: String?
    var providing: String?
}

class becameModel: BaseModel {
    var reliance: [reliancemodel]?
}

class reliancemodel: BaseModel {
    var heared: String?// pic url
    var visitor: String?
    var installation: String?
    var sudden: String?//已验证，0没有验证
    var taskType: String?
}

class divineModel: BaseModel {
    var flesh: String?
    var fitted: String?
    var dagged: String?
}

class benefitsModel: BaseModel {
    var enthusiastic: String?
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

class feminineModel: BaseModel {
    var acerbities: String?
    var religion: [religionModel]?
}

class surmisesModel: BaseModel {
    var acerbities: String?
    var religion: religionModel?
}

class religionModel: BaseModel {
    var relied: String?
    var proportion: String?
    var occupying: String?
    var literature: String?
    var harvest: String?
    var summer: String?
    var witnessing: String?
    var gullibility: String?
    var pitied: String?
    var suspicions: String?
    var visitor: String?
    var cred: String?
    var mai: String?
    var heared: String?
    var suppressing: String?
    var interfering: String?
    var trapesing: String?
    var dagged: String?
    var religion: [religionModel]?
}
