//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Gianfranco Yosida Vilchez on 11/16/15.
//  Copyright © 2015 Gyosida. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let fileUrl = NSURL.fileURLWithPath(filePath)
            audioPlayer = try! AVAudioPlayer(contentsOfURL: fileUrl)
            audioPlayer.enableRate = true
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop()
    }
    
    @IBAction func makeFastPlay(sender: UIButton) {
        playAudio(1.5)
    }

    @IBAction func makeSlowPlay(sender: UIButton) {
        playAudio(0.5)
    }
    
    func playAudio(rate : float_t) {
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }

}
