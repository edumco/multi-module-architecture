//
//  HTTPClient.swift
//  NetworkingInterfaces
//
//  Created by Nykolas Mayko Maia Barbosa on 08/11/21.
//

import Foundation

public protocol Networking {
    func getHttpClient() -> HTTPClient
}

public protocol HTTPClient {
    func get(completion: @escaping (String) -> Void)
    func post(completion: @escaping (String) -> Void)
    func put(completion: @escaping (String) -> Void)
    func delete(completion: @escaping (String) -> Void)
}
