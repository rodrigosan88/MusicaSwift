//
//  ViewController.swift
//  Musica
//
//  Created by iOS on 03/06/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var backgroundMusicPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var tfMusica: UITextField!
    
    
    @IBAction func tocar(sender: AnyObject) {
        playBackgroundMusic(tfMusica.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playBackgroundMusic(filename: String) {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }

}

