//
//  LoginLauncher.swift
//  Login
//
//  Created by Nykolas Mayko Maia Barbosa on 09/11/21.
//

import UIKit
import NetworkingInterfaces
import AnalyticsInterfaces
import Core

public class LoginLauncher {
    static public func start(baseFlowDelegate: BaseFlowDelegate?, httpClient: HTTPClient, analytics: AnalyticsProtocol) -> UIViewController {
        let businessModel = LoginBusinessModel(repository: LoginAPI(httpClient: httpClient), analytics: analytics)
        let factory = LoginViewControllerFactory(businessModel: businessModel, analytics: businessModel)
        let mainFlow = LoginFlow(factory: factory)
        mainFlow.baseFlowDelegate = baseFlowDelegate
        factory.flow = mainFlow
        
        return mainFlow.start(useCase: businessModel, analytics: businessModel)
    }
}
