//
//  ApiUrlConfig.swift
//  CreditLoan
//
//  Created by apple on 2024/7/30.
//

import Foundation
import HandyJSON
import Alamofire

let apiHost = "http://8.220.137.160:9023"

let schemeUrl = "cll://we.win"

typealias CompleteBlock = (_ successModel: BaseModel) -> Void

typealias NSErrorBlock = (_ error: Any) -> Void

class wangluoManager: NSObject {
    
    static let shared = wangluoManager()
    
    let headers: HTTPHeaders = [
        "Connection": "keep-alive",
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded;multipart/form-data"]
    
}

extension wangluoManager {
    
    func requestAPI(params: [String: Any]?,
                    pageUrl: String,
                    method: HTTPMethod,
                    complete: @escaping CompleteBlock,
                    errorBlock: @escaping NSErrorBlock){
        if let apiUrl = createURL(baseURL: apiHost + "/good" + pageUrl, params: LoginConfig.getaras()) {
            let apiUrlString = apiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            AF.request(apiUrlString, method: method, parameters: params, headers: headers).responseData { response in
                switch response.result {
                case .success(_):
                    if response.data != nil {
                        let jsonStr = NSString(data:response.data! ,encoding: String.Encoding.utf8.rawValue)
                        if let model = JSONDeserializer<BaseModel>.deserializeFrom(json: jsonStr as String?) {
                            if model.forgets == -2 {
                                complete(model)
                            }else {
                                complete(model)
                            }
                        }
                    }else {
                        errorBlock("")
                    }
                    break
                case .failure(let failure):
                    errorBlock(failure)
                    break
                }
            }
        }
    }
    
    func uploadAPI(params: [String: Any]?,
                   pageUrl: String,
                   method: HTTPMethod,
                   data: Data,
                   complete: @escaping CompleteBlock,
                   errorBlock: @escaping NSErrorBlock,
                   type: String){
        if let apiUrl = createURL(baseURL: apiHost + "/good" + pageUrl, params: LoginConfig.getaras()) {
            let apiUrlString = apiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            AF.upload(multipartFormData: { multipartFormData in
                if type == "image" {
                    multipartFormData.append(data, withName: "paleness", fileName: "paleness.png", mimeType: "image/png")
                }
                if let params = params {
                    for (key, value) in params {
                        let value :String! = value as? String
                        multipartFormData.append(value.data(using: .utf8)!, withName: key)
                    }
                }
            }, to: apiUrlString, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(_):
                    if response.data != nil {
                        let jsonStr = NSString(data:response.data! ,encoding: String.Encoding.utf8.rawValue)
                        if let model = JSONDeserializer<BaseModel>.deserializeFrom(json: jsonStr as String?) {
                            if model.forgets == -2 {
                                complete(model)
                            }else {
                                complete(model)
                            }
                        }
                    }else {
                        errorBlock("")
                    }
                    break
                case .failure(let failure):
                    errorBlock(failure)
                    break
                }
            }
        }
    }
    
    
    func createURL(baseURL: String, params: [String: String]) -> String? {
        guard var urlComponents = URLComponents(string: baseURL) else {
            return nil
        }
        var queryItems = [URLQueryItem]()
        for (key, value) in params {
            let queryItem = URLQueryItem(name: key, value: value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
            queryItems.append(queryItem)
        }
        urlComponents.queryItems = queryItems
        return urlComponents.url?.absoluteString
    }
    
}
