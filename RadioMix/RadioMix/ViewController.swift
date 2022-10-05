//
//  ViewController.swift
//  RadioMix
//
//  Created by Dima on 3.10.22.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    private  let tableView = UITableView()
    private var navigationBar: CustomNavigationBar?
    private var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioBackgroundImage()
//        view.backgroundColor = .darkGray
        
        configTableView()
        setupView()
        
    }
    
    private func radioBackgroundImage() {
        let backgroundImage = UIImageView()
        backgroundImage.frame = view.bounds
        backgroundImage.image = UIImage(named: "background")
        view.addSubview(backgroundImage)
    }
    
    private func configTableView() {
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.register(RadioCell.self, forCellReuseIdentifier: RadioCell.identifier)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RadioCell.identifier, for: indexPath) as? RadioCell else { return UITableViewCell() }
        cell.config()
        cell.radioName.text = "hello"
        cell.discrName.text = "How are you?"
        cell.radioImageView.image = UIImage(named: "coin")
        cell.backgroundColor = .clear
        return cell
    }
}

private extension MainViewController {
    
    struct Constants {
        static let collapsed: CGFloat = 32
        static let normal: CGFloat = 48
    }
    
    func setupView() {
        navigationController?.navigationBar.isHidden = true
        let navigationBar = CustomNavigationBar(delegate: self)
        self.navigationBar = navigationBar
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.backgroundColor = .red
        view.addSubview(navigationBar)
        
        heightConstraint = navigationBar.heightAnchor.constraint(equalToConstant: 48)
        heightConstraint?.isActive = true
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    func updateMode(collapsed: Bool) {
        var newHeight: CGFloat?
        if collapsed, heightConstraint?.constant == Constants.normal {
            newHeight = Constants.collapsed
        } else if !collapsed, heightConstraint?.constant == Constants.collapsed {
            newHeight = Constants.normal
        }
        
        if let newHeight = newHeight {
            self.heightConstraint?.constant = newHeight
            UIView.animate(withDuration: 0.3, delay: 0.1, options: [collapsed ? .curveEaseIn : .curveEaseOut]) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let topSafeAreaOffset = UIApplication.shared.windows.filter { $0.isKeyWindow}.first?.safeAreaInsets.top ?? 0
        updateMode(collapsed: scrollView.contentOffset.y + topSafeAreaOffset > 48)
    }
}

extension MainViewController: CustomNavigationBarDelegate {
    
    func searchButtonTapped() {
        print("searchButtonTapped")
    }
    
    func accountButtonTapped() {
        print("accountButtonTapped")
    }
    
    func menuButtonTapped() {
        print("menuButtonTapped")
    }
}

