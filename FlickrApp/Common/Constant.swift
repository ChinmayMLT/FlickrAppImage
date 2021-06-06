//
//  Constants.swift
//  FlickrApp
//
//  Created by Chinmay Gawde on 06/06/21.
//

import UIKit
public struct Constant{
    

    struct ApiKeys {
        static let kApiKey = "b4305dd13571584ea86fc19478f9e783"
    }
    
    struct ResponseFormat {
        static let kFormat = "json&nojsoncallback=1"
    }
    
    struct ExtraParamForImage {
        static let urlo = "url_o"
    }
    
    struct FlickrMethods {
        static let getGalleryPhotos = "flickr.galleries.getPhotos"
        static let getFavouritePhotos = "flickr.favorites.getList"
    }
    
    struct RequiredIds {
        static let galleryId = "gallery_id=72157718691316261"
        static let userid = "user_id=193122164%40N03"

    }
    
    struct BaseUrls {
        static let kAPIBaseUrl = "https://www.flickr.com/services/rest/"
    }
    
   
 
    struct Alerts {
        static let kUnableToReachServer = "Unable to reach server"
        static let TRY_AGAIN = "Try Again"
        static let ERROR_KEY = "Error"
        static let OK = "Ok"
        
    }

}
