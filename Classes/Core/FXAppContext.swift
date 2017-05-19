//
//  FXAppContext.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/4/7.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation
import UIKit

public class FXAppContext{
    //example:FXAppContext.sharedInstance.registerApp([FXSession.sharedInstance], launchOptions)
    
    public static let sharedInstance = FXAppContext()
    
    public func registerApp(_ launchContexts:Array<IFXLaunchProtocol>,_ options:[UIApplicationLaunchOptionsKey: Any]?){
        for context in launchContexts{
            context.registerApp(options)
            if context.childs != nil && (context.childs?.count)! > 0 {
                self.registerApp(context.childs!, options)
            }
        }
    }
}
