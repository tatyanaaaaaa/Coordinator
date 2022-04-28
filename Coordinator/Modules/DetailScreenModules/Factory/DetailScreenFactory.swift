//
//  DetailScreenFactory.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

protocol DetailScreenFactoryOutput: AnyObject {
    
}

protocol DetailScreenFactoryInput: AnyObject {
    
}

final class DetailScreenFactory: DetailScreenFactoryInput {
    
    weak var output: DetailScreenFactoryOutput?
}
