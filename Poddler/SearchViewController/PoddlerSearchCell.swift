//
//  PoddlerSearchCell.swift
//  Poddler
//
//  Created by Pohle, Sven on 8/7/18.
//  Copyright © 2018 Pohle, Sven. All rights reserved.
//

import UIKit
import SDWebImage

class PoddlerSearchCell: UITableViewCell {
    let uiImageView:UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let uiTitleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(r: 220, g: 220, b: 220)
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uiAuthorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var podcast:Podcast! {
        didSet {
            let imageUrl = URL(string: podcast.artworkUrl600 ?? "")
            uiImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "find"))
            
            uiTitleLabel.text = podcast.trackName
            uiAuthorLabel.text = podcast.artistName
        }
    }
    
    func setupUserInterface() {
        contentView.addSubview(uiImageView)
        uiImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        uiImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        uiImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        uiImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        contentView.addSubview(uiTitleLabel)
        uiTitleLabel.topAnchor.constraint(equalTo: uiImageView.topAnchor).isActive = true
        uiTitleLabel.leftAnchor.constraint(equalTo: uiImageView.rightAnchor, constant: 5).isActive = true
        uiTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        uiTitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 35).isActive = true
        
        contentView.addSubview(uiAuthorLabel)
        uiAuthorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        uiAuthorLabel.leftAnchor.constraint(equalTo: uiImageView.rightAnchor, constant: 5).isActive = true
        uiAuthorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        uiAuthorLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUserInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
