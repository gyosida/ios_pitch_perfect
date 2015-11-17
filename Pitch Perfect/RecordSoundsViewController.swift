//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Gianfranco Yosida Vilchez on 11/15/15.
//  Copyright © 2015 Gyosida. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var lblRecording: UILabel!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var btnRecord: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    
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
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("finish recording")
    }

    @IBAction func stopRecording(sender: UIButton) {
        self.lblRecording.hidden = true;
        self.btnStop.hidden = true;
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
}

