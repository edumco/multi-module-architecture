//
//  LoginStarter.swift
//  HomeDemo
//
//  Created by Nykolas Mayko Maia Barbosa on 30/11/21.
//

import UIKit
import Core
import Login

class LoginStarter: ModuleStarter {
    
    init() {}
    
    func start(from url: URL?, with baseFlowDelegate: BaseFlowDelegate, _ baseFlowDataSource: BaseFlowDataSource, _ customModuleAnalytics: JourneyModuleAnalyticsProtocol?, _ subJourney: JourneyModule?, _ value: Any?) -> UIViewController {
        let loginDependencies = LoginDependencies(url, baseFlowDelegate, StructuralDependencyProvider.networking, StructuralDependencyProvider.analytics, customModuleAnalytics as? LoginAnalyticsProtocol, value)
        
        var startViewController: UIViewController = LoginLauncher.start(with: loginDependencies)
        
        if let subJourney = subJourney {
            switch subJourney {
            case .forgotPassword:
                startViewController = LoginLauncher.startForgotPassword(with: loginDependencies)
            default: break
            }
        }
        
        return startViewController
    }
    
    func canStart() -> Bool {
        return isAppLaunched && !isUserLoggedIn
    }
    
    func getPath() -> String {
        return "login"
    }
    
    func handleGo(to journey: JourneyModule, in viewController: UIViewController, with value: Any?) {
        isUserLoggedIn = journey == .home
        AppNavigation.shared.show([.home], from: viewController, animated: true)
        AppNavigation.shared.resolveDeeplinkIfNeeded()
        
    }
    
    func handleGet(from journey: JourneyModule, to subJourney: JourneyModule?, with baseFlowDelegate: BaseFlowDelegate, analytics: JourneyModuleAnalyticsProtocol?) -> UIViewController {
        switch journey {
        default: return AppNavigation.shared.start(.login, from: journey, baseFlowDelegate: baseFlowDelegate)
        }
    }
}
