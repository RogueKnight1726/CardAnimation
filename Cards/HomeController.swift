//
//  HomeController.swift
//  Cards
//
//  Created by Next on 17/07/20.
//  Copyright © 2020 Next. All rights reserved.
//

import UIKit


class HomeController: UIViewController{
    
    
    
    let cardOne = BaseView.init(with: UIColor(red: 0.62, green: 0.87, blue: 0.98, alpha: 1.00), circular: false, shadow: false, borderColor: nil, borderThickness: nil)
    let cardTwo = BaseView.init(with: .green, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
    let cardThree = BaseView.init(with: .red, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
    let backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        view.addSubview(cardThree)
        cardThree.translatesAutoresizingMaskIntoConstraints = false
        [cardThree.widthAnchor.constraint(equalToConstant: 300),
         cardThree.heightAnchor.constraint(equalToConstant: 180),
         cardThree.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
         cardThree.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        cardThree.layer.anchorPoint = CGPoint.init(x: 1, y: 1)
        let cardOneAngle = 10 / 180.0 * CGFloat.pi
        let transformOne = CGAffineTransform.init(translationX: 140, y: 40)
        let transformScaleOne = CGAffineTransform.init(scaleX: 0.80, y: 0.80)
        let transformRotateOne = CGAffineTransform.init(rotationAngle: cardOneAngle)
        let finalTransform = transformOne.concatenating(transformRotateOne).concatenating(transformScaleOne)
        cardThree.transform = finalTransform
        
        view.addSubview(cardTwo)
        cardTwo.translatesAutoresizingMaskIntoConstraints = false
        [cardTwo.widthAnchor.constraint(equalToConstant: 300),
         cardTwo.heightAnchor.constraint(equalToConstant: 180),
         cardTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
         cardTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        cardTwo.layer.anchorPoint = CGPoint.init(x: 1, y: 1)
        let angleInRadians = 5 / 180.0 * CGFloat.pi
        let transform = CGAffineTransform.init(translationX: 150, y: 68)
        let cardTwoScale = CGAffineTransform.init(scaleX: 0.90, y: 0.90)
        let cardTwoRotation = CGAffineTransform.init(rotationAngle: angleInRadians)
        let cardTwoFinalTransform = transform.concatenating(cardTwoRotation).concatenating(cardTwoScale)
        cardTwo.transform = cardTwoFinalTransform
        
        view.addSubview(cardOne)
        cardOne.translatesAutoresizingMaskIntoConstraints = false
        [cardOne.widthAnchor.constraint(equalToConstant: 300),
         cardOne.heightAnchor.constraint(equalToConstant: 180),
         cardOne.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
         cardOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(panDetected(sender:)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func panDetected(sender: UIPanGestureRecognizer){
        let location = sender.location(in: self.view)
        
        UIView.animate(withDuration: 0.05) {
            self.cardOne.center = location
            if sender.state == .ended{
                self.cardOne.center = CGPoint.init(x: self.view.frame.midX, y: self.view.frame.midY)
                return
            }
        }
        
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            if sender.state == .ended{
                self.cardTwo.center = CGPoint.init(x: self.view.frame.midX, y: self.view.frame.midY)
                return
            }
            self.cardTwo.center = sender.location(in: self.view)
        }) { (_) in
            
        }
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            if sender.state == .ended{
                self.cardThree.center = CGPoint.init(x: self.view.frame.midX, y: self.view.frame.midY)
                return
            }
            self.cardThree.center = sender.location(in: self.view)
        }) { (_) in
            
        }
    }
}
