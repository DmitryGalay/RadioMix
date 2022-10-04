//
//  ViewController.swift
//  RadioMix
//
//  Created by Dima on 3.10.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        configTableView()
    }
    
    private func configTableView() {
        
        tableView.backgroundColor = .blue
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.register(RadioCell.self, forCellReuseIdentifier: RadioCell.identifier)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RadioCell.identifier, for: indexPath) as? RadioCell else { return UITableViewCell() }
        cell.backgroundColor = .green
        cell.config()
        cell.radioName.text = "hello"
        cell.discrName.text = "How are you?"
        cell.radioImageView.image = UIImage(named: "coin")
       
        return cell
    }
}

