//
//  PreferencesView.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/06/17.
//

import UIKit
import RxSwift

final class PreferencesView: UIView {

    private lazy var backgroundStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

    private lazy var islandNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your island name".localized
        return textField
    }()

    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your user name".localized
        return textField
    }()

    private lazy var hemisphereButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Hemisphere.north.rawValue.capitalized, for: .normal)
        return button
    }()

    private lazy var reputationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("⭐️", for: .normal)
        return button
    }()

    private lazy var startingFruitButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: Fruit.apple.imageName)?
            .resizedImage(Size: CGSize(width: 30, height: 30))?
            .withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    private func configure() {
        addSubviews(backgroundStackView)
        NSLayoutConstraint.activate([
            backgroundStackView.topAnchor.constraint(equalTo: topAnchor),
            backgroundStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundStackView.widthAnchor.constraint(equalTo: widthAnchor),
            backgroundStackView.heightAnchor.constraint(equalTo: heightAnchor),
            islandNameTextField.heightAnchor.constraint(equalToConstant: hemisphereButton.intrinsicContentSize.height),
            userNameTextField.heightAnchor.constraint(equalToConstant: hemisphereButton.intrinsicContentSize.height)
        ])

        [islandNameTextField, userNameTextField].forEach {
            $0.tintColor = .acText
            $0.textColor = .acText.withAlphaComponent(0.8)
            $0.borderStyle = .none
            $0.backgroundColor = .clear
            $0.font = .preferredFont(forTextStyle: .footnote)
            $0.textAlignment = .right
            $0.delegate = self
        }

        [hemisphereButton, startingFruitButton, reputationButton].forEach {
            $0.titleLabel?.font = .preferredFont(forTextStyle: .footnote)
            $0.contentHorizontalAlignment = .right
            $0.setTitleColor(.acText.withAlphaComponent(0.8), for: .normal)
        }

        backgroundStackView.addArrangedSubviews(
            InfoContentView(title: "Island name".localized, contentView: islandNameTextField),
            InfoContentView(title: "Island Reputation".localized, contentView: reputationButton),
            InfoContentView(title: "User name".localized, contentView: userNameTextField),
            InfoContentView(title: "hemisphere".localized.capitalized, contentView: hemisphereButton),
            InfoContentView(title: "Starting fruit".localized, contentView: startingFruitButton)
        )
    }
}

extension PreferencesView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}

extension PreferencesView {

    var islandNameObservable: Observable<String> {
        return islandNameTextField.rx.controlEvent(.editingChanged).compactMap { [weak self] in
            self?.islandNameTextField.text
        }.asObservable()
    }

    var userNameObservable: Observable<String> {
        return userNameTextField.rx.controlEvent(.editingChanged).compactMap { [weak self] in
            self?.userNameTextField.text
        }.asObservable()
    }

    var hemisphereButtonObservable: Observable<Void> {
        return hemisphereButton.rx.tap.asObservable()
    }

    var reputationButtonObservable: Observable<Void> {
        return reputationButton.rx.tap.asObservable()
    }

    var startingFruitButtonObservable: Observable<Void> {
        return startingFruitButton.rx.tap.asObservable()
    }

    func setUpViews(_ userInfo: UserInfo) {
        userNameTextField.text = userInfo.name
        islandNameTextField.text = userInfo.islandName
        updateHemisphere(userInfo.hemisphere)
        updateFruit(userInfo.islandFruit)
        updateReputation(userInfo.islandReputation + 1)
    }

    func updateHemisphere(_ hemisphere: Hemisphere) {
        hemisphereButton.setTitle(hemisphere.rawValue.localized.capitalized, for: .normal)
    }

    func updateFruit(_ fruit: Fruit) {
        let image = UIImage(named: fruit.imageName)?
            .resizedImage(Size: CGSize(width: 30, height: 30))?
            .withRenderingMode(.alwaysOriginal)
        startingFruitButton.setImage(image, for: .normal)
    }

    func updateReputation(_ reputation: Int) {
        reputationButton.setTitle(String(repeating: "⭐️", count: reputation), for: .normal)
    }
}
