//
//  PlayViewController.swift
//  RadioMix
//
//  Created by Dima on 6.10.22.
//

import UIKit
import SnapKit

class PlayViewController: UIViewController {
   
    private var musicScene: PlayMusicScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appendElement()
    }
    

}

private extension PlayViewController {
    
    func appendElement() {
        radioBackgroundImage()
        setupTopView()
    }
    
    
    
     func radioBackgroundImage() {
         let backgroundImage = UIImageView()
         backgroundImage.frame = view.bounds
         backgroundImage.image = UIImage(named: "background")
         view.addSubview(backgroundImage)
     }
    
    func setupTopView() {
        navigationController?.navigationBar.isHidden = true
        let musicScene = PlayMusicScene(delegate: self)
        self.musicScene = musicScene
        view.addSubview(musicScene)
        musicScene.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}

extension PlayViewController: PlayMusicSceneDelegate {
    
    func playPauseMusicTapped() {
        
    }
    
    func stopMusicTapped() {
        
    }
    
    func soundOffTapped() {
        
    }
    
    func soundOnTapped() {
        
    }
    
}
