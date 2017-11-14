//
//  ViewController.swift
//  CAFVuMeter
//
//  Created by fourni-j on 11/13/2017.
//  Copyright (c) 2017 fourni-j. All rights reserved.
//

import UIKit
import CAFVuMeter

class ViewController: UIViewController {

    @IBOutlet weak var vuMeter: VuMeterView!

    var updateTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(updateVuMeterValue), userInfo: nil, repeats: true)
            
    }

    @objc
    func updateVuMeterValue() {
        let value = arc4random_uniform(100)
        vuMeter.setValue(newValue: Int(value))
    }
    
}

