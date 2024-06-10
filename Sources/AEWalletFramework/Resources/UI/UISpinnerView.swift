//
//  UISpinnerView.swift
//  
//
//  Created by aksh gaur on 06/06/24.
//

import Foundation
import UIKit

class UISpinnerView: UIActivityIndicatorView {
    override init(style: UIActivityIndicatorView.Style = .large) {
        super.init(style: style)
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
