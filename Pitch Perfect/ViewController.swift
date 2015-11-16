//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Gianfranco Yosida Vilchez on 11/15/15.
//  Copyright © 2015 Gyosida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblRecording: UILabel!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var btnRecord: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.btnStop.hidden = true;
        self.btnRecord.enabled = true;
    }

    @IBAction func recordButton(sender: AnyObject) {
        self.btnRecord.enabled = false;
        self.lblRecording.hidden = false;
        self.btnStop.hidden = false;
    }

    @IBAction func stopRecording(sender: UIButton) {
        self.lblRecording.hidden = true;
        self.btnStop.hidden = true;
    }
}

