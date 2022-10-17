//
//  PlayMusicScene.swift
//  RadioMix
//
//  Created by Dima on 12.10.22.
//

import Foundation
import UIKit
import SnapKit

protocol PlayMusicSceneDelegate: AnyObject {
    func playPauseMusicTapped()
    func stopMusicTapped()
    func soundOffTapped()
    func soundOnTapped()
    
}

class PlayMusicScene: UIView {
    
    weak var delegate: PlayMusicSceneDelegate?
    var playButton = UIButton()
    let volumeSlider = UISlider()
    var soundOffButton = UIButton()
    var soundOnButton = UIButton()
    
    
    init(delegate: PlayMusicSceneDelegate) {
        super.init(frame: .zero)
        setupView()
        self.delegate = delegate
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        let radioName = UILabel()
        radioName.text = "RadioNAme"
        addSubview(radioName)
        radioName.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(50)
        }
        
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "coin")
        addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(150)
            make.top.equalToSuperview().inset(300)
        }
        
        let stackActionsMusic = UIStackView()
        stackActionsMusic.axis = .horizontal
        stackActionsMusic.distribution = .fillEqually
        stackActionsMusic.spacing = 8
        addSubview(stackActionsMusic)
        stackActionsMusic.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(50)
            make.top.equalTo(iconImage.snp.bottom).inset(-50)
        }
        
        playButton = FKBurgerButton(isChecked: false)
        playButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        playButton.addTarget(self, action: #selector(pauseTapped), for: .touchUpInside)
        stackActionsMusic.addArrangedSubview(playButton)
        
        let stopMusicButton = button(named: "stop")
        stopMusicButton.addTarget(self, action: #selector(stopTapped), for: .touchUpInside)
        stackActionsMusic.addArrangedSubview(stopMusicButton)
        
        let stackActionsVolume = UIStackView()
        stackActionsVolume.axis = .horizontal
//        stackActionsVolume.distribution = .equalSpacing
        stackActionsVolume.spacing = 8
        addSubview(stackActionsVolume)
        stackActionsVolume.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(50)
            make.top.equalTo(stackActionsMusic.snp.bottom).inset(-50)
            make.height.equalTo(40)
           
        }
        
        soundOffButton = button(named: "sound_off")
        soundOffButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        soundOffButton.addTarget(self, action: #selector(soundOff), for: .touchUpInside)
        stackActionsVolume.addArrangedSubview(soundOffButton)
        
       
        volumeSlider.maximumTrackTintColor = .darkGray
        volumeSlider.minimumTrackTintColor = .lightGray
        volumeSlider.value = 2

        volumeSlider.maximumValue = 3
        volumeSlider.minimumValue = 0
        
        volumeSlider.isContinuous = false
        volumeSlider.addTarget(self, action: #selector(didTapSlider), for: .touchUpInside)

        
        stackActionsVolume.addArrangedSubview(volumeSlider)
        
        
        soundOnButton = button(named: "sound_on_0")
        soundOnButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        soundOnButton.addTarget(self, action: #selector(soundOn), for: .touchUpInside)
        stackActionsVolume.addArrangedSubview(soundOnButton)
        
//        volumeSlider.snp.makeConstraints { make in
//            make.center.equalTo(stackActionsVolume.snp.center)
//        }
        
       
        
//        soundOffImage.snp.makeConstraints { make in
//            make.centerY.equalTo(stackActionsVolume.snp.centerY)
//            make.left.equalToSuperview()
//        }
        
        
    }
    
  
    
    private func button(named: String, collapsed: Bool = false) -> UIButton {
    
        let button = UIButton()
        button.setImage(UIImage(named: named)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .lightGray
        return button
    }
    
    @objc func pauseTapped() {
        delegate?.playPauseMusicTapped()
    }
    
    @objc func stopTapped() {
        delegate?.stopMusicTapped()
    }
    
    @objc func soundOff() {
        delegate?.soundOffTapped()
    }
    
    @objc func soundOn() {
        delegate?.soundOnTapped()
    }
    
    @objc func didTapSlider() {
        
        let currentValue = volumeSlider.value
        
        switch currentValue {
        case 1:
            soundOnButton = button(named: "sound_on_1")
        case 2:
            soundOnButton = button(named: "sound_on_2")
        case 3:
            soundOnButton = button(named: "sound_on_3")
        default:
            soundOnButton = button(named: "sound_on_0")
        }
        
    }
}
