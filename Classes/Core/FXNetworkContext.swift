//
//  FXNetworkContext.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/4/7.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation
import ReachabilitySwift

public class FXNetworkContext{
    
    public static let sharedInstance = FXNetworkContext()
    
    var reachability: Reachability?
    
    public func isConnection() ->Bool {
        return currentStatus() != Reachability.NetworkStatus.notReachable
    }
    
    public func currentStatus() ->Reachability.NetworkStatus{
        return (reachability?.currentReachabilityStatus)!
    }
    
    public func singleInit(){
        reachability = Reachability()
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}
