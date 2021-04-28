//
//  WLSweptManage.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/20.
//

import UIKit

public class WLSweptManage: NSObject {

    public static let shared = WLSweptManage()
    
    fileprivate var lastCell: WLTableViewCell?
    fileprivate var openCellArray: [WLTableViewCell] = []
    
    override init() {
        super.init()
    }
    
    /// 取消所有cell的侧滑
    public func cancleAllSwept() {
        
        for (idx,_) in openCellArray.enumerated().reversed()  {
            
            openCellArray[idx].cancleSwept(finshBlock: { [weak self] (finsh) in
                if idx <= (self?.openCellArray.count ?? 0) - 1 {
                    self?.openCellArray.remove(at: idx)
                }
            })
        }
    }
    
    func cellWillSwep(view:WLTableViewCell) {
        
        lastCell = view
        
        if openCellArray.contains(view) {
            
        } else {
            openCellArray.append(view)
        }
        
        for (idx,_) in openCellArray.enumerated().reversed() where openCellArray[idx] != lastCell && openCellArray[idx].scroll.contentOffset.x != 0 {
            
            openCellArray[idx].cancleSwept(finshBlock: { [weak self] (finsh) in
                if idx <= (self?.openCellArray.count ?? 0) - 1 {
                    self?.openCellArray.remove(at: idx)
                }
            })
        }
        
    }
}
