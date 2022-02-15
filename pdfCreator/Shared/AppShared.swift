//
//  AppShared.swift
//  Taxation
//
//  Created by Admin on 1/28/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AppShared {
    static let shared = AppShared()
    
    class func getAlert(title: String?, msg: String?, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alertTitle = title == nil ? "Taxation" : title
        let alert = UIAlertController(title: alertTitle, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: handler)
        alert.addAction(cancel)
        return alert
    }
    
    class func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    class func getDateString(from date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format

        let strDate = formatter.string(from:date)
        
        return strDate
    }
}
