//
//  FavouriteWallpaperDataController.swift
//  FlickrApp
//
//  Created by Chinmay Gawde on 05/06/21.
//

import Foundation

class FavouriteWallpaperDataController{
    
    var arrayOfFavWallpaper = [String]()
        
    func getFavWallpaper(onSuccess:@escaping ()->Void , onFailure:@escaping (_ result: String)->Void)
    {
        APIManager.sharedInstance.httpGETCall(flickrMethod: .favouritePhotos, id: .userId, success: { (responseFromServer) in
            
            
            if let dataFromServer = responseFromServer as? Data {
                do {
                    let jsonDecoder = JSONDecoder()
                                        let responseModel = try jsonDecoder.decode(Flickr.self, from: dataFromServer)
                                        let count: Int = responseModel.photos.photo.count
                    
                    
                                        var imageUrls = [String]()
                    
                                        for i in 0...count - 1 {
                                            imageUrls.append(responseModel.photos.photo[i].urlo ?? "" )
                    
                                        }
                    
                                        DispatchQueue.main.async {
                                            self.arrayOfFavWallpaper = imageUrls
                                           // print("After changes\(self.arrayOfFavWallpaper)")
                                            onSuccess()
                    }
                } catch  { // 3
                    print("Json error")
                    onFailure("");
                }
            }
            else{
                
                onFailure("");
            }
            
        }) { (error) in
            //Error Handling
            onFailure("");
        }
        
        
        
    }
    
}

