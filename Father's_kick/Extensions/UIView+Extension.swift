//
//  UIView+Extension.swift
//  Father's_kick
//
//  Created by Alex on 01.03.2023.
//

import UIKit

extension UIView {
    
    private var cubeSize: CGFloat {
        100
    }
    
    private var cubeLeading: CGFloat {
        100
    }
    
    func makeCubeView(){
        let view = UIView()
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: cubeSize).isActive = true
        view.heightAnchor.constraint(equalToConstant: cubeSize).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: cubeLeading).isActive = true
        view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        view.layoutIfNeeded()
        view.addGradientWithShadow(colors: [#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1) , #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)], locations: [0.0, 0.5, 1.0])
    }
    
    private func addGradientWithShadow(colors: [CGColor], locations: [NSNumber]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: cubeSize, height: cubeSize)
        gradientLayer.shadowColor = UIColor.black.cgColor
        gradientLayer.shadowOffset = CGSize(width: 4, height: 10)
        gradientLayer.shadowOpacity = 0.2
        gradientLayer.shadowRadius = 4
        gradientLayer.cornerRadius = 10
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
