//
//  RootCoordinator.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

final class RootCoordinator: Coordinator {
    
    private let navigationController = UINavigationController()
    private let window: UIWindow
    private var mainScreenCoordinator: Coordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainScreenCoordinator: Coordinator = MainScreenCoordinator(nagivationController: navigationController)
        self.mainScreenCoordinator = mainScreenCoordinator
        mainScreenCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
