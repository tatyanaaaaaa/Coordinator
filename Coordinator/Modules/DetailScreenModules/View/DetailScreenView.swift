//
//  DetailScreenView.swift
//  Coordinator
//
//  Created by Tatiana Sosina on 28.04.2022.
//
import UIKit

protocol DetailScreenViewOutput: AnyObject {
    
    /// Пользователь нажал на кнопку
    func clouseButtonAction()
}

protocol DetailScreenViewInput: AnyObject {
    
    /// Функция устанавливает готовый текст для titleTextLabel
    /// - Parameter text: текст
    func locateTitle(text: String)
    
    /// Функция изменяет цвет экрана на заданный
    func setBackgroundColor()
}

final class DetailScreenView: UIView & DetailScreenViewInput {
    
    var output: DetailScreenViewOutput?
    
    private let titleTextLabel = UILabel()
    private let clouseButton = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupConstraints()
        setupDefaultSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setBackgroundColor() {
        backgroundColor = .gray
    }
    
    public func locateTitle(text: String) {
        titleTextLabel.text = text
    }
    
    private func setupDefaultSettings() {
        backgroundColor = .white
        
        titleTextLabel.textColor = .black
        clouseButton.setTitleColor(.red, for: .normal)
        clouseButton.setTitle(Appearents().textButton, for: .normal)
        clouseButton.addTarget(self, action: #selector(clouseButtonAction), for: .touchUpInside)
    }
    
    @objc private func clouseButtonAction() {
        output?.clouseButtonAction()
    }

    private func setupConstraints() {
        [titleTextLabel, clouseButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            clouseButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            clouseButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding)
        ])
    }
}

private extension DetailScreenView {
    struct Appearents {
        let textButton = "Закрыть экран"
        let padding: CGFloat = 30
    }
}
