//
//  CVViewController.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

import UIKit

/// Протокол отображения данных ViewCintroller-a
protocol CVView: AnyObject {
    
}

final class CVViewController: UIViewController {
    
    // MARK: - Public property
    
    var presenter: CVPresenter?
    
    // MARK: - Private property
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Actions
    
}

// MARK: - Логика обновления данных View

extension CVViewController: CVView {
    
}

// MARK: - Конфигурирование ViewController

private extension CVViewController {
    func setup() {
        view.backgroundColor = .blue
    }
}
