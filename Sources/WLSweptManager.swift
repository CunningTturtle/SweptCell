//
//  WLSpreadsManager.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/20.
//

import UIKit


public enum WLSweptItemType {
    case nomal
    case alert
}
class WLSweptItemModel: NSObject {
    var itemType:WLSweptItemType = .nomal

    override init() {
        super.init()
    }
}
