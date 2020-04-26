//
//  ListVC.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import UIKit
class ListVC: UIViewController {
    
    let tableView =  UITableView()
    var safeArea : UILayoutGuide!
    var titleHeading: String? = ""
    private let refreshControl = UIRefreshControl()
    private var listViewModel = ListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupView()
        pullToRefresh()
    }
    //MARK:- Making an API call
    func apiCall(){
        ListServices().loadUserList { [unowned self] result in
            switch result {
            case .success(let userlist):
                DispatchQueue.main.async {
                    self.listViewModel.arrListData = userlist.rows!
                    self.listViewModel.heading = userlist
                    self.titleHeading = userlist.title
                    self.setupNavBar()
                    self.tableView.reloadData()
                }
                print("success")
            case .failure( _):
                print("fail")
            }
        }
    }
    //MARK:- ADD PULL TO REFRESH
    func pullToRefresh(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    @objc func refresh(_ sender: AnyObject) {
        tableView.reloadData()
        apiCall()
        refreshControl.endRefreshing()
    }
    
    //MARK:- Setup View
    func setupView(){
        setupTableView()
        setupNavBar()
    }
    //MARK:- NAVIGATION BAR SETUP
    func setupNavBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 12, width: screenSize.width, height: 44))
        let listHeading = titleHeading ?? "List"
        let navItem = UINavigationItem(title: "\(String(describing: listHeading))")
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    //MARK:- TABLE VIEW SETUP
    func setupTableView(){
        //Adding UIView first before adding constraints
        view.addSubview(tableView)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
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
        listViewModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : ListCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? ListCell else {return ListCell()}
        let listVM = self.listViewModel.modelAt(indexPath.row)
        cell.configureList(contentModel: listVM)
        cell.selectionStyle = .none
        return cell
    }
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listViewModel.arrListData.remove(at: 0)
            let indexPath = IndexPath(item: 0, section: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
}
extension ListVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         UITableView.automaticDimension
    }
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if editingStyle == .delete {
//
//        }
//    }
    
}
