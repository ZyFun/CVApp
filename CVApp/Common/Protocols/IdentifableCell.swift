//
//  IdentifableCell.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

protocol IdentifiableCell {}

extension IdentifiableCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}
