//
//  DetailController.swift
//  Cards
//
//  Created by Next on 18/07/20.
//  Copyright © 2020 Next. All rights reserved.
//

import UIKit


class DetailController: UIViewController{
    
    var dragView: DragViewPlaceHolderView!
    let halfView = UIView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    
    func initViews(){
        self.view.layer.cornerRadius = 20
        self.view.clipsToBounds = true
        self.view.backgroundColor = .clear
        
        halfView.layer.cornerRadius = 20
        halfView.clipsToBounds = true
        halfView.backgroundColor = .white
        view.addSubview(halfView)
        halfView.translatesAutoresizingMaskIntoConstraints = false
        [halfView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         halfView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         halfView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
         halfView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        dragView = DragViewPlaceHolderView.init()
        halfView.addSubview(dragView)
        dragView.translatesAutoresizingMaskIntoConstraints = false
        [dragView.leftAnchor.constraint(equalTo: halfView.leftAnchor, constant: 0),
         dragView.rightAnchor.constraint(equalTo: halfView.rightAnchor, constant: 0),
         dragView.topAnchor.constraint(equalTo: halfView.topAnchor, constant: 0),
         dragView.heightAnchor.constraint(equalToConstant: 50)].forEach({$0.isActive = true})
        
        let headingLabel = UILabel()
        halfView.addSubview(headingLabel)
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        [headingLabel.leftAnchor.constraint(equalTo: halfView.leftAnchor, constant: 16),
         headingLabel.topAnchor.constraint(equalTo: dragView.bottomAnchor, constant: 0)].forEach({$0.isActive = true})
        headingLabel.text = "Special Offer"
        headingLabel.textColor = .black
        headingLabel.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        
        let label = UILabel()
        halfView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        [label.leftAnchor.constraint(equalTo: halfView.leftAnchor, constant: 16),
         label.rightAnchor.constraint(equalTo: halfView.rightAnchor, constant: -16),
         label.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 16)].forEach({$0.isActive = true})
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(dismissSelf(sender:)))
        view.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(panController(sender:)))
        halfView.addGestureRecognizer(panGesture)
    }
    
    
    @objc func panController(sender: UIPanGestureRecognizer){
        self.view.transform = CGAffineTransform.init(translationX: 0, y: max(0, sender.translation(in: self.view).y))
        
        if sender.state == .ended{
            if sender.translation(in: self.view).y > 100 {
               self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.1) {
                    self.view.transform = .identity
                }
            }
        }
    }
    
    @objc func dismissSelf(sender: UITapGestureRecognizer){
        let touchPoint = sender.location(in: view)
        if halfView.frame.contains(touchPoint){
            return
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        NotificationCenter.default.post(name: Notification.Name(NotificationNames.DetailDismiss.rawValue), object: nil)
        super.dismiss(animated: flag, completion: completion)
    }
}

extension DetailController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: self.view) == true {
            return false
         }
         return true
    }
}
