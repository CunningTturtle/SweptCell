//
//  WLProtocol.swift
//  SweptCell
//
//  Created by admin on 2021/4/28.
//

import Foundation

public protocol WLTableViewCellDelegate: NSObjectProtocol {
    func willLeftSliding() -> [WLSweptItemModel]
}
extension WLTableViewCellDelegate {
    func willLeftSliding() -> [WLSweptItemModel] { [] }
}
