//
//  MenuCell.swift
//  BeResp
//
//  Created by Paul Lavoine on 27/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

struct MenuCellConstant {
    static let reuseIdentifier    = "MenuCell"
}

class MenuCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with type: MenuType) {
        titleLabel.text = type.rawValue
        iconImageView.image = type.image()
    }
        
}
