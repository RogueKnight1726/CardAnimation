
//
//  BaseView.swift
//  Prototype
//
//  Created by SWAT on 23/11/19.
//  Copyright © 2019 SWAT. All rights reserved.
//

import UIKit



class BaseView: UIView{
    
    
    var roundedShape = CAShapeLayer()
    var curvedPath: UIBezierPath!
    var shapeColor: UIColor!
    var circular: Bool!
    var shadow: Bool!
    var shadowLayer = CAShapeLayer()
    var borderColor: CGColor?
    var borderThickness: CGFloat?
    
    
    convenience init(with backgroundTheme: UIColor, circular: Bool, shadow: Bool,borderColor: UIColor?,borderThickness: Int?){
        self.init()
        shapeColor = backgroundTheme
        self.circular = circular
        self.shadow = shadow
        self.borderThickness = CGFloat(borderThickness ?? 0)
        self.borderColor = borderColor?.cgColor
        
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
    }
    
    
    func setColorToBaseView(color: UIColor){
        shapeColor = color
        layoutSubviews()
    }
    func setColors(color: UIColor,borderColor: UIColor){
        shapeColor = color
        self.borderColor = borderColor.cgColor
        layoutSubviews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if layer.sublayers?.contains(roundedShape) ?? false{
            roundedShape.removeFromSuperlayer()
        }
        if layer.sublayers?.contains(shadowLayer) ?? false{
            shadowLayer.removeFromSuperlayer()
        }
        
        curvedPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: self.circular ? self.bounds.height / 2 : 15)
        roundedShape = CAShapeLayer()
        roundedShape.path = curvedPath.cgPath
        roundedShape.fillColor = shapeColor.cgColor
        self.layer.insertSublayer(roundedShape, at: 0)
        
        if let _ = self.borderColor, let _ = self.borderThickness{
            roundedShape.strokeColor = borderColor
            roundedShape.borderWidth = self.borderThickness!
        }
        
        
        if shadow{
            shadowLayer = CAShapeLayer()
            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowRadius = 4
            shadowLayer.shadowOpacity = 0.6
            shadowLayer.shadowOffset = CGSize(width: 0, height: 6)
            shadowLayer.path = curvedPath.cgPath
            shadowLayer.fillColor = shapeColor.cgColor
            layer.insertSublayer(shadowLayer, below: roundedShape)
        }
    }
    
    
}


//import UIKit
//
//
//class BaseView: UIView{
//
//
//    var roundedShape: CAShapeLayer!
//    var curvedPath: UIBezierPath!
//    var shapeColor: UIColor!
//    var circular: Bool!
//    var shadow: Bool!
//    var shadowLayer: CAShapeLayer!
//    var borderColor: UIColor?
//
//    convenience init(with backgroundTheme: UIColor, circular: Bool, shadow: Bool){
//        self.init()
//        shapeColor = backgroundTheme
//        self.circular = circular
//        self.shadow = shadow
//    }
//    convenience init(with backgroundTheme: UIColor, circular: Bool, shadow: Bool,borderColor: UIColor){
//        self.init()
//        shapeColor = backgroundTheme
//        self.circular = circular
//        self.shadow = shadow
//        self.borderColor = borderColor
//    }
//
//    override func didMoveToSuperview() {
//        super.didMoveToSuperview()
//
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        curvedPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: self.circular ? self.bounds.height / 2 : 15)
//        roundedShape = CAShapeLayer()
//        roundedShape.path = curvedPath.cgPath
//        roundedShape.fillColor = shapeColor.cgColor
//        if let unwrappedBorderColor = self.borderColor {
//            roundedShape.borderWidth = 2
//            roundedShape.borderColor = unwrappedBorderColor.cgColor
//        }
//        self.layer.insertSublayer(roundedShape, at: 0)
//        if shadow{
//            shadowLayer = CAShapeLayer()
//            shadowLayer.shadowColor = UIColor.gray.cgColor
//            shadowLayer.shadowRadius = 4
//            shadowLayer.shadowOpacity = 0.3
//            shadowLayer.shadowOffset = CGSize(width: 0, height: 6)
//            shadowLayer.path = curvedPath.cgPath
//            //            shadowLayer.fillColor = UIColor.white.cgColor
//            layer.insertSublayer(shadowLayer, below: roundedShape)
//        }
//
//
//    }
//}
