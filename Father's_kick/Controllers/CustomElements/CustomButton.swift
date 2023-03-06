//
//  CustomButton.swift
//  Father's_kick
//
//  Created by Alex on 05.03.2023.
//

import UIKit

class CustomButton: UIButton {

    func createButton(withTitle: String)-> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(withTitle, for: .normal)
        button.setImage(UIImage(systemName: "arrow.right.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        var animation: UIViewPropertyAnimator? = nil
        button.configurationUpdateHandler = { button in
            if animation?.isRunning == true {
                animation?.stopAnimation(true)
            }
            animation = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut) {
                button.transform = button.isHighlighted ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity
            }
            animation?.startAnimation()
        }
        return button
    }
}


