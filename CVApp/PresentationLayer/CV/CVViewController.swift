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
    
    // MARK: - UIElements
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = Colors.background
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fill
        return stackView
    }()
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 16, bottom: 20, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 35)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let userPhotoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private var cityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let cityPointImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Icons.cityPoint.imageTemplate
        view.tintColor = .systemGray
        return view
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private let bodyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 16, bottom: 24, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.backgroundColor = Colors.bodyBackground
        return stackView
    }()
    
    private let aboutStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    private let aboutTitle: UILabel = {
        let label = UILabel()
        label.text = "О себе"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let aboutDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        presenter?.getDataFromModel()
    }
    
    override func viewDidLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.height / 2
    }
    
    // MARK: - Actions
    
}

// MARK: - Логика обновления данных View

extension CVViewController: CVView {
    func updateDisplay(viewModel: CVModel) {
        userPhotoImageView.image = viewModel.userPhoto
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        cityLabel.text = viewModel.city
        aboutDescription.text = viewModel.about
    }
}

// MARK: - Конфигурирование ViewController

private extension CVViewController {
    func setup() {
        view.backgroundColor = .systemBackground
        
        setupNavigationController()
        setupConstraints()
        userPhotoImageView.layoutIfNeeded()
    }
    
    func setupNavigationController() {
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(headerStackView)
        stackView.addArrangedSubview(bodyStackView)
        
        headerStackView.addArrangedSubview(userInfoStackView)
        userInfoStackView.addArrangedSubview(userPhotoImageView)
        userInfoStackView.setCustomSpacing(16, after: userPhotoImageView)
        userInfoStackView.addArrangedSubview(nameLabel)
        userInfoStackView.setCustomSpacing(4, after: nameLabel)
        userInfoStackView.addArrangedSubview(descriptionLabel)
        userInfoStackView.addArrangedSubview(cityStackView)
        
        cityStackView.addArrangedSubview(cityPointImageView)
        cityStackView.addArrangedSubview(cityLabel)
        
        bodyStackView.addArrangedSubview(aboutStackView)
        aboutStackView.addArrangedSubview(aboutTitle)
        aboutStackView.addArrangedSubview(aboutDescription)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 120),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}
