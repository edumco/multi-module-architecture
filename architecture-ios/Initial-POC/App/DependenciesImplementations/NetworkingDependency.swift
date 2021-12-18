//
//  NetworkingDependency.swift
//  App
//
//  Created by Nykolas Mayko Maia Barbosa on 14/12/21.
//

import Foundation
import Networking
import AppSecurityInterfaces

class NetworkingDependency: NetworkingDependencyProtocol {
    private var security: AppSecurityProviderProtocol
    
    init(security: AppSecurityProviderProtocol) {
        self.security = security
    }
    
    func getCertificate(with publicKey: String) -> String {
        return security.getCertificate(with: publicKey)
    }
}
