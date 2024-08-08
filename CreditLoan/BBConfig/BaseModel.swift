//
//  BaseModel.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit
import HandyJSON

class BaseModel: HandyJSON {
    required init() {}
    var forgets: Int?
    var exile: String?
    var cruelty: [String: Any]?
}

class CrueltyModel: HandyJSON {
    required init() {}
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
    var visiting: [visitingModel]?
    var reliance: [reliancemodel]?
    var smilingly: smilinglyModel?
}

class smilinglyModel: HandyJSON {
    required init() {}
    var brightened: String?
    var installation: String?
    var reliance: [reliancemodel]?
}

class visitingModel: HandyJSON {
    required init() {}
    var interfering: String?
    var livers: String?
    var indefatigable: String?
    var unfavourable: [unfavourableModel]?
    var unless: String?
    var acerbities: String?
    var commanding: String?
    var forgets: String?
}

class unfavourableModel: HandyJSON {
    required init() {}
    var faults: String?
    var acerbities: String?
    var unfavourable: [unfavourableModel]?
}

class becameModel: HandyJSON {
    required init() {}
    var reliance: [reliancemodel]?
}

class reliancemodel: HandyJSON {
    required init() {}
    var heared: String?// pic url
    var visitor: String?
    var installation: String?
    var sudden: String?//已验证，0没有验证
    var taskType: String?
    
    var relied: String?
    var faults: String?
    var reliance: [reliancemodel]?
    
    var brightened: String?
    var mobile_name: String?
    var endeavoured: String?
    
    var nourishing : nourishingModel?
}

class nourishingModel: HandyJSON {
    required init() {}
    var faults: String?
    var acerbities: String?
}

class divineModel: HandyJSON {
    required init() {}
    var flesh: String?
    var fitted: String?
    var dagged: String?
}

class benefitsModel: HandyJSON {
    required init() {}
    var enthusiastic: String?
}

class LoginModel: HandyJSON {
    required init() {}
    var earliest: String?
    var glazed: String?
    var declamation: String?
}

class wenjuanModel: HandyJSON {
    required init() {}
    var homeRe: [homeReModel]?
    var anxiety: [homeReModel]?
}

class homeReModel: HandyJSON {
    required init() {}
    var acerbities: String?
    var faults: String?
}

class feminineModel: HandyJSON {
    required init() {}
    var acerbities: String?
    var religion: [religionModel]?
}

class surmisesModel: HandyJSON {
    required init() {}
    var acerbities: String?
    var religion: religionModel?
}

class religionModel: HandyJSON {
    required init() {}
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
