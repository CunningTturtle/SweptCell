//
//  RightItemBackView.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/19.
//

import UIKit

class WLRightItemBackView: UIView,WLViewTools {

    var itemViewArr:[WLRightItemView] = []
    var itemBackViewWidth:CGFloat = 0
    fileprivate var rateArr:[CGFloat] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addItemView(viewArr:[WLRightItemView]) {
        
        itemViewArr = viewArr
        rateCreat()
        removeSubView()
        
        for itemView in itemViewArr {
            addSubview(itemView)
        }
    }
    
    func uploadItemViewFrame(){
        
        var right:CGFloat = 0
        
        for idx in 0..<itemViewArr.count {
            
            let itemView = itemViewArr[idx]
            itemView.frame = CGRect.init(x: right, y: 0, width: frame.size.width * rateArr[idx], height: frame.size.height)
            
            right += itemView.frame.size.width
        }
    }
    
    func rateCreat() {
        
        rateArr.removeAll()
        itemBackViewWidth = viewsWidth(viewArr: itemViewArr)

        for itemView in itemViewArr {
            rateArr.append(itemView.frame.size.width / itemBackViewWidth)
        }
    }
}
