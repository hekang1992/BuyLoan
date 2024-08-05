//
//  LoginConfig.swift
//  CreditLoan
//
//  Created by apple on 2024/7/30.
//

import UIKit
import AdSupport
import SAMKeychain
import DeviceKit
import SystemConfiguration
import AppTrackingTransparency

var IS_LOGIN: Bool {
    let us = UserDefaults.standard
    if let session = us.object(forKey: CL_SESSIONID) as? String {
        return !session.isEmpty
    } else {
        return false
    }
}

class LoginConfig: NSObject {
    
    static func getVersion() -> String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "1.0.0"
    }
    
    static func getaras() -> [String: String]{
        let befell = CLDeviceInfo.usingProxy()
        let nullified: String = "iOS"
        let overturned: String = UIDevice.current.systemVersion
        var declamation: String = ""
        if let sessionId: String = UserDefaults.standard.object(forKey: CL_SESSIONID) as? String {
            declamation = sessionId
        }
        let observation: String = "cll"
        let fundamental: String = CLDeviceInfo.getIDFV() ?? ""
        let farther = CLDeviceInfo.vpnConnected()
        let built: String = getVersion()
        let objectionable: String = Device.current.description
        let virtuous: String = CLDeviceInfo.getIDFV() ?? ""
        
        let dict1 = ["nullified": nullified,
                     "built": built,
                     "virtuous": virtuous,
                     "befell": befell,
                     "farther": farther,
                     "objectionable": objectionable,
                     "zeeker": "001"]
        
        let dict2 = ["declamation": declamation,
                     "fundamental": fundamental,
                     "egg": "1",
                     "overturned": overturned,
                     "observation": observation,
                     "type": "1",
                     "islogin": "1"]
        
        let allDict = dict2.reduce(into: dict1) { (result, item) in
            result[item.key] = item.value
        }
        return allDict
    }
    
    static func removeLoginInfo() {
        UserDefaults.standard.setValue("", forKey: CL_LOGIN)
        UserDefaults.standard.setValue("", forKey: CL_SESSIONID)
        UserDefaults.standard.synchronize()
    }
    
    static func saveLoginInfo(_ phoneNumber: String, _ authID: String) {
        UserDefaults.standard.setValue(authID, forKey: CL_SESSIONID)
        UserDefaults.standard.setValue(phoneNumber, forKey: CL_LOGIN)
        UserDefaults.standard.synchronize()
    }
    
}


class CLDeviceInfo {
    
    static func requestIDFA(completion: @escaping (String?) -> Void) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    let idfa = ASIdentifierManager.shared().advertisingIdentifier
                    completion(idfa.uuidString)
                case .denied, .restricted, .notDetermined:
                    completion(nil)
                @unknown default:
                    completion(nil)
                }
            }
        } else {
            let idfa = ASIdentifierManager.shared().advertisingIdentifier
            completion(idfa.uuidString)
        }
    }
    
    static func getIDFV() -> String? {
        if let uuid = SAMKeychain.password(forService: "Key_Service", account: "Key_Account"), !uuid.isEmpty {
            return uuid
        } else {
            if let deviceIDFV = UIDevice.current.identifierForVendor?.uuidString {
                let success = SAMKeychain.setPassword(deviceIDFV, forService: "Key_Service", account: "Key_Account")
                if success {
                    return deviceIDFV
                } else {
                    return ""
                }
            } else {
                return ""
            }
        }
    }
    
    static func usingProxy() -> String {
        if let proxySettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [AnyHashable: Any],
           let proxies = CFNetworkCopyProxiesForURL(URL(string: "https://www.google.com")! as CFURL, proxySettings as CFDictionary).takeRetainedValue() as? [Any],
           let settings = proxies.first as? [AnyHashable: Any],
           let proxyType = settings[kCFProxyTypeKey] as? String {
            if proxyType == kCFProxyTypeNone as String {
                return "0"
            } else {
                return "1"
            }
        }
        return "0"
    }
    
    static func vpnConnected() -> String {
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sa_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return "0"
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return "0"
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return isReachable && !needsConnection ? "1" : "0"
    }
    
    static func getCurrentTime() -> String {
        let currentTime = Date().timeIntervalSince1970
        let currentTimeMillis = String(Int64(currentTime * 1000))
        return currentTimeMillis
    }
    
}
