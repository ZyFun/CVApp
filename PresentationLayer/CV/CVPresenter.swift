//
//  CVPresenter.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

import Foundation

/// Протокол взаимодействия ViewController-a с презенетром
protocol CVPresentationLogic: AnyObject {
    init(view: CVView)
}

final class CVPresenter {
    // MARK: - Public Properties
    
    weak var view: CVView?
    
    // MARK: - Private properties
    
    // MARK: - Initializer
    
    required init(view: CVView) {
        self.view = view
    }
}

// MARK: - Presentation Logic

extension CVPresenter: CVPresentationLogic {
    
}
