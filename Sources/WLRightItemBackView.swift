//
//  RightItemBackView.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/19.
//

import UIKit

open class WLRightItemBackView: UIView,WLViewTools {

    public var itemViewArr:[WLRightItemView] = []
    public var itemBackViewWidth:CGFloat = 0
    public var rateArr:[CGFloat] = []
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func addItemView(viewArr:[WLRightItemView]) {
        
        itemViewArr = viewArr
        rateCreat()
        removeSubView()
        
        for itemView in itemViewArr {
            addSubview(itemView)
        }
    }
    
    public func uploadItemViewFrame(){
        
        var right:CGFloat = 0
        
        for idx in 0..<itemViewArr.count {
            
            let itemView = itemViewArr[idx]
            itemView.frame = CGRect.init(x: right, y: 0, width: frame.size.width * rateArr[idx], height: frame.size.height)
            
            right += itemView.frame.size.width
        }
    }
    
    public func rateCreat() {
        
        rateArr.removeAll()
        itemBackViewWidth = viewsWidth(viewArr: itemViewArr)

        for itemView in itemViewArr {
            rateArr.append(itemView.frame.size.width / itemBackViewWidth)
        }
    }
}
