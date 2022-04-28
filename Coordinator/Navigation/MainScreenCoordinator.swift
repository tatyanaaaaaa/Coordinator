//
//  MainScreenCoordinator.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

final class MainScreenCoordinator: Coordinator {
   
    private let nagivationController: UINavigationController
    private var detailScreenCoordinator: DetailScreen?
    
    init(nagivationController: UINavigationController) {
        self.nagivationController = nagivationController
    }
    
    func start() {
        let mainScreenModule = MainScreenAssembly().createModule()
        mainScreenModule.moduleOutput = self
        nagivationController.pushViewController(mainScreenModule, animated: true)
    }
    
    func showDetailScreen() {
        let detailScreenCoordinator: DetailScreen = DetailScreenCoordinator(navigationController: nagivationController)
        self.detailScreenCoordinator = detailScreenCoordinator
        detailScreenCoordinator.start()
    }
}

extension MainScreenCoordinator: MainScreenViewControllerOutput {
    func setFinishedTextToScreen(text: String) {
        showDetailScreen()
        detailScreenCoordinator?.setTitle(text: text)
    }
}
