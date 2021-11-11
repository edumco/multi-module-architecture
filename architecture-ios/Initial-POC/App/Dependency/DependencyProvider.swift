//
//  DependencyProvider.swift
//  App
//
//  Created by Nykolas Mayko Maia Barbosa on 09/11/21.
//

import NetworkingInterfaces
import Networking
import AnalyticsInterfaces
import Analytics

class DependencyProvider {
    static var networking: Networking = {
        return Networking()
    }()
    
    static var analytics: AnalyticsProtocol = {
        return Analytics()
    }()
}
