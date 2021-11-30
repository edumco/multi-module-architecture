//
//  ProfileStarter.swift
//  ProfileDemo
//
//  Created by Nykolas Mayko Maia Barbosa on 30/11/21.
//

import UIKit
import Core
import Profile

class ProfileStarter: ModuleStarter {
    
    init() {}
    
    func start(from url: URL?, with baseFlowDelegate: BaseFlowDelegate, _ baseFlowDataSource: BaseFlowDataSource, _ customModuleAnalytics: JourneyModuleAnalyticsProtocol?, _ subJourney: JourneyModule?) -> UIViewController {
        let profileDependencies = ProfileDependencies(url, baseFlowDelegate, baseFlowDataSource, StructuralDependencyProvider.networking, StructuralDependencyProvider.analytics, customModuleAnalytics as? ProfileAnalyticsProtocol
        )
        
        return ProfileLauncher.start(with: profileDependencies)
    }
    
    func canStart() -> Bool {
        return isUserLoggedIn
    }
    
    func getPath() -> String {
        return "profile"
    }
    
    func handleGo(to journey: JourneyModule, in viewController: UIViewController, with value: Any?) {
        switch journey {
        case .home:
            AppNavigation.shared.set([.home], from: viewController, animated: true)
            break
            
        default: break
        }
    }
    
    func handleGet(from journey: JourneyModule, to subJourney: JourneyModule?, with baseFlowDelegate: BaseFlowDelegate, analytics: JourneyModuleAnalyticsProtocol?) -> UIViewController {
        return start(from: nil, with: baseFlowDelegate, AppNavigation.shared, analytics, subJourney)
    }
}
