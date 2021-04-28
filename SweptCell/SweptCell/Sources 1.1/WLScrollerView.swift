//
//  WLScrollerView.swift
//  SweptCell
//
//  Created by admin on 2021/4/28.
//

import UIKit

enum WLScrollType {
    case beginScroll
    case scrollIng
    case endScroll
}

class WLScrollerView: UIScrollView,UIScrollViewDelegate {

    var willBegin:(()->Void)?
    var uploadRightView:(()->Void)?
    var stateDidChanage:((WLScrollType)->Void)?
    var scrollState:WLScrollType = .endScroll {
        didSet {
            stateDidChanage?(scrollState)
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
        delegate = self
        backgroundColor = .red
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator   = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    ///正在滑动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let point = panGestureRecognizer.translation(in: self)
        //控制滑动方向
        bounces = point.x < 0
        if contentOffset.x <= 0 {
            setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
        }
        
        //修改滑动状态
        if scrollState == .beginScroll {
            scrollState = .scrollIng
        }
        if scrollState == .endScroll && scrollView.contentOffset.x <= 0{
            scrollState = .beginScroll
        }
        
        uploadRightView?()
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
        
        scrollState = .endScroll
        
        let width = contentSize.width - frame.size.width
        if contentOffset.x >= width/2 {
            UIView.animate(withDuration: 0.3) {
                self.contentOffset = CGPoint.init(x: width, y: 0)
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.contentOffset = CGPoint.init(x: 0, y: 0)
            }
        }
    }
    
    
    /// 修改 ContentOffset
    /// - Parameters:
    ///   - x: x 值
    ///   - system: 是否采用系统的方法 系统的方法会触发代理回调
    func chanageScrollContent(x:CGFloat,system:Bool,finshBlock:(()->Void)? = nil) {
        
        let point = CGPoint.init(x: x, y: 0)
        if system {
            setContentOffset(point, animated: true)
        } else {
            UIView.animate(withDuration: 0.3) {
                self.contentOffset = point
            } completion: { finsh in
                if finsh {
                    self.scrollState = .endScroll
                }
                finshBlock?()
            }
        }
    }
}
