//
//  BaseModel.swift
//  CreditLoan
//
//  Created by apple on 2024/7/29.
//

import UIKit
import HandyJSON

var IS_LOGIN: Bool {
    let us = UserDefaults.standard
    if let session = us.object(forKey: SESSIONID) as? String {
        return !session.isEmpty
    } else {
        return false
    }
}

class BaseModel: NSObject, HandyJSON {
    required override init() {}
}

class CrueltyModel: BaseModel {
    var forgets: Int?
    var exile: String?
    var cruelty: [String: Any]?
}

class LoginModel: BaseModel {
    
}
