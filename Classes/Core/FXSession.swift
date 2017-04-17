//
//  FXSession.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/4/7.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReachabilitySwift

/**
 *  用户登录通知
 */
public let FXUserLoginedNotification = NSNotification.Name("FXUserLoginedNotification")
/**
 *  用户注销通知
 */
public let FXUserLogoutNotification = NSNotification.Name("FXUserLogoutNotification")
/**
 *  网络环境变化
 */
public let FXNetworkChangedNotification = NSNotification.Name("FXNetworkChangedNotification")

public class FXSession:IFXLaunchProtocol{
    
    var refLock:NSLock?
    
    public static let sharedInstance = FXSession()
    
    public func registerApp(_ launchOptions: [UIApplicationLaunchOptionsKey: Any]?){
        refLock = NSLock.init()
        
        FXNetworkContext.sharedInstance.singleInit()
        
        weak var selfObject = self
        NotificationCenter.default.reactive.notifications(forName: ReachabilityChangedNotification, object: nil).observeValues{notification in
            selfObject?.refLock?.lock()
            NotificationCenter.default.post(name: FXNetworkChangedNotification, object: self)
            selfObject?.refLock?.unlock()
        }
    }
    
    public func logined(){
        refLock?.lock()
        
        NotificationCenter.default.post(name: FXUserLoginedNotification, object: self)
        refLock?.unlock()
    }
    
    public func logout(){
        refLock?.lock()
        NotificationCenter.default.post(name: FXUserLogoutNotification, object: self)
        refLock?.unlock()
    }
    
}
