//
//  CVViewController.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

import UIKit

/// Протокол отображения данных ViewCintroller-a
protocol CVView: AnyObject {
    func updateDisplay(viewModel: CVModel)
}

final class CVViewController: UIViewController {
    
    // MARK: - Public property
    
    var presenter: CVPresenter?
    
    // MARK: - Private property
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        presenter?.getDataFromModel()
    }
    
    // MARK: - Actions
    
}

// MARK: - Логика обновления данных View

extension CVViewController: CVView {
    func updateDisplay(viewModel: CVModel) {
        print(viewModel.self)
    }
}

// MARK: - Конфигурирование ViewController

private extension CVViewController {
    func setup() {
        view.backgroundColor = .systemBackground
        
        setupNavigationController()
    }
    
    func setupNavigationController() {
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
