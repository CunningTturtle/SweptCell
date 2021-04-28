//
//  WLSweptItemModel.swift
//  SweptCell
//
//  Created by admin on 2021/4/28.
//

import UIKit

public enum WLSweptItemType {
    ///一般类型
    case nomal
    ///点击先弹开 在次点击收起
    case alert
}

public class WLSweptItemModel: NSObject {
    
    ///类型
    public var itemType: WLSweptItemType = .nomal
    ///宽度
    public var itemWidth: CGFloat = 40
    ///被点击的回调
    public var willClose: ((inout Bool)->Void)?
    ///将要出现弹窗的回调
    public var willAlert: ((WLRightItemView) -> Void)?
    
    public var contentView:  WLRightItemView {
        get {
            return content
        }
    }
    private var content:WLRightItemView!
    var viewStatus:WLItemViewStats = .didShow
    var didFinsh = false {
        didSet {
            if didFinsh == true {
                contentView.lookForSuperCellView()?.cancleSwept()
                viewStatus = .didClose
            }
        }
    }
    
    override init() {
        super.init()
        
        content = WLRightItemView.init(model: self)
    }
    
    
    func didTapItem() {
        
        switch itemType {
        
        case .nomal:
            viewStatus = .willClose
            willClose?(&didFinsh)
            
        case .alert:
            
            alertTypeClick()
        }
    }
    
    func alertTypeClick() {
        
        switch viewStatus {
        
        case .didShow:
            
            viewStatus = .showAlertUI
            contentView.superview?.bringSubviewToFront(contentView)
            willAlert?(contentView)

            UIView.animate(withDuration: 0.3) {
                self.contentView.frame = self.contentView.superview?.bounds ?? CGRect.zero
            }
        case .showAlertUI:
            
            viewStatus = .willClose
            willClose?(&didFinsh)
        default:
            break
        }
    }
    
    
}
