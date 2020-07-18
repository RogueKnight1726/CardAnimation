//
//  DetailController.swift
//  Cards
//
//  Created by Next on 18/07/20.
//  Copyright © 2020 Next. All rights reserved.
//

import UIKit


class DetailController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    
    func initViews(){
        self.view.backgroundColor = UIColor(red: 0.64, green: 0.71, blue: 0.78, alpha: 1.00)
        let halfView = UIView.init()
        view.addSubview(halfView)
        halfView.translatesAutoresizingMaskIntoConstraints = false
        [halfView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         halfView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         halfView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2),
         halfView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)].forEach({$0.isActive = true})
    }
}
