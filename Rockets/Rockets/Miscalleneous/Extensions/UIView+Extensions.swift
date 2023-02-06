//
//  UIView+Extensions.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 06/02/2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach(self.addSubview)
    }
    
}
