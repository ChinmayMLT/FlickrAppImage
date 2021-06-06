//
//  WallpaperViewController.swift
//  FlickrApp
//
//  Created by Chinmay Gawde on 05/06/21.
//

import UIKit
import SDWebImage

class WallpaperViewController: UIViewController {
    
    private var dataCtlr : WallpaperDataController?
    
    @IBOutlet weak var tableViewForWallpapers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dataCtlr == nil {
            self.dataCtlr = WallpaperDataController()
        }
        
        self.dataCtlr?.getWallpaper(onSuccess: {
            DispatchQueue.main.async {
                self.tableViewForWallpapers.reloadData()
            }
        }, onFailure: { (message) in
            
        })
        
        tableViewForWallpapers.tableFooterView = UIView(frame: .zero)
        tableViewForWallpapers.reloadData()
    }
    
    
    
}

extension WallpaperViewController: UITableViewDataSource , UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataCtlr?.arrayOfWallpaper.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewForWallpapers.dequeueReusableCell(withIdentifier: "cellForWallpaper", for: indexPath)as! WallpaperTableViewCell
        
        cell.imageForWallpaper.sd_setImage(with: URL(string: dataCtlr?.arrayOfWallpaper[indexPath.row].urlo ?? "" ), placeholderImage: UIImage(named: "icon"))
        
        cell.buttonAddtoFavourites.tag = indexPath.row
        cell.buttonAddtoFavourites.addTarget(self, action: #selector(buttonAddToFav), for: .touchUpInside)
        
        cell.loadCell()
        
        return cell
    }
    
    @objc func buttonAddToFav(sender:UIButton){
        let index = IndexPath(row: sender.tag, section: 0)
        let id =  dataCtlr?.arrayOfWallpaper[index.row].id
        
        if (id == nil) {
            let message = "Photo Already exist or Error saving it"
            showAlert(message: message)
        }else{
            dataCtlr?.addPhotoToFav(id: id ?? "")
            let message = "Photo is added to favourite"
            showAlert(message: message)
        }
        
        
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title: "", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    
    
}
