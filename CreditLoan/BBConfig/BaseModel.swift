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
    
}
