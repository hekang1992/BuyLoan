//
//  BBConfig.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit
import Foundation
import Lottie
import BRPickerView

let Heavy_Mont = "Mont-Heavy"

let Regular_Mont = "Mont-Regular"

let CL_SESSIONID = "SESSIONID"

let CL_LOGIN = "LOGIN"

let HOME_VC = "HOME_VC"

let SCREEN_WIDTH = UIScreen.main.bounds.size.width

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

extension Double {
    func alpix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension CGFloat {
    func alpix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension Int {
    func alpix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            self.init(white: 0.0, alpha: 0.0)
            return
        }
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UILabel {
    static func chuangjianLabel(font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) -> PaddedLabel {
        let label = PaddedLabel()
        label.backgroundColor = UIColor.clear
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.font = font
        return label
    }
}

extension Data {
    static func yasuoQuality(image: UIImage, maxLength: Int) -> Data? {
        var compression: CGFloat = 0.8
        var minCompression: CGFloat = 0.0
        var maxCompression: CGFloat = 1.0
        var data = image.jpegData(compressionQuality: compression)
        if let imageData = data, imageData.count <= maxLength {
            return imageData
        }
        repeat {
            compression = (maxCompression + minCompression) / 2.0
            data = image.jpegData(compressionQuality: compression)
            guard let imageData = data else { break }
            if imageData.count <= maxLength {
                minCompression = compression
            } else {
                maxCompression = compression
            }
        } while abs(maxCompression - minCompression) > 0.01
        return data
    }
}



/************************************************/

class NoCopyField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) ||
            action == #selector(paste(_:)) ||
            action == #selector(cut(_:)) ||
            action == #selector(select(_:)) ||
            action == #selector(selectAll(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}

/************************************************/

class loadingView: UIView {
    
    lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        return view
    }()
    
    lazy var hudView: LottieAnimationView = {
        let hudView = LottieAnimationView(name: "loading.json", bundle: Bundle.main)
        hudView.loopMode = .loop
        hudView.play()
        return hudView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(grayView)
        grayView.addSubview(hudView)
        grayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hudView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 120.alpix(), height: 200.alpix()))
        }
    }
}

class ViewHud {
    
    static let loadView = loadingView()
    
    static func addLoadView() {
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.windows.first {
                DispatchQueue.main.async {
                    loadView.frame = keyWindow.bounds
                    keyWindow.addSubview(loadView)
                }
            }
        }
    }
    
    static func hideLoadView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            loadView.removeFromSuperview()
        }
    }
    
}

/************************************************/

class delayTime {
    
    static func delay(_ delay: TimeInterval, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }

}


class CLTabBarConfig {
    
    static var safeAreaBottomHeight:CGFloat {
        var safeHeight:CGFloat = 0;
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.delegate!.window!!
            safeHeight = window.safeAreaInsets.bottom
        }
        return safeHeight
    }
    
    static var tabBarHeight:CGFloat {
        return 49 + safeAreaBottomHeight
    }
    
}



class yijiModel {
    static func getyijiArr(dataSourceArr: [Any]) -> [BRProvinceModel] {
        var result = [BRProvinceModel]()
        for proviceDic in dataSourceArr {
            guard let proviceDic = proviceDic as? unfavourableModel else {
                continue
            }
            let proviceModel = BRProvinceModel()
            proviceModel.code = proviceDic.acerbities
            proviceModel.name = proviceDic.faults
            proviceModel.index = dataSourceArr.firstIndex(where: { $0 as AnyObject === proviceDic as AnyObject }) ?? 0
            result.append(proviceModel)
        }
        return result
    }
}

class sanjiModel {
    static func getsanjiArr(dataSourceArr: [Any]) -> [BRProvinceModel] {
        var tempArr1 = [BRProvinceModel]()
        for proviceDic in dataSourceArr {
            guard let proviceDic = proviceDic as? reliancemodel else {
                continue
            }
            let proviceModel = BRProvinceModel()
            proviceModel.code = proviceDic.relied
            proviceModel.name = proviceDic.faults
            proviceModel.index = dataSourceArr.firstIndex(where: { $0 as AnyObject === proviceDic as AnyObject }) ?? 0
            let cityList = proviceDic.reliance ?? proviceDic.reliance ?? []
            var tempArr2 = [BRCityModel]()
            for cityDic in cityList {
                let cityModel = BRCityModel()
                cityModel.code = cityDic.relied
                cityModel.name = cityDic.faults
                cityModel.index = cityList.firstIndex(where: { $0 as AnyObject === cityDic as AnyObject }) ?? 0
                let areaList = cityDic.reliance ?? cityDic.reliance ?? []
                var tempArr3 = [BRAreaModel]()
                for areaDic in areaList {
                    let areaModel = BRAreaModel()
                    areaModel.code = areaDic.relied
                    areaModel.name = areaDic.faults
                    areaModel.index = areaList.firstIndex(where: { $0 as AnyObject === areaDic as AnyObject }) ?? 0
                    tempArr3.append(areaModel)
                }
                cityModel.arealist = tempArr3
                tempArr2.append(cityModel)
            }
            proviceModel.citylist = tempArr2
            tempArr1.append(proviceModel)
        }
        return tempArr1
    }
}

class erjiModel {
    static func geterjiArr(dataSourceArr: [Any]) -> [BRProvinceModel] {
        var tempArr1 = [BRProvinceModel]()
        for proviceDic in dataSourceArr {
            guard let proviceDic = proviceDic as? unfavourableModel else {
                continue
            }
            let proviceModel = BRProvinceModel()
            proviceModel.code = proviceDic.acerbities
            proviceModel.name = proviceDic.faults
            proviceModel.index = dataSourceArr.firstIndex(where: { $0 as AnyObject === proviceDic as AnyObject }) ?? 0
            let cityList = proviceDic.unfavourable ?? proviceDic.unfavourable ?? []
            var tempArr2 = [BRCityModel]()
            for cityDic in cityList {
                let cityModel = BRCityModel()
                cityModel.code = cityDic.acerbities
                cityModel.name = cityDic.faults
                cityModel.index = cityList.firstIndex(where: { $0 as AnyObject === cityDic as AnyObject }) ?? 0
                let areaList = cityDic.unfavourable ?? cityDic.unfavourable ?? []
                var tempArr3 = [BRAreaModel]()
                for areaDic in areaList {
                    let areaModel = BRAreaModel()
                    areaModel.code = areaDic.acerbities
                    areaModel.name = areaDic.faults
                    areaModel.index = areaList.firstIndex(where: { $0 as AnyObject === areaDic as AnyObject }) ?? 0
                    tempArr3.append(areaModel)
                }
                cityModel.arealist = tempArr3
                tempArr2.append(cityModel)
            }
            proviceModel.citylist = tempArr2
            tempArr1.append(proviceModel)
        }
        return tempArr1
    }
}
