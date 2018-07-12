//
//  ViewController.swift
//  chain animation
//
//  Created by Dhawal Mahajan on 30/06/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    fileprivate func setUpStackView() {
        let stackview = UIStackView(arrangedSubviews: [titleLabel,bodyLabel])
        stackview.axis = .vertical
        view.addSubview(stackview)
        //        stackview.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
    }
    
    func setUpLabels() {
        titleLabel.font = UIFont(name: "Futura", size: 35)
        titleLabel.text = "Dhawal Mahajan"
        
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "IOS Developer.I can work with you to make beautiful app like this for You.Lets give it a shot!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        setUpStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
    }
    
    @objc func handleTapAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -20, y: 0)
            self.bodyLabel.transform = CGAffineTransform(translationX: -20, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -400)
                self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -400)
                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

