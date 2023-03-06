//
//  ViewController.swift
//  Father's_kick
//
//  Created by Alex on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstButton = CustomButton().createButton(withTitle: "First Button")
    private lazy var secondButton = CustomButton().createButton(withTitle: "Second Button")
    private lazy var thirdButton = CustomButton().createButton(withTitle: "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        createTargets()
        makeConstraint()
        
    }
    
    private func update() {
        thirdButton.configurationUpdateHandler = { button in
            var config = button.configuration
            config?.baseBackgroundColor = .gray
            button.configuration = config
        }
    }
    
    private func createTargets() {
        thirdButton.addTarget(nil, action: #selector(buttonTapped), for: .touchDown)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let viewControllerToPresent = UIViewController()
        viewControllerToPresent.view.backgroundColor = .white
        self.present(viewControllerToPresent, animated: true)
    }
    
    private func makeConstraint() {

        [firstButton, secondButton, thirdButton].forEach {
            view.addSubview($0)
        }
        firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 8).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 8).isActive = true
        thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
