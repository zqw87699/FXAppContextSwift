//
//  FXAppContext.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/4/7.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation
import UIKit

class FXAppContext{
    //example:FXAppContext.sharedInstance.registerApp([FXSession.sharedInstance], launchOptions)
    
    static let sharedInstance = FXAppContext()
    
    func registerApp(_ launchContexts:Array<IFXLaunchProtocol>,_ options:[UIApplicationLaunchOptionsKey: Any]?){
        for context in launchContexts{
            context.registerApp(options)
            if ((context.childs?.count) != nil) {
                self.registerApp(context.childs!, options)
            }
        }
    }
}
