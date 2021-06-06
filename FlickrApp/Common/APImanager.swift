//
//  APImanager.swift
//  FlickrApp
//
//  Created by Chinmay Gawde on 06/06/21.
//

import UIKit

enum FlickrApiMethods {
    case galleryPhotos
    case favouritePhotos
}

enum IdsAvaliable {
    case userId
    case galleryId
}

public class APIManager: NSObject {
    static let sharedInstance = APIManager(); // made instance to access the class(SINGLETON)
    
    private override init() {}
    
    
    func httpGETCall(flickrMethod: FlickrApiMethods ,id: IdsAvaliable ,  success: @escaping (_ serverResponse: Any) ->(), failure: @escaping (_ error: NSError) ->())
    {
        
        
        let strUrl = Constant.BaseUrls.kAPIBaseUrl + "?method=" + getAPIflickrMethodForEnum(availableFlickrMethods: flickrMethod) + "&api_key=" + Constant.ApiKeys.kApiKey + "&" + getAPIavaliableIdEnum(avaliableIds: id) + "&format=" + Constant.ResponseFormat.kFormat + "&extras=" + Constant.ExtraParamForImage.urlo
        
        
        let url = URL(string: strUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.httpShouldHandleCookies = true
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if ((error) == nil)
            {
                success(data as Any)
                
            }
            else{
                let userInfo: [AnyHashable : Any] =
                    [
                        
                        NSLocalizedDescriptionKey :  NSLocalizedString("Unauthorized", value: Constant.Alerts.kUnableToReachServer, comment: "") ,
                        
                        NSLocalizedFailureReasonErrorKey : NSLocalizedString("Unauthorized", value: Constant.Alerts.ERROR_KEY, comment: "")
                    ]
                let err = NSError(domain: "HttpResponseErrorDomain", code: 500, userInfo: userInfo as? [String : Any])
                
                failure(err);
            }
            
        }.resume()
        
    }
    
}



private func getAPIflickrMethodForEnum(availableFlickrMethods : FlickrApiMethods)->String {
    
    
    switch availableFlickrMethods {
    case .galleryPhotos:
        return Constant.FlickrMethods.getGalleryPhotos
        
    case .favouritePhotos:
        return Constant.FlickrMethods.getFavouritePhotos
        
    }
}

private func getAPIavaliableIdEnum(avaliableIds : IdsAvaliable)->String {
    
    switch avaliableIds {
    case .userId:
        return Constant.RequiredIds.userid
        
    case .galleryId:
        return Constant.RequiredIds.galleryId
        
    }
}
