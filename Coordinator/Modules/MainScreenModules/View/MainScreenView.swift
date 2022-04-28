//
//  MainScreenView.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//

import UIKit

protocol MainScreenViewOutput: AnyObject {
    
    /// Пользователь нажал на кнопку "изменить цвет экрана"
    func switchColorButtonAction()
}

protocol MainScreenViewInput: AnyObject {
    
    /// Функция изменяет цвет экрана на рандомный
    func changeBackgroundColor()
    
    /// Функция устанавливает текст для textLabel
    /// - Parameter text: готовый текст
    func setupTitle(text: String)
}

final class MainScreenView: UIView & MainScreenViewInput {
    
    var output: MainScreenViewOutput?
    
    private let switchColorButton = UIButton()
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupConstraints()
        setupDefaultSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func changeBackgroundColor() {
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
    public func setupTitle(text: String) {
        textLabel.text = text
    }
    
    private func setupDefaultSettings() {
        backgroundColor = .white
        
        switchColorButton.setTitleColor(.blue, for: .normal)
        switchColorButton.setTitle(Appearents().setTextButton, for: .normal)
        switchColorButton.addTarget(self, action: #selector(switchColorButtonAction), for: .touchUpInside)
        textLabel.textColor = .red
    }
    
    @objc private func switchColorButtonAction() {
        output?.switchColorButtonAction()
    }
    
    private func setupConstraints() {
        [textLabel, switchColorButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding),
            switchColorButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            switchColorButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

private extension MainScreenView {
    struct Appearents {
        let setTextButton = "Изменить цвет/Переход на следующий экран"
        let padding: CGFloat = 30
    }
}
