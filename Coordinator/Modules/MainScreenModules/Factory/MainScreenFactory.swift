//
//  MainScreenFactory.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

protocol MainScreenFactoryOutput: AnyObject {
    
}

protocol MainScreenFactoryInput: AnyObject {
    
}

final class MainScreenFactory: MainScreenFactoryInput {
    
    var output: MainScreenFactoryOutput?
}
