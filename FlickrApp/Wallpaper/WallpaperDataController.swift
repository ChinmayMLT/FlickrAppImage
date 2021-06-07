//
//  WallpaperDataController.swift
//  FlickrApp
//
//  Created by Chinmay Gawde on 06/06/21.
//

import Foundation
import OhhAuth

class WallpaperDataController{
    
    var arrayOfWallpaper = [Photo]()
    
    
    func getWallpaper(onSuccess:@escaping ()->Void , onFailure:@escaping (_ result: String)->Void)
    {
        APIManager.sharedInstance.httpGETCall(flickrMethod: .galleryPhotos, id: .galleryId , success: { (responseFromServer) in
            
            
            if let dataFromServer = responseFromServer as? Data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Flickr.self, from: dataFromServer)
                    var idAndImageUrl = [Photo]()
                    idAndImageUrl.append(contentsOf: responseModel.photos.photo)
                    
                    DispatchQueue.main.async {
                        self.arrayOfWallpaper = idAndImageUrl
                        //print("After changing url\(self.arrayOfWallpaper)")
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
    
    
    func addPhotoToFav(id: String) {
        
        // Prepare URL
        let url = URL(string: "https://www.flickr.com/services/rest/")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "method=flickr.favorites.add&photo_id=47396102411&format=json&nojsoncallback=1";
        
        let params: [String: String] = [
            "method": "flickr.favorites.add",
            "photo_id": "50874348771",
            "format": "json",
            "nojsoncallback": "1"
        ]
        
        
        let oauth_nonce = UUID().uuidString
        let oauth_timestamp = String(Int(NSDate().timeIntervalSince1970))
        let cc = (key: "b4305dd13571584ea86fc19478f9e783", secret: "b37db3870bee6300")
        _ = (key: "72157719371084625-11eda95b361ae65d", secret: "88a693f63eff182a")
        
        
//        let oauth_signature: () =   request.oAuthSign(method: request.httpMethod ?? "POST", urlFormParameters: params, consumerCredentials: cc)
        
//        request.setValue("OAuth oauth_consumer_key=\"b4305dd13571584ea86fc19478f9e783\",oauth_token=\"72157719371084625-11eda95b361ae65d\",oauth_signature_method=\"HMAC-SHA1\",oauth_timestamp=\"\(oauth_timestamp)\",oauth_nonce=\"\(oauth_nonce)\",oauth_version=\"1.0\",oauth_verifier=\"600ac655fb4e9ac4\",oauth_signature=\"KKfXkt0UuzaqCYO3KRHZURRxMDs=\"", forHTTPHeaderField: "Authorization")
        
//        request.setValue("OAuth oauth_consumer_key=\"b4305dd13571584ea86fc19478f9e783\",oauth_token=\"72157719371084625-11eda95b361ae65d\",oauth_signature_method=\"HMAC-SHA1\",oauth_timestamp=\"\(oauth_timestamp)\",oauth_nonce=\"\(oauth_nonce)\",oauth_version=\"1.0\",oauth_verifier=\"600ac655fb4e9ac4\",oauth_signature=\"KKfXkt0UuzaqCYO3KRHZURRxMDs=\"", forHTTPHeaderField: "Authorization")
        
        request.setValue("OAuth oauth_consumer_key=\"b4305dd13571584ea86fc19478f9e783\",oauth_token=\"72157719371084625-11eda95b361ae65d\",oauth_signature_method=\"HMAC-SHA1\",oauth_timestamp=\"1623038704\",oauth_nonce=\"l82iWfTOyom\",oauth_version=\"1.0\",oauth_verifier=\"12bdabf204a166f1\",oauth_signature=\"TZpp84q0HrzC7ETC1%2BVQCaphbzQ%3D\"", forHTTPHeaderField: "Authorization")
        
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
              //  print ("this o auth\(oauth_signature)")
            }
        }
        task.resume()
        
    }
    
    
}

