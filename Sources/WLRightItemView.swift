//
//  RightItemView.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/19.
//

import UIKit

enum WLItemViewStats {
    case didShow
    case showAlertUI
    case willClose
    case didClose
}
open class WLRightItemView: UIView {
    
    fileprivate var itemModel = WLSweptItemModel()
    fileprivate var tapBlock:((inout Bool)->Void)?
    fileprivate var itemStats:WLItemViewStats = .didShow
    fileprivate var fillWidth:CGFloat = 0
    fileprivate var didFinsh = false {
        didSet {
            lookForSuperCellView()?.cancleSwept()
            itemStats = .didClose
        }
    }
    public init() {
        super.init(frame: CGRect.zero)
        configUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    public init(width:CGFloat,model:((WLSweptItemModel) -> Void),tapClick:@escaping ((inout Bool)->Void)) {
        super.init(frame: CGRect.zero)
        
        fillWidth = width
        frame = CGRect.init(x: 0, y: 0, width: width, height: 0)
        itemStats = .didShow
        model(itemModel)
        tapBlock = tapClick
        configUI()
    }
    
    func configUI() {
        addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(viewTap)))
    }
    
    public override func layoutSubviews() {
        
        if frame.size.width <= 0 {
            itemStats = .didClose
        } else if frame.size.width == fillWidth {
            itemStats = .didShow
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func viewTap() {
        
        switch itemModel.itemType {
        
        case .nomal:
            itemStats = .willClose
            tapBlock?(&didFinsh)
            break
            
        case .alert:
            
            switch itemStats {
            
            case .didShow:
                itemStats = .showAlertUI
                superview?.bringSubviewToFront(self)
                UIView.animate(withDuration: 0.3) {
                    self.frame = self.superview?.bounds ?? CGRect.zero
                }
                
            case .showAlertUI:
                itemStats = .willClose
                tapBlock?(&didFinsh)
            default:
                break
            }
            break
        }
    }
    


    
    func lookForSuperCellView() -> SweptCell? {
        if let view = getSuperView(viewType:UITableViewCell.self) as? SweptCell  {
            return view
        } else {
            return nil
        }
        
    }

}
