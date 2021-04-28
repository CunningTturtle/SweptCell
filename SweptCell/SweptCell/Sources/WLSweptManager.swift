//
//  WLSpreadsManager.swift
//  LateralSpreads
//
//  Created by admin on 2021/4/20.
//

import UIKit

class WLSweptManager: NSObject {

}

public enum WLSweptItemType {
    case nomal
    case alert
}
public class WLSweptItemModel: NSObject {
    public var itemType:WLSweptItemType = .nomal

    override init() {
        super.init()
    }
}
