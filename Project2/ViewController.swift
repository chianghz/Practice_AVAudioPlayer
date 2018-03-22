//
//  ViewController.swift
//  Project2
//
//  Created by Kevin Chiang on 2018/3/22.
//  Copyright © 2018年 KevinChiangHz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  let nameOfTheSong = "周杰倫 - 簡單愛 HD"

  var songPlayer = AVAudioPlayer()
  
  @IBOutlet weak var lblSpeed: UILabel!
  @IBOutlet weak var slider: UISlider!
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareSongAndSession()
  }
  
  
  // MARK: - Actions
  @IBAction func btn_Pause_Tapped(_ sender: Any) {
    songPlayer.pause()
  }
  @IBAction func btn_Play_Tapped(_ sender: Any) {
    songPlayer.play()
  }
  @IBAction func btn_Stop_Tapped(_ sender: Any) {
    songPlayer.stop()
    songPlayer.currentTime = 0
  }
  @IBAction func slider_ValueChanged(_ sender: Any) {
    lblSpeed.text = String(format: "Speed : %.2fx", slider.value)
    songPlayer.rate = slider.value
  }
  
  
  // MARK: - Methods
  func prepareSongAndSession(){
    
    do {
      // Insert the song from our Bundle
      let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: nameOfTheSong, ofType: "mp3")!)
      songPlayer = try AVAudioPlayer(contentsOf: url)
      
      songPlayer.prepareToPlay()
      songPlayer.enableRate = true
      
      // Create audio session
      do {
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(AVAudioSessionCategoryPlayback)
      } catch let sessionError {
        print(sessionError)
      }
      
    } catch let songPlayerError {
      print(songPlayerError)
    }
  }
  
  
}


