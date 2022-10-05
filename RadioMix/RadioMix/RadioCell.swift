//
//  RadioCell.swift
//  RadioMix
//
//  Created by Dima on 4.10.22.
//

import Foundation
import SnapKit
import UIKit


class RadioCell: UITableViewCell {
    
    static let identifier = "RadioCell"
    
    var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    var radioImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    var radioName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        name.textAlignment = .left
        name.textColor = .brown
        return name
    }()
    
    var discrName: UILabel = {
        let discription = UILabel()
        discription.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        discription.textAlignment = .left
        discription.textColor = .white
        return discription
    }()
    
    func config() {
        
        configImageView()
        configСontainerView()
        configRadioName()
        configdiscrName()
    }
    
    private func configImageView() {
        contentView.addSubview(radioImageView)
        radioImageView.snp.makeConstraints { make in
            make.bottom.top.equalToSuperview()
            make.left.equalToSuperview().inset(15)
        }
    }
    
    private func configСontainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.equalTo(radioImageView.snp.right).inset(5)
            make.right.equalTo(contentView.snp.right)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    private func configRadioName() {
        containerView.addSubview(radioName)
        radioName.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.left.equalTo(containerView.snp.left).inset(20)
        }
    }
    
    private func configdiscrName() {
        containerView.addSubview(discrName)
        discrName.snp.makeConstraints { make in
            make.top.equalTo(radioName.snp.bottom)
            make.left.equalTo(containerView.snp.left).inset(20)
        }
    }
}
