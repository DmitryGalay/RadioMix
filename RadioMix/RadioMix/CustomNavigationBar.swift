//
//  CustomNavigationBar.swift
//  RadioMix
//
//  Created by Dima on 5.10.22.
//

import Foundation
import UIKit
import SnapKit

protocol CustomNavigationBarDelegate: AnyObject {
    func searchButtonTapped()
    func accountButtonTapped()
    func menuButtonTapped()
}

final class CustomNavigationBar: UIView {
    
    private var heightConstraint: NSLayoutConstraint?
    weak var delegate: CustomNavigationBarDelegate?
    public var  hamburgerButton = UIButton()
    
    init(delegate: CustomNavigationBarDelegate) {
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
        
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "radioMix")
        addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(10)
//            make.height.size.equalToSuperview().inset(5)
        }
        
//        let stackButtons = UIStackView()
//        stackButtons.axis = .horizontal
//        stackButtons.distribution = .fillEqually
//        addSubview(stackButtons)
//        stackButtons.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            stackButtons.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            stackButtons.centerYAnchor.constraint(equalTo: centerYAnchor),
//            stackButtons.heightAnchor.constraint(equalToConstant: 24),
//            stackButtons.widthAnchor.constraint(equalToConstant: 110),
//        ])
        
//        let searchButton = button(named: "coin")
//        searchButton.addTarget(self, action: #selector(onSearchButtonTapped), for: .touchUpInside)
//        stackButtons.addArrangedSubview(searchButton)
//
//        let profileButton = button(named: "coin")
//        profileButton.addTarget(self, action: #selector(onAccountButtonTapped), for: .touchUpInside)
//        stackButtons.addArrangedSubview(profileButton)
//
        hamburgerButton = FKBurgerButton(isChecked: false)
        hamburgerButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        hamburgerButton.addTarget(self, action: #selector(onMenuButtonTapped), for: .touchUpInside)
        
        addSubview(hamburgerButton)
        hamburgerButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(50)
        }
//        stackButtons.addArrangedSubview(hamburgerButton)
    }
    
//    private func button(named: String, collapsed: Bool = false) -> UIButton {
//        let button = UIButton()
//        button.setImage(UIImage(named: named)?.withRenderingMode(.alwaysTemplate), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
//        if collapsed {
//            button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
//        }
//        return button
//    }
    
//    @objc func onAccountButtonTapped() {
//        delegate?.accountButtonTapped()
//    }
//
    @objc func onMenuButtonTapped() {
        delegate?.menuButtonTapped()
    }
//
//    @objc func onSearchButtonTapped() {
//        delegate?.searchButtonTapped()
//    }
}

