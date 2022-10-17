//
//  BurgerButton.swift
//  RadioMix
//
//  Created by Dima on 5.10.22.
//

import Foundation
import UIKit

class FKBurgerButton: UIButton {
    
    var isChecked: Bool = false {
        didSet {
            let image = isChecked ? UIImage(named: "play")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate)
            setImage(image, for: .normal)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(isChecked: Bool) {
        self.isChecked = isChecked
        super.init(frame: .zero)
        tintColor = .lightGray
        let image = isChecked ? UIImage(named: "play")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate)
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        self.addTarget(self, action: #selector(burgerPressed), for: .touchUpInside)
    }
    
    @objc private func burgerPressed() {
        isChecked = !isChecked
    }
}
