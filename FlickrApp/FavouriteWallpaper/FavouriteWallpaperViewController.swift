//
//  FavouriteWallpaperViewController.swift
//  FlickrApp
//
//  Created by Chinmay Gawde on 05/06/21.
//

import UIKit
import SDWebImage

class FavouriteWallpaperViewController: UIViewController {
    
    private var dataCtlr : FavouriteWallpaperDataController?
    
    
    @IBOutlet weak var tableViewForFavouriteWallpaper: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataCtlr == nil {
            self.dataCtlr = FavouriteWallpaperDataController()
        }
        
        self.dataCtlr?.getFavWallpaper(onSuccess: {
            DispatchQueue.main.async {
                self.tableViewForFavouriteWallpaper.reloadData()
            }
        }, onFailure: { (message) in
            
        })
        
        tableViewForFavouriteWallpaper.tableFooterView = UIView(frame: .zero)
        tableViewForFavouriteWallpaper.reloadData()
    }
    
    
    
}


extension FavouriteWallpaperViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataCtlr?.arrayOfFavWallpaper.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewForFavouriteWallpaper.dequeueReusableCell(withIdentifier: "cellForFavourites", for: indexPath)as! FavouriteTableViewCell
        cell.imageForFavourite.sd_setImage(with: URL(string:  (dataCtlr?.arrayOfFavWallpaper[indexPath.row])!), placeholderImage: UIImage(named: "icon"))
        
        cell.load()
        
        return cell
    }
    
    
}
