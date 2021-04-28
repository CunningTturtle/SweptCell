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
public class WLRightItemView: UIView {
    
    fileprivate weak var itemModel: WLSweptItemModel?

    init() {
        super.init(frame: CGRect.zero)
        configUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    init(model:WLSweptItemModel) {
        super.init(frame: CGRect.zero)

        itemModel = model
        configUI()
    }
    
    func configUI() {
        
        frame = CGRect.init(x: UIApplication.shared.windows.first!.frame.size.width, y: 0, width: itemModel?.itemWidth ?? 0, height: 0)
        addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(viewTap)))
    }
    
    public override func layoutSubviews() {
        
        if frame.size.width <= 0 {
            itemModel?.viewStatus = .didClose
        } else if frame.size.width == itemModel?.itemWidth {
            itemModel?.viewStatus = .didShow
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func viewTap() {
        
        itemModel?.didTapItem()
    }

    
    func lookForSuperCellView() -> WLTableViewCell? {
        if let view = getSuperView(viewType:UITableViewCell.self) as? WLTableViewCell  {
            return view
        } else {
            return nil
        }
        
    }

}
