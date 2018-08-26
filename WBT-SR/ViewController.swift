//
//  ViewController.swift
//  WBT-SR
//
//  Created by Christian Cosio on 8/25/18.
//  Copyright © 2018 Christian Cosio. All rights reserved.
//

import UIKit
import CocoaMQTT

class ViewController: UIViewController {

    let mqttClient = CocoaMQTT(clientID: "iOS Device", host:"192.168.1.226", port: 1883)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gpio40SW(_ sender: UISwitch) {
        if sender.isOn {
            mqttClient.publish("rpi/gpio", withString: "on")
        }
        else {
            mqttClient.publish("rpi/gpio", withString: "off")
        }
    }
    @IBAction func connectButton(_ sender: UIButton) {
        mqttClient.connect()
    }
    
    @IBAction func disconnectButton(_ sender: UIButton) {
        mqttClient.disconnect()
    }
}

