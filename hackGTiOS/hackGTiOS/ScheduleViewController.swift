//
//  ScheduleViewController.swift
//  hackGTiOS
//
//  Created by Justin May on 10/20/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit

class customCell: UITableViewCell{
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
}

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseID", for: indexPath)
            as! customCell
    
        cell.timeLabel?.text = times[indexPath.row]
        cell.eventLabel?.text = events[indexPath.row]
        return cell
    }
    

    @IBOutlet var ScheduleViewController: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let cellReuseID = "cell"
    let times: [String] = ["9:00", "10:00", "11:00", "15:00", "12:00"]
    let events: [String] = ["OR", "425a", "Open Heart Surgery", "427b", "rounds"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpViews() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScheduleViewController.frame.width, height: 150))
        let gradient = CAGradientLayer()
        let top = UIColor(red:0.05, green:0.92, blue:0.92, alpha:1.0)
        let middle = UIColor(red:0.13, green:0.89, blue:0.70, alpha:1.0)
        let bottom = UIColor(red:0.16, green:1.00, blue:0.78, alpha:1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [top.cgColor, middle.cgColor, bottom.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }

}
