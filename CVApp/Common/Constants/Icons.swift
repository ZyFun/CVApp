//
//  Icons.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

import UIKit

enum Icons: String {
    case cityPoint
}

// MARK: - Image render

extension Icons {
    
    /// Использует оригинальный цвет изображения
    var image: UIImage? {
        UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
    }
    
    /// Позволяет менять цвет изображения
    var imageTemplate: UIImage? {
        UIImage(named: self.rawValue)?.withRenderingMode(.alwaysTemplate)
    }
}
