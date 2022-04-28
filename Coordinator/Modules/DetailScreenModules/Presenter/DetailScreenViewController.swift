//
//  DetailScreenViewController.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

protocol DetailScreenViewControllerOutput: AnyObject {

    /// Пользователь нажал на кнопку
    func clouseButtonAction()
}

protocol DetailScreenViewControllerInput: AnyObject {
    
    var moduleOutput: DetailScreenViewControllerOutput? { get set }
    
    /// Разместить готовый текст на экране
    /// - Parameter text: для titleTextLabel
    func locateTitle(text: String)
}

typealias DetailScreenModule = UIViewController & DetailScreenViewControllerInput

final class DetailScreenViewController: DetailScreenModule {
    
    weak var moduleOutput: DetailScreenViewControllerOutput?
    
    private let moduleView: DetailScreenViewInput & UIView
    private let interactor: DetailScreenInteractorInput
    private let factory: DetailScreenFactoryInput
    
    init(moduleView: DetailScreenViewInput & UIView, interactor: DetailScreenInteractorInput, factory: DetailScreenFactoryInput) {
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
        title = Appearents().setTitle
    }
    
    func locateTitle(text: String) {
        moduleView.locateTitle(text: text)
    }
}

extension DetailScreenViewController: DetailScreenViewOutput {
    func clouseButtonAction() {
        moduleView.setBackgroundColor()
        moduleOutput?.clouseButtonAction()
    }
}

extension DetailScreenViewController: DetailScreenFactoryOutput {
    
}

extension DetailScreenViewController: DetailScreenInteractorOutput {
    
}

extension DetailScreenViewController {
    struct Appearents {
        let setTitle = "Detail screen"
    }
}
