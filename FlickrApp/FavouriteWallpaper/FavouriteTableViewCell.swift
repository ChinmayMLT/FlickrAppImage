//
//  FavouriteTableViewCell.swift
//  FlickrApp
//
//  Created by Chinmay Gawde on 05/06/21.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var imageForFavourite: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func load(){
        self.imageForFavourite.layer.shadowColor = UIColor.lightGray.cgColor
        self.imageForFavourite.layer.shadowOpacity = 1
        self.imageForFavourite.layer.shadowOffset = .zero
        self.imageForFavourite.layer.shadowRadius = 10
        self.imageForFavourite.layer.cornerRadius = 10
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowOpacity = 1
        self.contentView.layer.shadowOffset = .zero
        self.contentView.layer.shadowRadius = 10
        self.selectionStyle = .none
        
    }
}
