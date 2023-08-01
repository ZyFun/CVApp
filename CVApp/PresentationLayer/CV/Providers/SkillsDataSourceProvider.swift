//
//  SkillsDataSourceProvider.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

import UIKit

protocol ISkillsDataSourceProvider: UICollectionViewDataSource, UICollectionViewDelegate {
    var viewModels: [Skill] { get set }
}

class SkillsDataSourceProvider: NSObject, ISkillsDataSourceProvider {
    var viewModels: [Skill] = []
    
    private var presenter: CVPresenter
    
    init(presenter: CVPresenter) {
        self.presenter = presenter
    }
}

// MARK: - UICollectionViewDataSource

extension SkillsDataSourceProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Возвращаем количество ячеек в коллекции + 1 для ячейки с иконкой "+"
        return viewModels.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < viewModels.count {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SkillCell.identifier,
                for: indexPath
            ) as! SkillCell
            
            let viewModel = viewModels[indexPath.row]
            cell.config(title: viewModel.name)
            
            return cell
        } else {
            let addCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AddSkillCell.identifier,
                for: indexPath
            ) as! AddSkillCell
            
            addCell.config()
            
            return addCell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension SkillsDataSourceProvider: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != viewModels.count {
            // Обработка нажатия на ячейку с навыком
            print("Cell")
        } else {
            // Открываем алерт для добавления новой ячейки
            print("Add")
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SkillsDataSourceProvider: UICollectionViewDelegateFlowLayout {
    // TODO: Доделать реализацию с тем, чтобы ячейки смещались к левому краю оставляя с права пустоту, если они не влезают в ряд.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row < viewModels.count {
            return CGSize(width: 100, height: 44)
        } else {
            return CGSize(width: 57, height: 44)
        }
    }
}

