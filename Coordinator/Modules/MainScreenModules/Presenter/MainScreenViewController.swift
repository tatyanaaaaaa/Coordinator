//
//  MainScreenViewController.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

protocol MainScreenViewControllerOutput: AnyObject {
    
    /// Установить готовый текст на следующий экран
    func setFinishedTextToScreen(text: String)
    
}

protocol MainScreenViewControllerInput: AnyObject {
    
    var moduleOutput: MainScreenViewControllerOutput? { get set }
}

typealias MainScreenModule = UIViewController & MainScreenViewControllerInput

final class MainScreenViewController: MainScreenModule {
    
    weak var moduleOutput: MainScreenViewControllerOutput?
    
    private let moduleView: MainScreenViewInput & UIView
    private let interactor: MainScreenInteractorInput
    private let factory: MainScreenFactoryInput
    
    init(moduleView: MainScreenViewInput & UIView, interactor: MainScreenInteractorInput, factory: MainScreenFactoryInput) {
        self.moduleView = moduleView
        self.interactor = interactor
        self.factory = factory
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Appearents().titleLabel
    }
}

extension MainScreenViewController: MainScreenViewOutput {
    func switchColorButtonAction() {
        moduleView.changeBackgroundColor()
        interactor.getContent()
    }
}

extension MainScreenViewController: MainScreenInteractorOutput {
    func didReciveTitle(text: String) {
        moduleOutput?.setFinishedTextToScreen(text: text)
    }
}

extension MainScreenViewController: MainScreenFactoryOutput {
    
}

private extension MainScreenViewController {
    struct Appearents {
        let titleLabel = "Main screen"
    }
}
