//
//  Reachability.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 13/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

import SystemConfiguration

class Reachability {
    static func isNetworkReachable() -> Bool {
        let reachability = SCNetworkReachabilityCreateWithName(nil, "localhost")!
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
    }
}
