//
//  Utilities.swift
//  Eventful
//
//  Created by Felipe Ferreira on 31/05/22.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textField:UITextField) {
        
        let textFieldStyle = CALayer()
        
        textFieldStyle.frame = CGRect(x: -20, y: 0, width: textField.frame.width + 20, height: textField.frame.height)
        textFieldStyle.cornerRadius = 20
        textFieldStyle.shadowOffset.height = 8
        textFieldStyle.shadowOffset.width = 4
        textFieldStyle.shadowRadius = 5
        textFieldStyle.backgroundColor = UIColor.init(red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        textField.borderStyle = .none
        
        textField.layer.addSublayer(textFieldStyle)
       
    }
    
    static func styleHollowButton(_ button: UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
