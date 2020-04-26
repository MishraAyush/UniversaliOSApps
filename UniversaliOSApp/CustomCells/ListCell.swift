//
//  ListCell.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
import UIKit
class ListCell : UITableViewCell{
    var safeArea : UILayoutGuide!
    var imageIV = UIImageView()
    let cellTitleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    //MARK:- FILLING IN THE VALUE IN TABLE VIEW
    func configureList(contentModel : SubTitle){

        self.cellTitleLabel.text = contentModel.title
        self.descriptionLabel.text = contentModel.description
        guard let imageStr = contentModel.imageHref else { return }
        if let url = URL(string: imageStr){
            imageIV.loadImages(url: url)
        }
        if (contentModel.title == nil) && (contentModel.description == nil){
            imageIV.heightAnchor.constraint(equalToConstant: 0).isActive = true
            descriptionLabel.heightAnchor.constraint(equalToConstant: 0).isActive = true
            cellTitleLabel.heightAnchor.constraint(equalToConstant: 00).isActive = true
        }
        reloadInputViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder not implemented")
    }
    
    func setupView(){
        safeArea = layoutMarginsGuide
        setupImageView()
        setupNameLabel()
        setupDescriptionLabel()
    }
    
    func setupImageView(){
        addSubview(imageIV)
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.backgroundColor = .lightGray
    }
    func setupNameLabel(){
        
        addSubview(cellTitleLabel)
        cellTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTitleLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 8).isActive = true
        cellTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 4).isActive = true
        cellTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor , constant: 8).isActive = true
        if cellTitleLabel.text == ""{
            cellTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        cellTitleLabel.font = UIFont(name:"Verdana-Bold", size: 16)
        cellTitleLabel.sizeToFit()
        cellTitleLabel.numberOfLines = 0
        
    }
    
    func setupDescriptionLabel(){
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: cellTitleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor , constant: 8).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor).isActive = true
        
        descriptionLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 8).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        descriptionLabel.font = UIFont(name: "Verdana", size: 14)
        descriptionLabel.sizeToFit()
        descriptionLabel.numberOfLines = 0
        
    }
}
