//
//  ProfileViewController.swift
//  hackGTiOS
//
//  Created by Justin May on 10/20/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class customPatientCell: UITableViewCell{
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var info: UILabel!
}

class customLargeCell: UITableViewCell {
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var info: UILabel!
}

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = responseMessages[indexPath.row]
        if (data.0 != "Pathology Results") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "patientInfoCell", for: indexPath) as! customPatientCell
            cell.type?.text = data.0
            cell.info?.text = data.1
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "pathCell", for: indexPath) as! customLargeCell
            cell.type?.text = data.0
            cell.info?.text = data.1
            cell.info?.numberOfLines = 0
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = responseMessages[indexPath.row]
        if data.0 == "Pathology Results" {
            return 140
        }
        return 44
    }
    
    
    @IBOutlet weak var patientDataTable: UITableView!
    @IBOutlet var profileViewController: UIView!
    
    var responseMessages = [("Sex", "OK"),
                            ("DoB", "4/24/1936"),
                            ("Allergies", "Pollen Penicillin"),
                            ("Smoker", "Y"),
                            ("Family History", "Diabetes, Melanoma"),
                            ("Immunization", "Antivaxxer"),
                            ("Pathology Results", "There are focal areas of suprabasal clefting and a few acantholytic cells are seen. There is villous formation and individual dyskreatotic cells are present in the upper layers of the epidermis")
                            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        patientDataTable.delegate = self
        patientDataTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func setUpViews() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: profileViewController.frame.width, height: 150))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.05, green:0.92, blue:0.92, alpha:1.0)
        let middle = UIColor(red:0.13, green:0.89, blue:0.70, alpha:1.0)
        let bottom = UIColor(red:0.16, green:1.00, blue:0.78, alpha:1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, middle.cgColor, bottom.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }

}
