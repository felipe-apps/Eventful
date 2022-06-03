//
//  BotoesFlutuantes.swift
//  Eventful
//
//  Created by Felipe Ferreira on 02/06/22.
//

import Foundation
import UIKit

struct BotoesFlutuantes {
    
    public static let buyButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        button.layer.cornerRadius = 30
        button.backgroundColor = .systemRed
        button.setTitle("Comprar ingresso", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        return button
    }()
    
    public static let closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.lightGray
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .label
        
        return button
    }()
    
    public static let shareButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.lightGray
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .label
        
        return button
    }()
    
}


