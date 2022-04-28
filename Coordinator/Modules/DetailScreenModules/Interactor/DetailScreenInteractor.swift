//
//  DetailScreenInteractor.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

protocol DetailScreenInteractorOutput: AnyObject {
    
//    /// Передать готовый текст
//    /// - Parameter text: для  titleTextLabel
//    func sendFinished(text: String)
}

protocol DetailScreenInteractorInput: AnyObject {
    
//    func getContentText()
}

final class DetailScreenInteractor: DetailScreenInteractorInput {
   
    weak var output: DetailScreenInteractorOutput?
    
//    func getContentText() {
//        output?.sendFinished(text: )
//    }
}
