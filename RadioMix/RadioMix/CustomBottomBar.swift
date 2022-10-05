//
//  CustomBottomBar.swift
//  RadioMix
//
//  Created by Dima on 5.10.22.
//

import Foundation
import UIKit
import SnapKit

final class CustomBottomBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        let bottomImage = UIImageView()
        bottomImage.image = UIImage(named: "coin")
        addSubview(bottomImage)
        bottomImage.snp.makeConstraints { make in
            make.left.bottom.top.equalToSuperview()
        }
        
        let bottomLabel = UILabel()
        bottomLabel.text = "Custom Text!"
        addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { make in
            make.left.equalTo(bottomImage.snp.right)
            make.top.bottom.equalToSuperview()
        }
        
    }
}
