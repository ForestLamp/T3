//
//  ViewController.swift
//  Father's_kick
//
//  Created by Alex on 01.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let layoutMarigns = UIEdgeInsets(top: 50, left: 16, bottom: 0, right: 16)
    
    private lazy var cubeView = View()
    private lazy var transformSlider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(transformCubeView(slider:event:)), for: .valueChanged)
        return slider
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.layoutMargins = layoutMarigns
        makeConstraints()
    }
    
    @objc private func transformCubeView(slider: UISlider, event: UIEvent){
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began:
                print("")
            case .moved:
                let transform = getTransform(for: slider)
                UIView.animateKeyframes(withDuration: 0.6, delay: 0.0, options: [.calculationModeLinear], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                        self.cubeView.transform = transform
                    })
                })
            case .ended:
                transformSlider.setValue(1, animated: true)
                let transform = getTransform(for: slider)
                UIView.animateKeyframes(withDuration: 0.6, delay: 0.0, options: [], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                        self.cubeView.transform = transform
                    })
                })
            default:
                break
            }
        }
    }
    
    private func getTransform(for slider: UISlider) -> CGAffineTransform {
        var transform = CGAffineTransform.identity
        let angle = CGFloat(slider.value) * .pi / 2
        let width = UIScreen.main.bounds.width
        let moveRightTransform = CGAffineTransform(translationX: (width - 165) * CGFloat(slider.value), y: 0)
        let scale = 1 + CGFloat(slider.value) * 0.5
        let scaleTransform = CGAffineTransform(scaleX: scale, y: scale)
        transform = CGAffineTransform(rotationAngle: angle)
        transform = transform.concatenating(scaleTransform)
        transform = transform.concatenating(moveRightTransform)
        viewDidLayoutSubviews()
        return transform
    }
    
    private func makeConstraints() {
        view.addSubview(cubeView)
        view.addSubview(transformSlider)
        
        cubeView.translatesAutoresizingMaskIntoConstraints = false
        transformSlider.translatesAutoresizingMaskIntoConstraints = false
        
        cubeView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cubeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cubeView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
        cubeView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        
        transformSlider.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
        transformSlider.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
        transformSlider.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 140).isActive = true
    }
}


class View: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    init(){
        super.init(frame: .zero)
        layer.cornerRadius = 8
        layer.cornerCurve = .continuous
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowOffset = .init(width: .zero, height: 12)
        layer.shadowRadius = 12
        gradientLayer.startPoint = .init(x: 0, y: 0)
        gradientLayer.endPoint = .init(x: 1, y: 0.5)
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemRed.cgColor]
        layer.addSublayer(gradientLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if layer == self.layer {
            gradientLayer.frame = bounds
            gradientLayer.cornerRadius = layer.cornerRadius
        }
    }
}
