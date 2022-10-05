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
            let image = isChecked ? UIImage(named: "close")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "hamburger")?.withRenderingMode(.alwaysTemplate)
            setImage(image, for: .normal)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(isChecked: Bool) {
        self.isChecked = isChecked
        super.init(frame: .zero)
//        tintColor = Colors.fishtash
        let image = isChecked ? UIImage(named: "close")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "hamburger")?.withRenderingMode(.alwaysTemplate)
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        self.addTarget(self, action: #selector(burgerPressed), for: .touchUpInside)
    }
    
    @objc private func burgerPressed() {
        isChecked = !isChecked
    }
}
