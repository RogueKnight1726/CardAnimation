//
//  HomeController.swift
//  Cards
//
//  Created by Next on 17/07/20.
//  Copyright © 2020 Next. All rights reserved.
//

import UIKit


class HomeController: UIViewController{
    
    
    
    let cardOne = BaseImageView.init(with: UIColor(red: 0.62, green: 0.87, blue: 0.98, alpha: 1.00), circular: false, shadow: false, borderColor: nil, borderThickness: nil)
    let cardTwo = BaseView.init(with: UIColor(red: 0.28, green: 0.24, blue: 0.36, alpha: 0.8), circular: false, shadow: false, borderColor: nil, borderThickness: nil)
    let cardThree = BaseView.init(with: UIColor(red: 0.91, green: 0.22, blue: 0.37, alpha: 0.6), circular: false, shadow: false, borderColor: nil, borderThickness: nil)
    let backgroundColor = UIColor(red: 0.79, green: 0.84, blue: 0.87, alpha: 1.00)
    let textColor = UIColor(red: 0.35, green: 0.37, blue: 0.39, alpha: 1.00)
    var blurView: UIVisualEffectView!
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapDetected(sender:)))
        cardOne.addGestureRecognizer(tapGesture)
        
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(panDetected(sender:)))
        view.addGestureRecognizer(panGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(recievedDismissNotification), name: Notification.Name(NotificationNames.DetailDismiss.rawValue), object: nil)
    }
    
    
    func initViews(){
        let guide = view.safeAreaLayoutGuide
        view.backgroundColor = backgroundColor
        
        print("Frme: \(view.frame)")
        
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        [backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
         backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)].forEach({$0.isActive = true})
        backgroundImageView.image = UIImage.init(named: "city")
        backgroundImageView.contentMode = .scaleAspectFill
        
        
        
        
        let titleLabel = UILabel.init()
        titleLabel.text = "ACE2Three"
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.textColor = textColor
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 16),
         titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0)].forEach({$0.isActive = true})
        
        
        let blurEffect = UIBlurEffect(style: .light)
        blurView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        [blurView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         blurView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         blurView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
         blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)].forEach({$0.isActive = true})
        blurView.alpha = 0
        
        
        view.addSubview(cardThree)
        cardThree.translatesAutoresizingMaskIntoConstraints = false
        [cardThree.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.724),
         cardThree.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
         cardThree.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
         cardThree.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        cardThree.layer.anchorPoint = CGPoint.init(x: 1, y: 1)
        applyCardThreeInitialTransformState()
        
        view.addSubview(cardTwo)
        cardTwo.translatesAutoresizingMaskIntoConstraints = false
        [cardTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.724),
         cardTwo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
         cardTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
         cardTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        cardTwo.layer.anchorPoint = CGPoint.init(x: 1, y: 1)
        applyCardTwoInitialTransform()
        
        view.addSubview(cardOne)
        cardOne.translatesAutoresizingMaskIntoConstraints = false
        [cardOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.724),
         cardOne.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
         cardOne.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
         cardOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        cardOne.image = UIImage.init(named: "cardOneImage")
    }
    
    
    func applyCardThreeInitialTransformState(){
        let cardOneAngle = 10 / 180.0 * CGFloat.pi
        let transformOne = CGAffineTransform.init(translationX: 0.338 * view.frame.width, y: 0.044 * view.frame.height)
        let transformScaleOne = CGAffineTransform.init(scaleX: 0.80, y: 0.80)
        let transformRotateOne = CGAffineTransform.init(rotationAngle: cardOneAngle)
        let finalTransform = transformOne.concatenating(transformRotateOne).concatenating(transformScaleOne)
        cardThree.transform = finalTransform
    }
    
    func applyCardTwoInitialTransform(){
        let angleInRadians = 5 / 180.0 * CGFloat.pi
        let transform = CGAffineTransform.init(translationX: 0.362 * view.bounds.width, y: 0.075 * view.frame.height)
        let cardTwoScale = CGAffineTransform.init(scaleX: 0.90, y: 0.90)
        let cardTwoRotation = CGAffineTransform.init(rotationAngle: angleInRadians)
        let cardTwoFinalTransform = transform.concatenating(cardTwoRotation).concatenating(cardTwoScale)
        cardTwo.transform = cardTwoFinalTransform
    }
    
    @objc func recievedDismissNotification(){
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
            self.view.transform = .identity
            self.applyCardThreeInitialTransformState()
            self.applyCardTwoInitialTransform()
            self.backgroundImageView.alpha = 1
        }, completion: nil)
    }
    
    @objc func tapDetected(sender: UITapGestureRecognizer){
        
        let cardThreeLayer = cardThree.layer
        let cardTwoLayer = cardTwo.layer
        var rotationAndPerspectiveTransform = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = 1.0 / -500
        let cardThreePerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0 * .pi / 180.0, 1.0, 0, 0.0)
        let cardThreeLiftUpTransform = CATransform3DTranslate(cardThreePerspectiveTransform, (self.view.bounds.width / 2) - (0.120 * self.view.frame.width),(-0.446 * self.view.frame.height), -50)
        
        let cardTwoPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 35.0 * .pi / 180.0, 1.0, 0, 0.0)
        let cardTwoLiftUpTransofrm = CATransform3DTranslate(cardTwoPerspectiveTransform, (self.view.bounds.width / 2) - (0.120 * self.view.frame.width),(-0.189 * self.view.frame.height), -50)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [], animations: {
            self.cardTwo.transform = CGAffineTransform.identity.concatenating(CGAffineTransform.init(translationX: (self.view.bounds.width / 2) - (0.120 * self.view.frame.width), y: 90))
            self.cardThree.transform = CGAffineTransform.identity.concatenating(CGAffineTransform.init(translationX: (self.view.bounds.width / 2) - (0.120 * self.view.frame.width), y: 90))
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                cardThreeLayer.transform = cardThreeLiftUpTransform
                cardTwoLayer.transform = cardTwoLiftUpTransofrm
                self.view.transform = CGAffineTransform.init(translationX: 0, y: -self.view.bounds.height / 8)
                self.backgroundImageView.alpha = 0
            }, completion: nil)
        }
        
        
        let detailController = DetailController()
        detailController.modalPresentationStyle = .custom
        detailController.transitioningDelegate = self
        detailController.isModalInPresentation = true
        self.present(detailController, animated: true, completion: nil)
    }
    
    
    
    
    
    @objc func panDetected(sender: UIPanGestureRecognizer){
        let location = sender.location(in: self.view)
        
        
        
        UIView.animate(withDuration: 0.05) {
            self.cardOne.center = location
            if sender.state == .ended{
                self.cardOne.center = CGPoint.init(x: self.view.frame.midX, y: self.view.frame.midY)
                self.blurView.alpha = 0
                return
            }
            if sender.state == .began{
                self.blurView.alpha = 1.0
            }
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.05, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseIn], animations: {
            if sender.state == .ended{
                self.cardTwo.center = CGPoint.init(x: self.view.frame.midX, y: self.view.frame.midY)
                return
            }
            self.cardTwo.center = sender.location(in: self.view)
        }) { (_) in
            
        }
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseOut,.curveEaseIn], animations: {
            if sender.state == .ended{
                self.cardThree.center = CGPoint.init(x: self.view.frame.midX, y: self.view.frame.midY)
                return
            }
            self.cardThree.center = sender.location(in: self.view)
        }) { (_) in
            
        }
    }
}


extension HomeController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Dismisser()
    }
}
class HalfSizePresentationController : UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            guard let theView = containerView else {
                return CGRect.zero
            }

            return CGRect(x: 0, y: 0, width: theView.bounds.width, height: theView.bounds.height)
        }
    }
}

private class Dismisser: NSObject, UIViewControllerAnimatedTransitioning {
 
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    
 
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        UIView.animate(withDuration: 0.3, animations: {
            fromView.frame.origin.y += container.frame.height - fromView.frame.minY
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
}
