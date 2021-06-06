//
//  WallpaperTableViewCell.swift
//  FlickrApp
//
//  Created by Chinmay Gawde on 05/06/21.
//

import UIKit

class WallpaperTableViewCell: UITableViewCell {

    @IBOutlet weak var viewForCard: UIView!
    @IBOutlet weak var imageForWallpaper: UIImageView!
    
    @IBOutlet weak var buttonAddtoFavourites: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func loadCell(){
        self.viewForCard.layer.shadowColor = UIColor.lightGray.cgColor
        self.viewForCard.layer.shadowOpacity = 0.5
        self.viewForCard.layer.shadowOffset = .zero
        self.viewForCard.layer.shadowRadius = 10
        self.viewForCard.layer.cornerRadius = 10
        
        
        self.imageForWallpaper.layer.shadowColor = UIColor.lightGray.cgColor
        self.imageForWallpaper.layer.shadowOpacity = 0.5
        self.imageForWallpaper.layer.shadowOffset = .zero
        self.imageForWallpaper.layer.shadowRadius = 10
        self.imageForWallpaper.layer.cornerRadius = 10
        
        self.buttonAddtoFavourites.layer.shadowColor = UIColor.lightGray.cgColor
        self.buttonAddtoFavourites.layer.shadowOpacity = 0.3
        self.buttonAddtoFavourites.layer.shadowOffset = .zero
        self.buttonAddtoFavourites.layer.shadowRadius = 10
        self.buttonAddtoFavourites.layer.cornerRadius = 10
        self.selectionStyle = .none
    }
    
    
}
