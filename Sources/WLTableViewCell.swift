//
//  WLTableViewCell.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/19.
//

import UIKit


protocol WLTableViewCellDelegate: NSObjectProtocol {
    func willLeftSliding() -> [WLRightItemView]
}

class WLTableViewCell: UITableViewCell {
    
    let scroll = WLScrollView()
    var itemBackView:WLRightItemBackView = WLRightItemBackView()
    
    weak var delegate:WLTableViewCellDelegate? {
        didSet {
            //添加view
            let viewArr = delegate?.willLeftSliding() ?? []
            self.itemBackView.addItemView(viewArr: viewArr)
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(scroll)
        scroll.uploadRightView = { [weak self] in
            self?.itemBackView.frame = CGRect.init(x: self!.frame.size.width, y: 0, width: self!.scroll.contentOffset.x, height: self!.frame.size.height)
            self?.itemBackView.uploadItemViewFrame()
            WLSweptManage.shared.cellWillSwep(view: self!)
        }
        scroll.slideStop = { [weak self] in
            
            if self!.scroll.contentOffset.x >= self!.itemBackView.itemBackViewWidth/2 {
                self?.scroll.setContentOffset(CGPoint.init(x: self!.itemBackView.itemBackViewWidth, y: 0), animated: true)
            } else {
                self?.scroll.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
            }
        }
        
        contentView.backgroundColor = .white
        contentView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action:#selector(contentViewTap)))
        scroll.addSubview(contentView)
        
        scroll.addSubview(itemBackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        scroll.frame = bounds
        contentView.frame = bounds
        
        scroll.contentSize = CGSize.init(width: itemBackView.itemBackViewWidth + frame.size.width, height: frame.size.height)
    }
    
    @objc func contentViewTap() {
        cancleSwept()
    }
    ///content被点击 发通知收起view
    func cancleSwept(finshBlock: ((Bool) -> Void)?  = nil) {
        
        UIView.animate(withDuration: 0.3) {
            self.scroll.contentOffset.x = 0
        } completion: { (finsh) in
            if finshBlock != nil {
                finshBlock?(finsh)
            }
        }
    }

}
