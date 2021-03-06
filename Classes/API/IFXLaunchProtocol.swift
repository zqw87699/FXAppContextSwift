//
//  IFXRegisterProtocol.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/4/6.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol IFXLaunchProtocol {
    
    func registerApp(_ launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
    
    @objc optional
    var childs:Array<IFXLaunchProtocol>{get}
}
