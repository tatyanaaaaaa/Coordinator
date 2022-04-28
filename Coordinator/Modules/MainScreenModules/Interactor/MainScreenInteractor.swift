//
//  MainScreenInteractor.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

protocol MainScreenInteractorOutput: AnyObject {
    
    /// Данные были получены и установлены
    /// - Parameter text: установлены  в 'textLebel'
    func didReciveTitle(text: String)
}

protocol MainScreenInteractorInput: AnyObject {
    
    /// Функция для загрузки данных
    func getContent()
}

final class MainScreenInteractor: MainScreenInteractorInput {
    
    var output: MainScreenInteractorOutput?
    
    func getContent() {
        output?.didReciveTitle(text: Appearents().setTextTitle)
    }
}

extension MainScreenInteractor {
    struct Appearents {
        let setTextTitle = "Пришло"
    }
}
