//
//  WLScrollView.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/19.
//

import UIKit
 
class WLScrollView: UIScrollView,UIScrollViewDelegate {
    
    var uploadRightView:(()->Void)?
    var slideStop:(()->Void)?
    ///是否正在滚动
    var isScrollIng = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSet()
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.configSet()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSet() {
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator   = false
        backgroundColor = .red
        delegate = self
    }
}

extension WLScrollView {
    
    ///正在滑动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let point = panGestureRecognizer.translation(in: self)
        //控制滑动方向
        bounces = point.x < 0
        if contentOffset.x <= 0 {
            setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
        }
        uploadRightView?()
        isScrollIng = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        scrollViewCorrection()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if !decelerate {
            scrollViewCorrection()
        }
    }
    
    ///滑动停止
    func scrollViewCorrection() {
        
        isScrollIng = false
        slideStop?()
    }

}
