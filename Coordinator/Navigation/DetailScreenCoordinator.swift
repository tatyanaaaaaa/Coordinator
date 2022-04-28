//
//  DetailScreenCoordinator.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

protocol DetailScreenCoordinatorInput: AnyObject {
    
    /// Устанавливает текст
    /// - Parameter text: текст на экранe
    func setTitle(text: String)
}

typealias DetailScreen = Coordinator & DetailScreenCoordinatorInput

final class DetailScreenCoordinator: DetailScreen {
    
    private let navigationController: UINavigationController
    private var detailScreenModule: DetailScreenModule?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailScreenModule = DetailScreenAssembly().createModule()
        detailScreenModule.moduleOutput = self
        self.detailScreenModule = detailScreenModule
        navigationController.pushViewController(detailScreenModule, animated: true)
    }
    
    func setTitle(text: String) {
        detailScreenModule?.locateTitle(text: text)
    }
}

extension DetailScreenCoordinator: DetailScreenViewControllerOutput {
    
    func clouseButtonAction() {
        navigationController.popViewController(animated: true)
    }
}
