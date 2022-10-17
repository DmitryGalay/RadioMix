//
//  CustomBottomBar.swift
//  RadioMix
//
//  Created by Dima on 5.10.22.
//

import Foundation
import UIKit
import SnapKit

protocol CustomBottomBarDelegate: AnyObject {
    
}

final class CustomBottomBar: UIView {
    
    weak var delegate: CustomBottomBarDelegate?
    
    init(delegate: CustomBottomBarDelegate) {
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
        
//        let jeremyGif = UIImage.gifImageWithName("wave(white)")
//          let imageView = UIImageView(image: jeremyGif)
//          imageView.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
//          view.addSubview(imageView)
        
//     let bottomImage = UIImageView()
      //  let jeremyGif = UIImage.gifImageWithName("coin")
      //    let bottomImage = UIImageView(image: jeremyGif)
//      bottomImage.image = UIImage(named: "wave")
//        bottomImage.tintColor = .lightGray
//        bottomImage.contentMode = .scaleAspectFit
        
        let logoButton = button(named: "wave")
        
//        logoButton.addTarget(self, action: #selector(onMenuButtonTapped), for: .touchUpInside)
        logoButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        addSubview(logoButton)
       
        
        logoButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(10)
        }
        
        let bottomLabel = UILabel()
        bottomLabel.text = "Choose a station above to begin"
        bottomLabel.textColor = .lightGray
        addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { make in
            make.left.equalTo(logoButton.snp.right).offset(20)
            make.top.bottom.equalToSuperview()
        }
    }
        private func button(named: String, collapsed: Bool = false) -> UIButton {
       
       let button = UIButton()
       button.setImage(UIImage(named: named)?.withRenderingMode(.alwaysTemplate), for: .normal)
       button.imageView?.contentMode = .scaleAspectFit
       button.tintColor = .lightGray
       return button
   }
    
}
