//
//  MainViewController.swift
//  hackGTiOS
//
//  Created by Justin May on 10/20/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var MainViewController: UIView!
    
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var currentPatient: UIButton!
    @IBOutlet weak var nextPatientButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpButtonViews()

        // Do any additional setup after loading the view.
    }
    
    func setUpViews() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: MainViewController.frame.width, height: 150))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.05, green:0.92, blue:0.92, alpha:1.0)
        let middle = UIColor(red:0.13, green:0.89, blue:0.70, alpha:1.0)
        let bottom = UIColor(red:0.16, green:1.00, blue:0.78, alpha:1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, middle.cgColor, bottom.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func setUpButtonViews(){
        //schedule Button
        scheduleButton.layer.cornerRadius = 5
        scheduleButton.layer.borderWidth = 1
        scheduleButton.layer.borderColor = UIColor(red:0.13, green:0.89, blue:0.70, alpha:1.0).cgColor
        scheduleButton.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        
        //current Patient Button
        currentPatient.layer.cornerRadius = 5
        currentPatient.layer.borderWidth = 1
        currentPatient.layer.borderColor = UIColor(red:0.13, green:0.89, blue:0.70, alpha:1.0).cgColor
        currentPatient.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        
        //next Patient Button
        nextPatientButton.layer.cornerRadius = 5
        nextPatientButton.layer.borderWidth = 1
        nextPatientButton.layer.borderColor = UIColor(red:0.13, green:0.89, blue:0.70, alpha:1.0).cgColor
        nextPatientButton.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        
    }
}
