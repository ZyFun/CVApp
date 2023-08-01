//
//  CVConfiguratur.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

import UIKit

/// Конфигурация MVP модуля
final class CVConfigurator {
    func config(
        view: UIViewController,
        navigationController: UINavigationController
    ) {
        guard let view = view as? CVViewController else { return }
        let presenter = CVPresenter(view: view)
        let dataSourceProvider: ISkillsDataSourceProvider = SkillsDataSourceProvider(
            presenter: presenter
        )
        
        view.presenter = presenter
        view.dataSourceProvider = dataSourceProvider
        presenter.view = view
    }
}
