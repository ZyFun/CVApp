//
//  CVModel.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

import UIKit

struct CVModel {
    let userPhoto: UIImage?
    let name: String
    let description: String
    let city: String
    let skills: [Skill]
    let about: String
    
    static func getModel() -> CVModel {
        CVModel(
            userPhoto: nil, // TODO: Добавить фото
            name: "Данилин Дмтрий Николаевич",
            description: "iOS-разработчик, опыт разработки 2 года",
            city: "Москва",
            skills: [
                Skill(name: "UIKit"),
                Skill(name: "SwiftUI"),
                Skill(name: "CoreData"),
                Skill(name: "SQLite"),
                Skill(name: "MVP/MVC/VIPER"),
                Skill(name: "CI/CD"),
            ],
            about: "Желание заниматься мобильной разработкой было еще в студенчестве и первые попытки написания приложений были для SymbianOS. Пробовал так же и Android, но остановил свой выбор на iOS"
        )
    }
}

struct Skill {
    let name: String
}
