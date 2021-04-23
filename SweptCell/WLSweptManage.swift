//
//  WLSweptManage.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/20.
//

import UIKit

class WLSweptManage: NSObject {

    static let shared = WLSweptManage()
    var lastCell: WLTableViewCell?
    var openCellArray: [WLTableViewCell] = []
    
    override init() {
        super.init()
    }
    
    
    func cellWillSwep(view:WLTableViewCell) {
        
        lastCell = view
        
        if openCellArray.contains(view) {
            
        } else {
            openCellArray.append(view)
        }
        
        for idx in 0..<openCellArray.count where openCellArray[idx] != lastCell && openCellArray[idx].scroll.contentOffset.x != 0 {
            openCellArray[idx].cancleSwept()
        }
    
    }
}
