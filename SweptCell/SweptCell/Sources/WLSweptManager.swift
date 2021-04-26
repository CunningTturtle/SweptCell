//
//  WLSpreadsManager.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/20.
//

import UIKit

class WLSweptManager: NSObject {

}

enum WLSweptItemType {
    case nomal
    case alert
}
public class WLSweptItemModel: NSObject {
    var itemType:WLSweptItemType = .nomal

    override init() {
        super.init()
    }
}
