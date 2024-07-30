//
//  LoginConfig.swift
//  CreditLoan
//
//  Created by apple on 2024/7/30.
//

import UIKit
import AdSupport
import AppTrackingTransparency
import SAMKeychain
import SystemConfiguration
import DeviceKit

class LoginConfig: NSObject {

    static func getAppVersion() -> String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Version information not available"
    }

    static func getaras() -> [String: String]{
//        let overturned: String = UIDevice.current.systemVersion
//        var baffled: String = ""
//        if let sessionId: String = UserDefaults.standard.object(forKey: SESSIONID) as? String {
//            baffled = sessionId
//        }
//        let walkflat: String = "siccs"
//        let period: String = PADeviceInfo.getIDFV() ?? ""
//        let basket = PADeviceInfo.usingProxy()
//        let nullified: String = "iOS"
//        let change: String = "pc"
//        let peach = PADeviceInfo.vpnConnected()
//        let seehow: String = getAppVersion()
//        let egyptians: String = Device.current.description
//        let declared: String = PADeviceInfo.getIDFV() ?? ""
//        let total = "14"
//        let monthly = "8"
//        let amount = "13"
//        
//        let dict1 = ["nullified": nullified,
//                    "seehow": seehow,
//                    "egyptians": egyptians,
//                    "declared": declared,
//                     "total": total,
//                     "monthly": monthly,
//                     "amount": amount]
//        
//        let dict2 = ["overturned": overturned,
//                     "walkflat": walkflat,
//                     "baffled": baffled,
//                     "period": period,
//                     "change": change,
//                     "peach": peach,
//                     "basket": basket]
//        
//        let allDict = dict2.reduce(into: dict1) { (result, item) in
//            result[item.key] = item.value
//        }
//        return allDict
    }
    
    static func saveLoginInfo(_ phone: String, _ sessionID: String) {
        UserDefaults.standard.setValue(phone, forKey: LOGIN)
        UserDefaults.standard.setValue(sessionID, forKey: SESSIONID)
        UserDefaults.standard.synchronize()
    }
    
    static func removeLoginInfo() {
        UserDefaults.standard.setValue("", forKey: LOGIN)
        UserDefaults.standard.setValue("", forKey: SESSIONID)
        UserDefaults.standard.synchronize()
    }
    
}


class PADeviceInfo {
    
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
                    print("UUID>>>>>>>>\(deviceIDFV)")
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
