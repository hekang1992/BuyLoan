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
}
