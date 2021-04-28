//
//  WLTableViewCell.swift
//  SweptCell
//
//  Created by admin on 2021/4/28.
//

import UIKit

public class WLTableViewCell: UITableViewCell {
    
    let scroll:WLScrollerView = {
        let view = WLScrollerView()
        return view
    }()
    
    public weak var delegate:WLTableViewCellDelegate? {
        didSet {
            uploadScroll()
        }
    }
    let itemBackView:WLRightItemBackView = WLRightItemBackView()

    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        scroll.frame = bounds
        scroll.contentSize = CGSize.init(width: itemBackView.itemBackViewWidth + frame.size.width, height: frame.size.height)
    }
    
    func uploadScroll() {
        
        let modelArr = delegate?.willLeftSliding() ?? []

        if canSwept() && modelArr.count > 0 {

            itemBackView.frame = CGRect.init(x: frame.size.width, y: 0, width: scroll.contentOffset.x, height: frame.size.height)
            itemBackView.addItemView(models: modelArr)
        } else {
            
            scroll.contentSize = CGSize.init(width: bounds.size.width , height: bounds.size.height)
        }
    }
    
    func configUI() {
        
        contentView.backgroundColor = .black
        
        scroll.addSubview(contentView)
        addSubview(scroll)
        
        scroll.uploadRightView = { [weak self] in
            self?.itemBackView.frame = CGRect.init(x: self!.frame.size.width, y: 0, width: self!.scroll.contentOffset.x, height: self!.frame.size.height)
            self?.itemBackView.uploadItemViewFrame()
            WLSweptManage.shared.cellWillSwep(view: self!)
        }
        
        scroll.contentSize = CGSize.init(width: frame.size.width, height: bounds.size.height)
        scroll.addSubview(itemBackView)
    }
    
    /// 是否可以侧滑
    func canSwept() -> Bool {
        return delegate != nil
    }
    
    func cancleSwept(finshBlock: ((Bool) -> Void)? = nil) {
        
        scroll.chanageScrollContent(x: 0, system: false) {
            finshBlock?(true)
        }
    }
}
