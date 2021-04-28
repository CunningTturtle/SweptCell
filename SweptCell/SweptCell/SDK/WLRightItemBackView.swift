//
//  RightItemBackView.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/19.
//

import UIKit

class WLRightItemBackView: UIView {

    var modelArr:[WLSweptItemModel] = []
    var itemBackViewWidth:CGFloat = 0
    fileprivate var rateArr:[CGFloat] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addItemView(models:[WLSweptItemModel]) {
        
        removeSubView()
        modelArr = models
        rateCreat()
        for model in modelArr {
            addSubview(model.contentView)
        }
        uploadItemViewFrame()
    }
    
    func uploadItemViewFrame(){
        
        var right:CGFloat = 0
        
        for idx in 0..<modelArr.count {
            
            let itemView = modelArr[idx].contentView
            itemView.frame = CGRect.init(x: right, y: 0, width: frame.size.width * rateArr[idx], height: frame.size.height)
            
            right += itemView.frame.size.width
        }
    }
    
    func rateCreat() {
        
        rateArr.removeAll()
        itemBackViewWidth = viewsWidth(models: modelArr)

        for model in modelArr {
            rateArr.append(model.contentView.frame.size.width / itemBackViewWidth)
        }
    }
    
    func viewsWidth(models: [WLSweptItemModel]) -> CGFloat {
        
        var viewWidth:CGFloat = 0
        
        for model in models {
            viewWidth += model.contentView.frame.size.width
        }
        return viewWidth
    }
}
