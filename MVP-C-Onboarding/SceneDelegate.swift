//
//  SceneDelegate.swift
//  MVP-C-Onboarding
//
//  Created by David on 20/05/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    // The main AppCoordinator loading the main screen.
    private var appCoordinator: HomeCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let appCoordinator = HomeCoordinator(window: window)
        
        self.window = window
        self.appCoordinator = appCoordinator
       
        appCoordinator.start()
    }
}

