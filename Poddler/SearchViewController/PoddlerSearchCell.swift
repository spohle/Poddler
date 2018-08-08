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
    
    var podcast:Podcast! {
        didSet {
            guard let imageUrl = URL(string: podcast.artworkUrl600 ?? "") else { return }
            uiImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "find"))
        }
    }
    
    func setupUserInterface() {
        contentView.addSubview(uiImageView)
        uiImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        uiImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        uiImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        uiImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUserInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
