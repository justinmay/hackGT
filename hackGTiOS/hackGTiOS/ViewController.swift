//
//  ViewController.swift
//  hackGTiOS
//
//  Created by Justin May on 10/20/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var homeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func setUpViews() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: homeView.frame.width, height: homeView.frame.height))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.05, green:0.92, blue:0.92, alpha:1.0)
        let middle = UIColor(red:0.13, green:0.89, blue:0.70, alpha:1.0)
        let bottom = UIColor(red:0.16, green:1.00, blue:0.78, alpha:1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, middle.cgColor, bottom.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }

}

