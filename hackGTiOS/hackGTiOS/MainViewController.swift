//
//  MainViewController.swift
//  hackGTiOS
//
//  Created by Justin May on 10/20/18.
//  Copyright © 2018 Justin May. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, BeaconScannerDelegate {
    
    var url: String? {
        return "https://5756a23c.ngrok.io"
    }
    
    var userIds = ["5bcc63bca5404233bc8daa72", "5bcc714aa0368d4b8a4455ff", "5bcc7130a0368d4b8a4455fe"]
    var isVisited = [false, false, false]
    
    //variables
    @IBOutlet var MainViewController: UIView!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var currentPatient: UIButton!
    @IBOutlet weak var nextPatientButton: UIButton!
    
    // Beacon Scanner vars
    var beaconScanner: BeaconScanner!
    var txPower = -58.0
    var maxAcceptableDistance = 3.0
    var distance_dictionaries: [String:[Double]] = [:]
    var sum_of_distances: [String:Double] = [:]
    var beaconsSearched : [String] = []
    
    // main funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpButtonViews()
        self.hideKeyboardWhenTappedAround()
        
        self.beaconScanner = BeaconScanner()
        self.beaconScanner!.delegate = self
        self.beaconScanner!.startScanning()
        // Do any additional setup after loading the view.
    }
    
    //Beacon Code
    func didFindBeacon(beaconScanner: BeaconScanner, beaconInfo: BeaconInfo) {
        NSLog("FIND: %@", beaconInfo.description)
    }
    
    func didLoseBeacon(beaconScanner: BeaconScanner, beaconInfo: BeaconInfo) {
        NSLog("FIND: %@", beaconInfo.description)
    }
    
    func didUpdateBeacon(beaconScanner: BeaconScanner, beaconInfo: BeaconInfo) {
        NSLog("FIND: %@", beaconInfo.description)
    }
    
    func didObserveURLBeacon(beaconScanner: BeaconScanner, URL: NSURL, RSSI: Int) {
        let distance = getDistance(rssi: RSSI, txPower: self.txPower)
        
        //if the distance is absurd return
        if(distance >= maxAcceptableDistance){
            return;
        }
        
        let beacon_name = URL.absoluteString!
        
        //creating an entry in distance_dictionary if it doesn't exist
        if distance_dictionaries[beacon_name] == nil {
            distance_dictionaries[beacon_name] = [distance]
            sum_of_distances[beacon_name] = 0.0
        } else {
            //else appends distance to the distance array
            distance_dictionaries[beacon_name]?.append(distance)
        }
        
        // **important** if you are next to the beacon the following executes
        if distance <= 0.2 {
            print("close!")
    
            var beaconHardDict : [String : String] = [
                "http://www.justin.com" : "Beacon0",
                "http://www.aditya.com" : "Beacon1",
                "http://www.vineeth.com" : "Beacon2",
                ]
            
            if (beaconsSearched.contains(beacon_name)){
                //print("already there")
            } else {
                
                print(beacon_name)
                let beaconActualString = beaconHardDict[beacon_name]
                
                //dictionary for beacon
                
                print(beaconActualString! + " passed")
                self.beaconsSearched.append(beacon_name)
                //beaconScanner.stopScanning()
                
                if(beacon_name == "http://www.justin.com"){
                    print("JUSTIN!")
                    isVisited[0] = true
                    isVisited[1] = false
                    isVisited[2] = false
                    
                    let parameters : Parameters = [
                        "userid" : userIds[0]
                    ]
                    Alamofire.request(self.url! + "/patients/notify", method: .post, parameters: parameters, encoding: URLEncoding.default).responseString {
                        (response) in
                        print(response)
                        switch response.result {
                        case .success(let value):
                            print("lolol")
                        case .failure(let error):
                            print("fail")
                        }
                    }
                } else if (beacon_name == "http://www.aditya.com"){
                    print("ADITYA!")
                    isVisited[1] = true
                    isVisited[0] = false
                    isVisited[2] = false
                    
                    let parameters : Parameters = [
                        "userid" : userIds[1]
                    ]
                    
                    Alamofire.request(self.url! + "/patients/notify", method: .post, parameters: parameters, encoding: URLEncoding.default).responseString {
                        (response) in
                        print(response)
                        switch response.result {
                        case .success(let value):
                            print("lolol")
                        case .failure(let error):
                            print("fail")
                        }
                    }
                } else if(beacon_name == "http://www.vineeth.com"){
                    print("VINEETH!")
                    isVisited[0] = false
                    isVisited[1] = false
                    isVisited[2] = true

                    let parameters : Parameters = [
                        "userid" : userIds[2]
                    ]
                    Alamofire.request(self.url! + "/patients/notify", method: .post, parameters: parameters, encoding: URLEncoding.default).responseString {
                        (response) in
                        print(response)
                        switch response.result {
                        case .success(let value):
                            print("lolol")
                        case .failure(let error):
                            print("fail")
                        }
                    }
                }
            }
            
        }
        
        if distance >= 1.0 && isVisited.contains(true)  {
            print("Leaving!")
            
            if isVisited[0] {
                isVisited[0] = false
                
            } else if isVisited[1]{
                isVisited[1] = false
                
            } else {
                isVisited[2] = false
                
            }
            //isVisited = false
            /*
            Alamofire.request(self.url! + "/patients/notify", method: .get, encoding: URLEncoding.default).responseString {
                (response) in
                print(response)
                switch response.result {
                case .success(let value):
                    print("lolol2")
                case .failure(let error):
                    print("fail2")
                }
            }
            */
        }
        
        
        
        // averaging the distances on the distance array
        if(distance_dictionaries[beacon_name]!.count >= 5){
            sum_of_distances[beacon_name]! -=  distance_dictionaries[beacon_name]![distance_dictionaries[beacon_name]!.count - 5]
        }
        distance_dictionaries[beacon_name]!.append(distance)
        sum_of_distances[beacon_name]! += distance
        //print(sum_of_distances[beacon_name]!)
        if(distance_dictionaries[beacon_name]!.count>=6){
            //print("URL SEEN: \(URL), RSSI: \(RSSI), Distance: \(sum_of_distances[beacon_name]! / 5)")
        }
    }
    
    //auxiliary cord
    func getDistance(rssi: Int, txPower: Double) -> Double {
        if (rssi == 0) {
            return -1.0; // if we cannot determine accuracy, return -1.
        }
        
        let ratio = (Double(rssi))/txPower;
        if (ratio < 1.0) {
            return Double(pow(ratio,10));
        }
        else {
            let accuracy =  (0.89976)*pow(ratio,7.7095) + 0.111;
            return accuracy;
        }
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
