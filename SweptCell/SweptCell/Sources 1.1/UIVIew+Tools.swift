//
//  WLBaseView.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/20.
//

import UIKit



extension UIView {
    
    func removeSubView() {
        for subView in subviews {
            subView.removeFromSuperview()
        }
    }
    
    func getSuperView<T>(viewType: T) -> UIView? {
        
        if ((superview?.superclass as? T) != nil) {
            
            return superview
        } else {
            
            return superview?.superview?.getSuperView(viewType: viewType) ?? nil
        }
    }
}
