//
//  ProfileHomeViewController.swift
//  Profile
//
//  Created by Nykolas Mayko Maia Barbosa on 09/11/21.
//

import UIKit
import Core

public protocol ProfileHomeFlowDelegate: AnyObject {
    func goToHome(in controller: ProfileHomeViewController)
    func callLogin(in controller: ProfileHomeViewController)
}

open class ProfileHomeViewController: BaseViewController<ProfileHomeViewModelProtocol, ProfileHomeFlowDelegate> {
    // MARK: - Private Properties
    
    private let goToHomeButton: UIButton = UIButton()
    private let callLoginButton: UIButton = UIButton()
    
    // MARK: - Life Cycle
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
    }
    
    // MARK: - Setup Functions
    
    private func setupUI() {
        setupView()
        setupButton()
    }
    
    private func setupView() {
        view.backgroundColor = .purple
        title = "Profile"
    }
    
    private func setupButton() {
        goToHomeButton.setTitle("Go to Home", for: .normal)
        goToHomeButton.setTitleColor(.red, for: .normal)
        goToHomeButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        
        goToHomeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goToHomeButton)
        
        goToHomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToHomeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        callLoginButton.setTitle("Call Login", for: .normal)
        callLoginButton.setTitleColor(.red, for: .normal)
        callLoginButton.addTarget(self, action: #selector(callLogin), for: .touchUpInside)
        
        callLoginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(callLoginButton)
        
        callLoginButton.centerXAnchor.constraint(equalTo: goToHomeButton.centerXAnchor).isActive = true
        callLoginButton.topAnchor.constraint(equalTo: goToHomeButton.bottomAnchor, constant: 16.0).isActive = true
    }
    
    // MARK: - Private Functions
    
    @objc private func goToHome() {
        viewModel?.onGoToMenuClick()
        flowDelegate?.goToHome(in: self)
    }
    
    @objc private func callLogin() {
        flowDelegate?.callLogin(in: self)
    }
}
