//
//  ProfileAPI.swift
//  Profile
//
//  Created by Nykolas Mayko Maia Barbosa on 09/11/21.
//

import Foundation
import NetworkingInterfaces

class ProfileAPI: ProfileRepositoryProtocol {
    private let network: NetworkingProviderProtocol
    
    init(network: NetworkingProviderProtocol) {
        self.network = network
    }
}
