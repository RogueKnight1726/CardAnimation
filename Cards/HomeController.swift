//
//  HomeController.swift
//  Cards
//
//  Created by Next on 17/07/20.
//  Copyright © 2020 Next. All rights reserved.
//

import UIKit


class HomeController: UIViewController{
    
    
    
    let cardOne = BaseView.init(with: .blue, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
    let cardTwo = BaseView.init(with: .green, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(cardTwo)
        cardTwo.translatesAutoresizingMaskIntoConstraints = false
        [cardTwo.widthAnchor.constraint(equalToConstant: 200),
         cardTwo.heightAnchor.constraint(equalToConstant: 120),
         cardTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
         cardTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        cardTwo.layer.anchorPoint = CGPoint.init(x: 0, y: 1)
        cardTwo.transform = CGAffineTransform.init(rotationAngle: 20)
        
        view.addSubview(cardOne)
        cardOne.translatesAutoresizingMaskIntoConstraints = false
        [cardOne.widthAnchor.constraint(equalToConstant: 200),
         cardOne.heightAnchor.constraint(equalToConstant: 120),
         cardOne.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
         cardOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(panDetected(sender:)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func panDetected(sender: UIPanGestureRecognizer){
        let location = sender.location(in: self.view)
        cardOne.center = location
        
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.cardTwo.center = sender.location(in: self.view)
        }) { (_) in
            
        }
    }
}
