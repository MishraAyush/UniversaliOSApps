//
//  ListVC.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
import UIKit
class ListVC: UIViewController {
    
    let tableView =  UITableView()
    var safeArea : UILayoutGuide!
    var arrList = ["Ayush" , "Ankit" , "Virat"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupView()
    }
    
    
    
    //MARK:- Setup View
    func setupView(){
        setupTableView()
        setupNavBar()
    }
    func setupNavBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 12, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Title")
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    func setupTableView(){
        //Adding UIView first before adding constraints
        view.addSubview(tableView)
        tableView.register(ListCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor , constant: 44).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.reloadData()
        
    }
    
}

//MARK:- UITableViewDataSource
extension ListVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : ListCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? ListCell else {return ListCell()}
        return cell
    }

    
}

