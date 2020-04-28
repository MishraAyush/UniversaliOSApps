//
//  ListCell.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//


import UIKit
import SDWebImage
class ListCell : UITableViewCell{
    var safeArea : UILayoutGuide!
    var imageIV = SDAnimatedImageView()
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
            imageIV.sd_setImage(with:  url , placeholderImage: UIImage(named: "cameraup"),options: SDWebImageOptions.allowInvalidSSLCertificates, completed: nil)
        }
//        imageIV.reloadInputViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError(GlobalConstants.KFatalError)
    }
    
    func setupView(){
        safeArea = layoutMarginsGuide
        setupImageView()
        setupNameLabel()
        setupDescriptionLabel()
    }
//    MARK:- Image view constraint setup and add it as a subview
    func setupImageView(){
        addSubview(imageIV)
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    //    MARK:- Name Label constraint setup and add it as a subview
    func setupNameLabel(){
        
        addSubview(cellTitleLabel)
        cellTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTitleLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 8).isActive = true
        cellTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 4).isActive = true
        cellTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor , constant: 8).isActive = true
        if cellTitleLabel.text == ""{
            cellTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        cellTitleLabel.font = UIFont(name:GlobalConstants.KLabelBoldFont, size: 16)
        cellTitleLabel.sizeToFit()
        cellTitleLabel.numberOfLines = 0
        
    }
    //    MARK:- Description Label constraint setup and add it as a subview
    func setupDescriptionLabel(){
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: cellTitleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor , constant: 8).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor).isActive = true
        
        descriptionLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 8).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        descriptionLabel.font = UIFont(name: GlobalConstants.KLabelFont, size: 14)
        descriptionLabel.sizeToFit()
        descriptionLabel.numberOfLines = 0
        
    }
}
