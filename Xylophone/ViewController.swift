//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        playSound(soundName: sender.currentTitle)
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            sender.alpha = 1
        }, completion: nil)
    }
    
    

    func playSound(soundName: String?) {
//        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
//        player = try! AVAudioPlayer(contentsOf: url!)
//        player.play()
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }

               do {
                   try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                   try AVAudioSession.sharedInstance().setActive(true)

                   /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                   player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                   /* iOS 10 and earlier require the following line:
                   player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                   guard let player = player else { return }

                   player.play()

               } catch let error {
                   print(error.localizedDescription)
               }
    }
}


