//
//  Helper.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 27/01/22.
//

import Foundation

import UIKit

class Helper {
    
    //MARK: - App Specific Strings
    static var appName : String = "Machine test"
    static var appUrl : String = "https://run.mocky.io/v3/2c09ade2-f01b-4d8c-9886-d781bb741328"
    
    //MARK: - App Colors
    static var TabSelectedColor : String = "#757576"
    
    //MARK: - To check internet connectivity
    static func checkInternetConnectivity() -> Bool {
        do {
            let reachability = try Reachability()
            if reachability.connection != .unavailable {
                return true
            } else {
                return false
            }
        }
        catch let err {
            print(err)
        }
        return false
    }
    
    //MARK: - Alert Message
    static func showAlert(message: String) {
        let alert = UIAlertController(title: appName, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        UIWindow.key?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

//MARK: - Extensions

//MARK: - Key Window
extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
