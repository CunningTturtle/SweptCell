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
}

protocol WLViewTools {
    func viewsWidth(viewArr: [WLRightItemView]) -> CGFloat
}

extension WLViewTools {
    func viewsWidth(viewArr: [WLRightItemView]) -> CGFloat {
        
        var viewWidth:CGFloat = 0
        
        for itemView in viewArr {
            viewWidth += itemView.frame.size.width
        }
        return viewWidth
    }
}
