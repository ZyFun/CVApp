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
    
    func getDataFromModel()
}

final class CVPresenter {
    // MARK: - Public Properties
    
    weak var view: CVView?
    
    // MARK: - Private properties
    
    private var viewModel: CVModel?
    
    // MARK: - Initializer
    
    required init(view: CVView) {
        self.view = view
    }
}

// MARK: - Presentation Logic

extension CVPresenter: CVPresentationLogic {
    func getDataFromModel() {
        viewModel = CVModel.getModel()
        guard let viewModel else { return }
        
        view?.updateDisplay(viewModel: viewModel)
    }
}
