//
//  FXNetworkContext.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/4/7.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation
import ReachabilitySwift

class FXNetworkContext{
    
    static let sharedInstance = FXNetworkContext()
    
    var reachability: Reachability?
    
    func isConnection() ->Bool {
        return currentStatus() != Reachability.NetworkStatus.notReachable
    }
    
    func currentStatus() ->Reachability.NetworkStatus{
        return (reachability?.currentReachabilityStatus)!
    }
    
    func singleInit(){
        reachability = Reachability()
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}
